import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shino/main.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

part 'server_details.freezed.dart';
part 'server_details.g.dart';

@freezed
class ServerDetails with _$ServerDetails {
  static const preferenceKey = "serverDetails";

  const ServerDetails._();

  bool get isSaved => id != null;

  bool get isValid =>
      name.isNotEmpty && host.isNotEmpty && port > 0 && username.isNotEmpty;

  const factory ServerDetails({
    required int? id,
    required String name,
    required String host,
    required int port,
    required String username,
  }) = _ServerDetails;

  factory ServerDetails.empty() => const ServerDetails(
        id: null,
        name: "",
        host: "",
        port: 22,
        username: "",
      );

  factory ServerDetails.fromJson(Map<String, dynamic> json) =>
      _$ServerDetailsFromJson(json);

  static Preference<List<ServerDetails>> getPreference() {
    return preferences.getCustomValue(
      ServerDetails.preferenceKey,
      defaultValue: [],
      adapter: getAdapter(),
    );
  }

  static JsonAdapter<List<ServerDetails>> getAdapter() {
    return JsonAdapter(
      serializer: (value) => value.map((e) => e.toJson()).toList(),
      deserializer: (value) =>
          (value as Iterable).map((e) => ServerDetails.fromJson(e)).toList(),
    );
  }

  /// Returns the server details as saved. If it was a new server, the ID will be set. Otherwise it's the exact same.
  Future<ServerDetails> save() async {
    final pref = getPreference();
    final value = await pref.first;

    if (isSaved) {
      final index = value.indexWhere((element) => element.id == id);
      value[index] = this;
      pref.setValue(value);
      return this;
    } else {
      final newServer = copyWith(id: (value.lastOrNull?.id ?? 0) + 1);
      value.add(newServer);
      pref.setValue(value);
      return newServer;
    }
  }

  Future<void> delete() async {
    final pref = getPreference();
    final value = await pref.first;

    value.removeWhere((element) => element.id == id);
    pref.setValue(value);
  }
}
