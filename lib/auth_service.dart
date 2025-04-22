import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  Future<User?> createUserWithEmailandPassword(
      String email, String password) async {
    final credentials = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return null;
  }

  Future<User?> loginUserWithEmailandPassword(
      String email, String password) async {
    final credentials = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    return null;
  }

  Future<void> signout() async {
    await _auth.signOut();
  }
}
