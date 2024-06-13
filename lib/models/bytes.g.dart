// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bytes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bytes _$BytesFromJson(Map<String, dynamic> json) => Bytes(
      bytes: (json['bytes'] as num?)?.toInt() ?? 0,
      kilobytes: (json['kilobytes'] as num?)?.toInt() ?? 0,
      megabytes: (json['megabytes'] as num?)?.toInt() ?? 0,
      gigabytes: (json['gigabytes'] as num?)?.toInt() ?? 0,
      terabytes: (json['terabytes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BytesToJson(Bytes instance) => <String, dynamic>{
      'bytes': instance.bytes,
      'kilobytes': instance.kilobytes,
      'megabytes': instance.megabytes,
      'gigabytes': instance.gigabytes,
      'terabytes': instance.terabytes,
    };
