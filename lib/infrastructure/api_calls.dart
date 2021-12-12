import 'package:allworkpro/business_logic/helpers.dart';
import 'package:allworkpro/constants/string_contants.dart';
import 'package:allworkpro/presentation/core/progress_dialog.dart';
import 'package:allworkpro/presentation/router/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> registerNewUser({
  required BuildContext context,
  required String phoneNumber,
  required String name,
  required String email,
  required String password,
}) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const ProgressDialog(message: 'Creating your account');
      });
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  try {
    userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Navigator.of(context).pop();
      displaytoastMessage(message: 'Password too weak');
      return;
    } else if (e.code == 'email-already-in-use') {
      Navigator.of(context).pop();
      displaytoastMessage(
        message: 'The account already exists for that email.',
      );
      return;
    }
  } catch (e) {
    Navigator.of(context).pop();
    displaytoastMessage(message: e.toString());
    return;
  }
  Navigator.of(context).pop();
  displaytoastMessage(message: 'Account created successfully!');

  if (userCredential != null) {
    // ignore: always_specify_types
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    users.doc(userCredential.user!.uid).set(<String, dynamic>{
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
    }).then(
      (_) {
        displaytoastMessage(message: accountCreatedSuccess);
        Navigator.of(context).pushReplacementNamed(homePageRoute);
      },
    ).catchError(
      (dynamic error) {
        displaytoastMessage(message: 'Failed to add user');
      },
    );
  } else {
    displaytoastMessage(message: 'New user account not created');
  }
}

Future<void> signInWithEmailAndPass({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const ProgressDialog(message: 'Logging you in...');
      });
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Navigator.of(context).pop();

      displaytoastMessage(message: 'No user found for that email.');
      return;
    } else if (e.code == 'wrong-password') {
      Navigator.of(context).pop();
      displaytoastMessage(message: 'Wrong password provided for that user.');
      return;
    }
  }
  displaytoastMessage(message: 'Logged in successfully');
  Navigator.of(context).pushReplacementNamed(homePageRoute);
}
