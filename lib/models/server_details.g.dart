// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerDetailsImpl _$$ServerDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ServerDetailsImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      host: json['host'] as String,
      port: (json['port'] as num).toInt(),
      username: json['username'] as String,
    );

Map<String, dynamic> _$$ServerDetailsImplToJson(_$ServerDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'host': instance.host,
      'port': instance.port,
      'username': instance.username,
    };
