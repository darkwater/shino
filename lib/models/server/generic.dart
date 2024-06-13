import 'dart:convert';

import 'package:dartssh2/dartssh2.dart';
import 'package:shino/models/bytes.dart';
import 'package:shino/models/command.dart';
import 'package:shino/models/filesystem.dart';
import 'package:shino/models/memory.dart';

import 'nixos.dart';
import 'macos.dart';

class GenericServer {
  final SSHClient client;

  GenericServer(this.client);

  Future<GenericServer> discover() async {
    final os = await runCommandUtf8("uname");

    if (os.contains("Darwin")) {
      return MacosServer(client);
    }

    if (os.contains("Linux")) {
      final issue = await runCommandUtf8("cat /etc/issue");

      if (issue.contains("NixOS")) {
        return NixOsServer(client);
      }
    }

    return this;
  }

  Future<String> runCommandUtf8(String command) async {
    return utf8.decode(await client.run(command, stderr: false));
  }

  Future<List<double>> loadAverages() async => (await runCommandUtf8("uptime"))
      .split("\n")
      .first
      .split(RegExp(r"load averages?: "))
      .last
      .split(RegExp(r"[, ]+"))
      .take(3)
      .map((e) => double.parse(e))
      .toList();

  Future<int> cpuCount() async => int.parse(await runCommandUtf8("nproc"));

  Future<Memory> memoryUsage() async {
    final free = await runCommandUtf8("free");

    final lines = free.split("\n");
    final headers = lines[0].split(RegExp(" +")).skip(1);
    final values = lines[1].split(RegExp(" +")).skip(1).map(int.parse);

    final named = Map.fromIterables(headers, values);

    final total = named["total"]!;
    final available = named["available"]!;

    return Memory(
      total: Bytes(kilobytes: total),
      used: Bytes(kilobytes: total - available),
    );
  }

  Future<List<Command>> commands() async {
    final source = await runCommandUtf8("cat .shino");
    return Command.parse(source);
  }

  Future<List<Filesystem>> filesystems() async {
    final source = await runCommandUtf8("df -k");
    final lines = source.split("\n");
    final headers = lines.first.split(RegExp(" +"));
    final values = lines
        .skip(1)
        .where((line) => line.startsWith("/dev/"))
        .map((line) => line.split(RegExp(" +")));

    final named = values.map(
      (line) => Map.fromIterables(headers.take(line.length), line),
    );

    return named
        .map(
          (fs) => Filesystem(
            device: fs["Filesystem"]!,
            total: Bytes(
              bytes: int.parse((fs["1K-blocks"] ?? fs["1024-blocks"])!),
            ),
            used: Bytes(
              bytes: int.parse(fs["Used"]!),
            ),
            available: Bytes(
              bytes: int.parse(fs["Available"]!),
            ),
            mountpoint: fs["Mounted"]!,
          ),
        )
        .toList();
  }
}
