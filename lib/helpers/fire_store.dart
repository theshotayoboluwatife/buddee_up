import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  FirebaseFirestore store = FirebaseFirestore.instance
    ..settings = const Settings(persistenceEnabled: true);

  Future<void> addUserToDatabase(Map<String, dynamic> user) async {
    try {
      logger.i(CreateNewUser().newUser.email);
      await store.collection('users').doc(auth.currentUser!.uid).set(user);
    } catch (e) {
      rethrow;
    }
  }
}
