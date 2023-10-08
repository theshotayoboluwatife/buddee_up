import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/models/msg.dart';
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

  Future<DocumentSnapshot<Map<String, dynamic>>> getlastMessage(
      String id) async {
    try {
      return store
          .collection('chats')
          .doc(auth.currentUser!.uid)
          .collection('message-sent')
          .doc(id)
          .get();
    } catch (e) {
      rethrow;
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String id) async {
    try {
      return store.collection('users').doc(id).get();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAccount() async {
    try {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid);
      await documentReference.delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addUserToFriendList(Map<Object, Object> data) async {
    try {
      await store.collection('users').doc(auth.currentUser!.uid).update(data);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> sendMessage(String message, String recipentId) async {
    try {
      await store
          .collection('chats')
          .doc(recipentId)
          .collection('message-sent')
          .doc(auth.currentUser!.uid)
          .set({
        'timeOfLastMessage': Timestamp.now(),
        'message': message,
      });

      await store
          .collection('chats')
          .doc(recipentId)
          .collection('message-sent')
          .doc(auth.currentUser!.uid)
          .collection('messages')
          .add(
            Message(
              isSender: auth.currentUser!.uid,
              message: message,
              timestamp: Timestamp.now(),
            ).toJson(),
          );
      await store
          .collection('chats')
          .doc(auth.currentUser!.uid)
          .collection('message-sent')
          .doc(recipentId)
          .set({
        'timeOfLastMessage': Timestamp.now(),
        'message': message,
      });

      await store
          .collection('chats')
          .doc(auth.currentUser!.uid)
          .collection('message-sent')
          .doc(recipentId)
          .collection('messages')
          .add(
            Message(
              isSender: auth.currentUser!.uid,
              message: message,
              timestamp: Timestamp.now(),
            ).toJson(),
          );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
