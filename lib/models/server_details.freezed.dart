// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServerDetails _$ServerDetailsFromJson(Map<String, dynamic> json) {
  return _ServerDetails.fromJson(json);
}

/// @nodoc
mixin _$ServerDetails {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerDetailsCopyWith<ServerDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerDetailsCopyWith<$Res> {
  factory $ServerDetailsCopyWith(
          ServerDetails value, $Res Function(ServerDetails) then) =
      _$ServerDetailsCopyWithImpl<$Res, ServerDetails>;
  @useResult
  $Res call({int? id, String name, String host, int port, String username});
}

/// @nodoc
class _$ServerDetailsCopyWithImpl<$Res, $Val extends ServerDetails>
    implements $ServerDetailsCopyWith<$Res> {
  _$ServerDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? host = null,
    Object? port = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerDetailsImplCopyWith<$Res>
    implements $ServerDetailsCopyWith<$Res> {
  factory _$$ServerDetailsImplCopyWith(
          _$ServerDetailsImpl value, $Res Function(_$ServerDetailsImpl) then) =
      __$$ServerDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String name, String host, int port, String username});
}

/// @nodoc
class __$$ServerDetailsImplCopyWithImpl<$Res>
    extends _$ServerDetailsCopyWithImpl<$Res, _$ServerDetailsImpl>
    implements _$$ServerDetailsImplCopyWith<$Res> {
  __$$ServerDetailsImplCopyWithImpl(
      _$ServerDetailsImpl _value, $Res Function(_$ServerDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? host = null,
    Object? port = null,
    Object? username = null,
  }) {
    return _then(_$ServerDetailsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerDetailsImpl extends _ServerDetails {
  const _$ServerDetailsImpl(
      {required this.id,
      required this.name,
      required this.host,
      required this.port,
      required this.username})
      : super._();

  factory _$ServerDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerDetailsImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String host;
  @override
  final int port;
  @override
  final String username;

  @override
  String toString() {
    return 'ServerDetails(id: $id, name: $name, host: $host, port: $port, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, host, port, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerDetailsImplCopyWith<_$ServerDetailsImpl> get copyWith =>
      __$$ServerDetailsImplCopyWithImpl<_$ServerDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerDetailsImplToJson(
      this,
    );
  }
}

abstract class _ServerDetails extends ServerDetails {
  const factory _ServerDetails(
      {required final int? id,
      required final String name,
      required final String host,
      required final int port,
      required final String username}) = _$ServerDetailsImpl;
  const _ServerDetails._() : super._();

  factory _ServerDetails.fromJson(Map<String, dynamic> json) =
      _$ServerDetailsImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get host;
  @override
  int get port;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$ServerDetailsImplCopyWith<_$ServerDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
