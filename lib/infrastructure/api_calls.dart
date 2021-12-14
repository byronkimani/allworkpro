import 'dart:async';

import 'package:allworkpro/business_logic/helpers.dart';
import 'package:allworkpro/constants/string_contants.dart';
import 'package:allworkpro/presentation/core/progress_dialog.dart';
import 'package:allworkpro/presentation/router/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final DatabaseReference providersRef =
    FirebaseDatabase.instance.ref().child('providers');

final DatabaseReference usersRef =
    FirebaseDatabase.instance.ref().child('users');

DatabaseReference? serviceRequestRef = FirebaseDatabase.instance
    .ref()
    .child('providers')
    .child(FirebaseAuth.instance.currentUser!.uid)
    .child('newRequest');

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
    },
  );
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
        message:
            'The account already exists for that email. Please try loggin in.',
      );
      return;
    } else {
      Navigator.of(context).pop();
      displaytoastMessage(message: e.toString());
      return;
    }
  } catch (e) {
    Navigator.of(context).pop();
    displaytoastMessage(message: e.toString());
    return;
  }
  Navigator.of(context).pop();
  displaytoastMessage(message: 'Account created successfully!');

  // add user account id to collection
  // ignore: unnecessary_null_comparison
  if (userCredential != null) {
    final Map<String, dynamic> userData = <String, dynamic>{
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
    };

    await providersRef.child(userCredential.user!.uid).set(userData);
    displaytoastMessage(message: accountCreatedSuccess);
    Navigator.of(context).pushReplacementNamed(additionalInfoRoute);
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
  UserCredential? userCredential;

  try {
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
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
  if (userCredential!.user != null) {
    providersRef
        .child(userCredential.user!.uid)
        .once()
        .then((DatabaseEvent databaseEvent) async {
      if (databaseEvent.snapshot.value != null) {
        displaytoastMessage(message: 'Logged in successfully');
        Navigator.of(context).pushReplacementNamed(homePageRoute);
      } else {
        Navigator.of(context).pushReplacementNamed(loginPageRoute);
        await FirebaseAuth.instance.signOut();
        displaytoastMessage(
            message:
                'No record for this user exists. Please try creating a new account');
      }
    });
  }
}

Future<void> addExtraInformation({
  required Map<String, dynamic> data,
  required BuildContext context,
}) async {
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  final DatabaseReference ref =
      FirebaseDatabase.instance.ref('providers/$userId');

  await ref.update(data);
  displaytoastMessage(message: informationAddtionSuccess);
  Navigator.of(context).pushReplacementNamed(homePageRoute);
}
