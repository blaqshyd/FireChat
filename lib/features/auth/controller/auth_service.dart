// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firechat/constants/app_exports.dart';
import 'package:firechat/features/chat/view/user_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //! Sign Up method

  Future<UserCredential?> createUser({
    required email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await AppRouter.pushReplacement(const HomeView());

      //? create a document
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(getErrorString(e.code)),
          ),
        );
      }

      // throw Exception(e.code);
    }
    return null;
  }

  //! Sign in method

  Future<UserCredential?> signInUser({
    required String email,
    required password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //? Create a new doc
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(getErrorString(e.code)),
          ),
        );
      }
    }
    return null;
  }

// Sign in with Google
  googleSignIn() async {
    try {
      final GoogleSignInAccount? user = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication auth = await user!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );

      // Sign in to Firebase with Google credentials
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Create a document in the 'users' collection
      await _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email,
        'name': userCredential.user!.displayName,
        // Add other user details as needed
      });

      return userCredential;
    } catch (error) {
      // Handle sign-in errors
      if (kDebugMode) print("Error signing in with Google: $error");
      return null;
    }
  }

  //! Sign out method
  Future<void> signOutUser() async {
    return await FirebaseAuth.instance.signOut();
  }
}

// Error Handling
