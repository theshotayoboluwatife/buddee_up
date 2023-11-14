// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      activityType: json['activityType'] as String,
      eventName: json['eventName'] as String,
      date: const TimestampConverter().fromJson(json['date'] as Timestamp?),
      suggestedTimes: json['suggestedTimes'] as String,
      where: json['where'] as String,
      zipcode: json['zipcode'] as String,
      area: json['area'] as String,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'activityType': instance.activityType,
      'eventName': instance.eventName,
      'date': const TimestampConverter().toJson(instance.date),
      'suggestedTimes': instance.suggestedTimes,
      'where': instance.where,
      'zipcode': instance.zipcode,
      'area': instance.area,
    };
