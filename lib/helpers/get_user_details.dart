import 'package:BuddeeUp/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore dataabase = FirebaseFirestore.instance;
var storage = FirebaseStorage.instance;

class GetUserDetails {
  Future<String> getUserProfileImage() async {
    DocumentSnapshot doc =
        await dataabase.collection('users').doc(auth.currentUser!.uid).get();
    Map<String, dynamic> body = doc.data() as Map<String, dynamic>;
    return body['imageUrl'];
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUsers() async {
    try {
      return dataabase.collection('users').where('id').get();
    } catch (e) {
      rethrow;
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() async {
    try {
      return dataabase.collection('users').doc(auth.currentUser!.uid).get();
    } catch (e) {
      rethrow;
    }
  }
}
