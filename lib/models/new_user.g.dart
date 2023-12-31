// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewUser _$NewUserFromJson(Map<String, dynamic> json) => NewUser(
      email: json['email'] as String,
      smoking: json['smoking'] as String,
      id: json['id'] as String,
      status: json['status'] as String,
      imageUrl: json['imageUrl'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profileName: json['profileName'] as String,
      age: json['age'] as int,
      bio: json['bio'] as String,
      pictures:
          (json['pictures'] as List<dynamic>).map((e) => e as String).toList(),
      height: json['height'] as String,
      weight: json['weight'] as String,
      gender: json['gender'] as String,
      tribe: json['tribe'] as String,
      bodyType: json['bodyType'] as String,
      ethnicity: json['ethnicity'] as String,
      lookingFor: json['lookingFor'] as String,
      healthStatus: json['healthStatus'] as String,
      activities: (json['activities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      sexualPreferences: json['sexualPreferences'] as String,
      lastSeen:
          const TimestampConverter().fromJson(json['lastSeen'] as Timestamp?),
      friends:
          (json['friends'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NewUserToJson(NewUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'phoneNumber': instance.phoneNumber,
      'profileName': instance.profileName,
      'age': instance.age,
      'bio': instance.bio,
      'pictures': instance.pictures,
      'height': instance.height,
      'weight': instance.weight,
      'gender': instance.gender,
      'tribe': instance.tribe,
      'bodyType': instance.bodyType,
      'status': instance.status,
      'ethnicity': instance.ethnicity,
      'lookingFor': instance.lookingFor,
      'healthStatus': instance.healthStatus,
      'activities': instance.activities,
      'sexualPreferences': instance.sexualPreferences,
      'friends': instance.friends,
      'smoking': instance.smoking,
      'lastSeen': const TimestampConverter().toJson(instance.lastSeen),
    };
