import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_algo/src/common_widgets/elevated_button.dart';
import 'package:daily_algo/src/common_widgets/text_field.dart';
import 'package:daily_algo/src/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    final namecontroller = TextEditingController();

    // final doc = FirebaseFirestore.instance.collection("users").doc(user?.uid).get();
    // User _currentUser = User. (doc.data() as Map<String, dynamic>);

    FirebaseFirestore.instance
    .collection('users')
    .doc(user?.uid)
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });



    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hello, ${user?.email}"),
            Text("${user?.displayName}"),
            ClipOval(
              child: user?.photoURL == null
                  ? const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.black,
                    )
                  : Image.network("${user?.photoURL}"),
            ),
            Text(user!.emailVerified
                ? "Email verified"
                : "Email is not verified"),

            const SizedBox(height: 10),
            // Text(FirebaseAuth.instance),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: STextField(
                controller: namecontroller,
                hintText: "Update Name",
                labelText: "Name",
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: SElevatedButton(
                onPressed: () {
                  user.updateDisplayName(namecontroller.text);
                },
                child: const Text("Update Name"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: SElevatedButton(
                onPressed: () {
                  AuthService().logout();
                },
                child: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
