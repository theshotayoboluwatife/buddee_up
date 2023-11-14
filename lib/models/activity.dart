import 'package:BuddeeUp/models/new_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

@JsonSerializable()
class Activity {
  String activityType;
  String eventName;
  @TimestampConverter()
  Timestamp date;
  String suggestedTimes;
  String where;
  String zipcode;
  String area;

  Activity({
    required this.activityType,
    required this.eventName,
    required this.date,
    required this.suggestedTimes,
    required this.where,
    required this.zipcode,
    required this.area,
  });

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
