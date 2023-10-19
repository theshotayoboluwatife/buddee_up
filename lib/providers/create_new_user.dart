import 'package:BuddeeUp/models/new_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateNewUser extends ChangeNotifier {
  NewUser newUser = NewUser(
    id: FirebaseAuth.instance.currentUser?.uid ?? '',
    email: '',
    status: '',
    phoneNumber: '',
    profileName: '',
    age: 18,
    imageUrl: '',
    bio: 'bio',
    pictures: [],
    height: '4 feet 3 inches',
    weight: '100kg',
    gender: '',
    tribe: '',
    bodyType: '',
    ethnicity: '',
    lookingFor: '',
    healthStatus: '',
    activities: [],
    sexualPreferences: '',
    lastSeen: Timestamp.fromDate(DateTime.now()),
    friends: [],
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
    // String height,
    // String weight,
  ) {
    newUser.profileName = profileName;
    newUser.age = age;
    newUser.bio = bio;
    newUser.pictures = pictures;
    // newUser.height = height;
    // newUser.weight = weight;
  }
}
