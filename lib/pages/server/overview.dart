import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shino/models/command.dart';
import 'package:shino/models/server_details.dart';
import 'package:shino/providers/servers.dart';

part 'overview.g.dart';

@riverpod
Future<List<Command>> commands(CommandsRef ref, ServerDetails details) async {
  final server = await ref.watch(serverModelProvider(details).future);
  return await server.commands();
}

class OverviewPage extends ConsumerWidget {
  final ServerDetails server;

  const OverviewPage(this.server, {super.key});

  static Route route(ServerDetails server) =>
      MaterialPageRoute<void>(builder: (_) => OverviewPage(server));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(server.name),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(commandsProvider(server).future),
        child: ref.watch(commandsProvider(server)).when(
              data: (commands) => ListView.builder(
                itemCount: commands.length,
                itemBuilder: (context, index) {
                  final command = commands[index];
                  return ListTile(
                    title: Text(command.name),
                    subtitle: Text(
                      command.description.isNotEmpty
                          ? command.description
                          : command.command,
                    ),
                    onTap: () async {
                      final model =
                          await ref.read(serverModelProvider(server).future);

                      final result =
                          (await model.runCommandUtf8(command.command)).trim();

                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            result.isNotEmpty ? result : "Command executed",
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(
                child: Text("Error: $error"),
              ),
            ),
      ),
    );
  }
}
