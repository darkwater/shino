import 'package:freezed_annotation/freezed_annotation.dart';

part 'bytes.g.dart';

@JsonSerializable()
class Bytes {
  final int value;

  Bytes({
    int bytes = 0,
    int kilobytes = 0,
    int megabytes = 0,
    int gigabytes = 0,
    int terabytes = 0,
  }) : value = bytes +
            kilobytes * 1024 +
            megabytes * 1024 * 1024 +
            gigabytes * 1024 * 1024 * 1024 +
            terabytes * 1024 * 1024 * 1024 * 1024;

  int get bytes => value;
  double get kilobytes => value.toDouble() / 1024.0;
  double get megabytes => value.toDouble() / 1024.0 / 1024.0;
  double get gigabytes => value.toDouble() / 1024.0 / 1024.0 / 1024.0;
  double get terabytes => value.toDouble() / 1024.0 / 1024.0 / 1024.0 / 1024.0;

  Bytes operator +(Bytes other) => Bytes(bytes: value + other.value);
  Bytes operator -(Bytes other) => Bytes(bytes: value - other.value);
  Bytes operator *(int other) => Bytes(bytes: value * other);
  double operator /(Bytes other) => value.toDouble() / other.value.toDouble();
  bool operator <(Bytes other) => value < other.value;
  bool operator <=(Bytes other) => value <= other.value;
  bool operator >(Bytes other) => value > other.value;
  bool operator >=(Bytes other) => value >= other.value;

  @override
  String toString() {
    // TODO: implement toString
    return value.toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Bytes &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  factory Bytes.fromJson(int json) => Bytes(bytes: json);
  int toJson() => value;
}
