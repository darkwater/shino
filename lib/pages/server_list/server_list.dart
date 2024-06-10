import 'dart:convert';

import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinenacl/ed25519.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shino/models/keypair.dart';
import 'package:shino/models/server_details.dart';
import 'package:shino/pages/server_list/server_edit.dart';
import 'package:shino/providers/servers.dart';

part 'server_list.g.dart';

@riverpod
Future<SSHClient> sshClient(SshClientRef ref, ServerDetails details) async {
  final key = await Keypair.get();

  print(OpenSSHEd25519KeyPair(
    key.publicKey.toUint8List(),
    key.privateKey.toUint8List(),
    "",
  ).toPublicKey());

  return SSHClient(
    await SSHSocket.connect(details.host, details.port),
    username: details.username,
    identities: [
      OpenSSHEd25519KeyPair(
        key.publicKey.toUint8List(),
        key.privateKey.toUint8List(),
        "",
      )
    ],
    printDebug: (msg) => print("SSH[D]: $msg"),
    printTrace: (msg) => print("SSH[T]: $msg"),
  );
}

@riverpod
Future<String> uname(UnameRef ref, ServerDetails details) async {
  final client = await ref.watch(sshClientProvider(details).future);
  final res = await client.run("uname");
  return utf8.decode(res);
}

@riverpod
Future<Keypair> keypair(KeypairRef ref) async {
  return await Keypair.get();
}

class ServerListPage extends ConsumerWidget {
  const ServerListPage({super.key});

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const ServerListPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shino"),
        actions: [
          ...ref
                  .watch(keypairProvider)
                  .whenData(
                    (keypair) => [
                      IconButton(
                        icon: const Icon(Icons.vpn_key),
                        tooltip: "Copy public key",
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: keypair.publicKeyOpenSSH),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Public key copied to clipboard"),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                  .valueOrNull ??
              [],
        ],
      ),
      body: ListView(
        children: [
          for (final server in ref.watch(serverDetailsProvider))
            ListTile(
              title: Text(server.name),
              subtitle: Text(
                server.port == 22
                    ? server.host
                    : "${server.host}:${server.port}",
              ),
              trailing: ref.watch(unameProvider(server)).when(
                    data: (uname) => Text(uname),
                    error: (e, st) {
                      print(e);
                    },
                    loading: () => const CircularProgressIndicator(),
                  ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   ServerEditPage.route(server),
                // );
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Delete ${server.name}?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            server.delete();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, ServerEditPage.routeNew()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
