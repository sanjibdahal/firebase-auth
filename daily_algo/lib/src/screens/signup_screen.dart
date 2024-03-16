import 'package:daily_algo/src/common_widgets/elevated_button.dart';
import 'package:daily_algo/src/common_widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 900;
  }

  Future<void> signUp() async {
    final auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((value) {
      print("User registered.");
    }).catchError((error) {
      print("Failed to login: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (isLargeScreen(context))
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(color: Colors.blue),
                  constraints: BoxConstraints(
                    maxWidth: screenWidth * 0.5,
                    maxHeight: screenHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Daily DSA",
                        style: TextStyle(
                          fontSize: screenWidth * 0.09,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Conquer Algorithms or Be Conquered",
                        style: TextStyle(
                          fontSize: screenWidth * 0.018,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      isLargeScreen(context) ? (screenWidth * 0.07) : 16,
                  vertical: 16),
              constraints: BoxConstraints(
                maxWidth: screenWidth * (isLargeScreen(context) ? 0.5 : 1),
                minHeight: screenHeight,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        // size: 24,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        "Let's create your account!",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    STextField(
                      controller: nameController,
                      hintText: "Enter your name",
                      labelText: "Name",
                      prefixIcon: const Icon(Icons.person_rounded),
                    ),
                    const SizedBox(height: 20),
                    STextField(
                      controller: emailController,
                      hintText: "Enter your email",
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.alternate_email_rounded),
                    ),
                    const SizedBox(height: 20),
                    STextField(
                      controller: phoneController,
                      hintText: "Enter your phone number",
                      labelText: "Phone number",
                      prefixIcon: const Icon(Icons.phone),
                    ),
                    const SizedBox(height: 20),
                    STextField(
                      controller: passwordController,
                      hintText: "Enter your password",
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.fingerprint_rounded),
                      obsureText: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SElevatedButton(
                        onPressed: () {
                          signUp();
                        },
                        child: Text("Create Account")),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "OR SIGN IN WITH",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              backgroundColor: Colors.red,
                            ),
                            icon: const FaIcon(FontAwesomeIcons.google),
                            label: const Text("Google"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              backgroundColor: Colors.blue,
                            ),
                            icon: const Icon(Icons.facebook),
                            label: const Text("Facebook"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
