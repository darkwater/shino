import 'dart:convert';

import 'package:dartssh2/dartssh2.dart';

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

  Future<double> memoryUsage() async {
    final free = await runCommandUtf8("free");

    final lines = free.split("\n");
    final headers = lines[0].split(RegExp(" +")).skip(1);
    final values = lines[1].split(RegExp(" +")).skip(1).map(int.parse);

    final named = Map.fromIterables(headers, values);

    final total = named["total"]!.toDouble();
    final available = named["available"]!.toDouble();

    return 1 - available / total;
  }
}
