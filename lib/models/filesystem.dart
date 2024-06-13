import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shino/models/bytes.dart';

part 'filesystem.freezed.dart';

@freezed
class Filesystem with _$Filesystem {
  const factory Filesystem({
    required String device,
    required Bytes total,
    required Bytes used,
    required Bytes available,
    required String mountpoint,
  }) = _Filesystem;

  const Filesystem._();

  double get usage => (total - available) / total;
}
