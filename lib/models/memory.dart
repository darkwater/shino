import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shino/models/bytes.dart';

part 'memory.freezed.dart';

@freezed
class Memory with _$Memory {
  const factory Memory({
    required Bytes total,
    required Bytes used,
  }) = _Memory;

  const Memory._();

  Bytes get available => total - used;
  double get usage => used / total;
}
