import 'package:dartssh2/dartssh2.dart';
import 'package:pinenacl/ed25519.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shino/models/keypair.dart';
import 'package:shino/models/server/generic.dart';
import 'package:shino/models/server_details.dart';

part 'servers.g.dart';

@riverpod
List<ServerDetails> serverDetails(ServerDetailsRef ref) {
  final subscription =
      ServerDetails.getPreference().listen((list) => ref.state = list);

  ref.onDispose(subscription.cancel);

  return [];
}

@riverpod
Future<SSHClient> sshClient(SshClientRef ref, ServerDetails details) async {
  final key = await Keypair.get();

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
    // printDebug: (msg) => print("SSH[D]: $msg"),
    // printTrace: (msg) => print("SSH[T]: $msg"),
  );
}

@riverpod
Future<GenericServer> serverModel(
  ServerModelRef ref,
  ServerDetails details,
) async {
  final client = await ref.watch(sshClientProvider(details).future);
  return await GenericServer(client).discover();
}
