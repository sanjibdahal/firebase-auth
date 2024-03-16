import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("users")
        .add(user.toJSON())
        .whenComplete(() => log("User Created"))
        .catchError((error) {
      log("Error creating user: $error");
      return error;
    });
  }
}
