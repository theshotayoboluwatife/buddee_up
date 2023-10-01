import 'package:BuddeeUp/models/new_user.dart';
import 'package:flutter/material.dart';

class CreateNewUser extends ChangeNotifier {
  NewUser newUser = NewUser(
    email: '',
    status: '',
    phoneNumber: '',
    profileName: '',
    age: 18,
    bio: 'bio',
    pictures: [],
    height: '',
    weight: 0,
    gender: '',
    tribe: '',
    bodyType: '',
    ethnicity: '',
    lookingFor: '',
    healthStatus: '',
    activities: [],
    sexualPreferences: '',
  );

  void setEmail(String email) {
    newUser.email = email;
  }

  void phone(String phone) {
    newUser.phoneNumber = phone;
  }

  void sex(String gender) {
    newUser.gender = gender;
  }

  void tribe(String tribe) {
    newUser.tribe = tribe;
  }

  void bodyType(String bodyType) {
    newUser.bodyType = bodyType;
  }

  void ethnicity(String ethnicity) {
    newUser.ethnicity = ethnicity;
  }

  void lookingFor(String lookingFor) {
    newUser.lookingFor = lookingFor;
  }

  void status(String status) {
    newUser.status = status;
  }

  void healthStatus(String healthStatus) {
    newUser.healthStatus = healthStatus;
  }

  void activities(List<String> activities) {
    newUser.activities = activities;
  }

  void sexualPrefernce(String sexualPrefrence) {
    newUser.sexualPreferences = sexualPrefrence;
  }

  void setProfile(
    String profileName,
    int age,
    String bio,
    List<String> pictures,
    String height,
    double weight,
  ) {
    newUser.profileName = profileName;
    newUser.age = age;
    newUser.bio = bio;
    newUser.pictures = pictures;
    newUser.height = height;
    newUser.weight = weight;
  }
}
