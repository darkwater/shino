// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filesystem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Filesystem {
  String get device => throw _privateConstructorUsedError;
  Bytes get total => throw _privateConstructorUsedError;
  Bytes get used => throw _privateConstructorUsedError;
  Bytes get available => throw _privateConstructorUsedError;
  String get mountpoint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilesystemCopyWith<Filesystem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilesystemCopyWith<$Res> {
  factory $FilesystemCopyWith(
          Filesystem value, $Res Function(Filesystem) then) =
      _$FilesystemCopyWithImpl<$Res, Filesystem>;
  @useResult
  $Res call(
      {String device,
      Bytes total,
      Bytes used,
      Bytes available,
      String mountpoint});
}

/// @nodoc
class _$FilesystemCopyWithImpl<$Res, $Val extends Filesystem>
    implements $FilesystemCopyWith<$Res> {
  _$FilesystemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? total = null,
    Object? used = null,
    Object? available = null,
    Object? mountpoint = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Bytes,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as Bytes,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as Bytes,
      mountpoint: null == mountpoint
          ? _value.mountpoint
          : mountpoint // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilesystemImplCopyWith<$Res>
    implements $FilesystemCopyWith<$Res> {
  factory _$$FilesystemImplCopyWith(
          _$FilesystemImpl value, $Res Function(_$FilesystemImpl) then) =
      __$$FilesystemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String device,
      Bytes total,
      Bytes used,
      Bytes available,
      String mountpoint});
}

/// @nodoc
class __$$FilesystemImplCopyWithImpl<$Res>
    extends _$FilesystemCopyWithImpl<$Res, _$FilesystemImpl>
    implements _$$FilesystemImplCopyWith<$Res> {
  __$$FilesystemImplCopyWithImpl(
      _$FilesystemImpl _value, $Res Function(_$FilesystemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? total = null,
    Object? used = null,
    Object? available = null,
    Object? mountpoint = null,
  }) {
    return _then(_$FilesystemImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Bytes,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as Bytes,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as Bytes,
      mountpoint: null == mountpoint
          ? _value.mountpoint
          : mountpoint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilesystemImpl extends _Filesystem {
  const _$FilesystemImpl(
      {required this.device,
      required this.total,
      required this.used,
      required this.available,
      required this.mountpoint})
      : super._();

  @override
  final String device;
  @override
  final Bytes total;
  @override
  final Bytes used;
  @override
  final Bytes available;
  @override
  final String mountpoint;

  @override
  String toString() {
    return 'Filesystem(device: $device, total: $total, used: $used, available: $available, mountpoint: $mountpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilesystemImpl &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.used, used) || other.used == used) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.mountpoint, mountpoint) ||
                other.mountpoint == mountpoint));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, device, total, used, available, mountpoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilesystemImplCopyWith<_$FilesystemImpl> get copyWith =>
      __$$FilesystemImplCopyWithImpl<_$FilesystemImpl>(this, _$identity);
}

abstract class _Filesystem extends Filesystem {
  const factory _Filesystem(
      {required final String device,
      required final Bytes total,
      required final Bytes used,
      required final Bytes available,
      required final String mountpoint}) = _$FilesystemImpl;
  const _Filesystem._() : super._();

  @override
  String get device;
  @override
  Bytes get total;
  @override
  Bytes get used;
  @override
  Bytes get available;
  @override
  String get mountpoint;
  @override
  @JsonKey(ignore: true)
  _$$FilesystemImplCopyWith<_$FilesystemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
