import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shino/models/server_details.dart';

part 'servers.g.dart';

@riverpod
List<ServerDetails> serverDetails(ServerDetailsRef ref) {
  final subscription =
      ServerDetails.getPreference().listen((list) => ref.state = list);

  ref.onDispose(subscription.cancel);

  return [];
}
