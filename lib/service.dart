// import 'package:flutter/foundation.dart';
// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  User get user => _auth.currentUser!;

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      print("hiiiiii");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        User? userH = _auth.currentUser;
        String? tokenH = await userH!.getIdToken();
        if (kDebugMode) {}
        print(userCredential.additionalUserInfo!);
        print(userCredential.user!);
      }
    } on FirebaseAuthException catch (e) {
      SnackBar(
        content: Text(
          e.message!.toString(),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
