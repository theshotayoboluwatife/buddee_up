import 'package:BuddeeUp/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  FirebaseFirestore store = FirebaseFirestore.instance
    ..settings = const Settings(persistenceEnabled: true);

  Future<void> addUserToDatabase(Map<String, dynamic> user) async {
    try {
      await store.collection('users').doc(auth.currentUser!.uid).set(user);
    } catch (e) {
      rethrow;
    }
  }
}
