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

  Future<List<Command>> commands() async {
    final source = await runCommandUtf8("cat .shino");
    return Command.parse(source);
  }
}

class Command {
  final String name;
  final String description;
  final String command;

  Command({
    required this.name,
    required this.description,
    required this.command,
  });

  // format:
  // # ignore
  //
  // # name
  // # description
  // command
  //
  // # ignore
  static List<Command> parse(String source) {
    final commands = <Command>[];

    final lines = source.split("\n") + [""];
    final description = [];
    final command = [];

    for (final line in lines) {
      if (line.startsWith("#")) {
        description.add(line.substring(1).trim());
      } else if (line.isEmpty) {
        if (command.isNotEmpty) {
          commands.add(Command(
            name: description.first,
            description: description.skip(1).join("\n"),
            command: command.join("\n"),
          ));
        }

        description.clear();
        command.clear();
      } else {
        command.add(line.trim());
      }
    }

    return commands;
  }
}
