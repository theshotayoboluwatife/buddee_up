import 'package:BuddeeUp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum AuthMode { login, register, phone }

class Auth {
  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await auth.signInWithCredential(credential);
  }

  static Future<void> createAccount(
      String email, dynamic password, AuthMode mode) async {
    if (mode == AuthMode.login) {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } else if (mode == AuthMode.register) {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    }
  }

  static Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return auth.signInWithCredential(facebookAuthCredential);
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
