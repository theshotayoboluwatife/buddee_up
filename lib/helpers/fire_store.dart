import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  FirebaseFirestore store = FirebaseFirestore.instance
    ..settings = const Settings(persistenceEnabled: true);

   Future<void> addUserToDatabase() async {
    try {
      await store.collection('users').doc(auth.currentUser!.uid).set(
            CreateNewUser().newUser.toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }
}
