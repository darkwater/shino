import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shino/models/server_details.dart';
import 'package:shino/pages/server/overview.dart';
import 'package:shino/providers/servers.dart';

part 'card.g.dart';

@riverpod
Future<double> _load(_LoadRef ref, ServerDetails details) async {
  final server = await ref.watch(serverModelProvider(details).future);

  final nproc = await server.cpuCount();
  final load = (await server.loadAverages()).map((v) => v / nproc).toList();

  Timer(const Duration(seconds: 5), () => ref.invalidateSelf());

  return load.first;
}

@riverpod
Future<double> _memory(_MemoryRef ref, ServerDetails details) async {
  final server = await ref.watch(serverModelProvider(details).future);

  Timer(const Duration(seconds: 5), () => ref.invalidateSelf());

  return await server.memoryUsage();
}

class ServerListCard extends ConsumerWidget {
  final ServerDetails server;

  const ServerListCard(this.server, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push<void>(
            OverviewPage.route(server),
          );
        },
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(server.name),
                    subtitle: Text(
                      server.port == 22
                          ? server.host
                          : "${server.host}:${server.port}",
                    ),
                  ),
                ),
                _MiniGauge(
                  icon: Icons.speed,
                  value: ref.watch(_loadProvider(server)),
                ),
                _MiniGauge(
                  icon: Icons.memory,
                  value: ref.watch(_memoryProvider(server)),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniGauge extends StatelessWidget {
  final IconData icon;
  final AsyncValue<double> value;

  const _MiniGauge({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    final color = value.hasError
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.primary;

    if (value.hasError) {
      print(value.error);
      print(value.stackTrace);
    }

    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
            child: RotatedBox(
              quarterTurns: -1,
              child: LinearProgressIndicator(
                value: value.hasError ? 1 : value.valueOrNull,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Icon(
            icon,
            size: 16,
            color: color,
          ),
        ],
      ),
    );
  }
}
