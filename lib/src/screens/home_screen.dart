import 'package:daily_algo/src/common_widgets/elevated_button.dart';
import 'package:daily_algo/src/common_widgets/text_field.dart';
import 'package:daily_algo/src/services/auth_service.dart';
import 'package:daily_algo/src/services/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? userData;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    UserModel? user =
        await UserRepository().getUser(FirebaseAuth.instance.currentUser!.uid);
    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    User currentUser = FirebaseAuth.instance.currentUser!;

    final namecontroller = TextEditingController();

    return Scaffold(
      body: Center(
        child: userData == null
            ? const Text("Loading...")
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hello, ${userData!.displayName}"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${userData!.displayName}'),
                      Text('Email: ${userData!.email}'),
                      Text('Phone Number: ${userData!.phoneNumber}'),
                      // Text('Photo URL: ${userData!.photoUrl}'),
                    ],
                  ),
                  ClipOval(
                    child: userData?.photoUrl == null
                        ? const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.black,
                          )
                        : Image.network(
                            "${userData?.photoUrl}",
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                  ),
                  Text(currentUser.emailVerified
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
                        currentUser.updateDisplayName(namecontroller.text);
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
