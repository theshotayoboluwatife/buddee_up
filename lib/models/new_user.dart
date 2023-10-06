import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_user.g.dart';

@JsonSerializable()
class NewUser {
  String id;
  String email;
  String imageUrl;
  String phoneNumber;
  String profileName;
  int age;
  String bio;
  List<String> pictures;
  String height;
  String weight;
  String gender;
  String tribe;
  String bodyType;
  String status;
  String ethnicity;
  String lookingFor;
  String healthStatus;
  List<String> activities;
  String sexualPreferences;
  List<String> friends;

  @TimestampConverter()
  Timestamp lastSeen;

  NewUser({
    required this.email,
    required this.id,
    required this.status,
    this.imageUrl =
        'https://www.nicepng.com/png/full/933-9332131_profile-picture-default-png.png',
    required this.phoneNumber,
    required this.profileName,
    required this.age,
    required this.bio,
    required this.pictures,
    required this.height,
    required this.weight,
    required this.gender,
    required this.tribe,
    required this.bodyType,
    required this.ethnicity,
    required this.lookingFor,
    required this.healthStatus,
    required this.activities,
    required this.sexualPreferences,
    required this.lastSeen,
    required this.friends,
  });

  factory NewUser.fromJson(Map<String, dynamic> json) =>
      _$NewUserFromJson(json);

  Map<String, dynamic> toJson() => _$NewUserToJson(this);
}

class TimestampConverter implements JsonConverter<Timestamp, Timestamp?> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Timestamp? json) => json ?? Timestamp.now();

  @override
  Timestamp? toJson(Timestamp json) => json;
}
