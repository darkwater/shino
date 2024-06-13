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
