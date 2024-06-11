import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shino/models/server_details.dart';

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
      body: ListView(
        children: const [],
      ),
    );
  }
}
