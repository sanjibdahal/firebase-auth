import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;

  Future createUser(UserModel user) async {
    try {
      await _db
          .collection("users")
          .doc(user.id)
          .set(user.toJSON())
          .whenComplete(() => log("User created successfully"));
    } catch (e) {
      log("Error creating user: $e");
      return e;
    }
  }

  Future<UserModel?> getUser(String uid) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final snapshot = await users.doc(uid).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data.isNotEmpty
          ? UserModel(
              id: uid,
              displayName: data['displayName'],
              email: data['email'],
              phoneNumber: data['phoneNumber'],
              photoUrl: data['photoUrl'],
            )
          : null;
    } catch (e) {
      log("Error getting user: $e");
      return null;
    }
  }
}
