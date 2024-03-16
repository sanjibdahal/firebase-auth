import 'package:daily_algo/src/constants/colors.dart';
import 'package:daily_algo/src/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../common_widgets/elevated_button.dart';
import '../common_widgets/outlined_button.dart';
import '../common_widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 900;
  }

  bool isLoading = false;

  Future<void> login() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      showErrorMsg(e.message!);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showErrorMsg(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // backgroundColor: Colors.lightBlue,
          title: Text(
            message,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                padding: EdgeInsets.all(
                    isLargeScreen(context) ? (screenWidth * 0.07) : 16),
                constraints: BoxConstraints(
                  maxWidth: screenWidth * (isLargeScreen(context) ? 0.5 : 1),
                  maxHeight: screenHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 36),
                      child: Text(
                        "Sign in to your account",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    STextField(
                      controller: emailController,
                      hintText: "Enter your email",
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.alternate_email),
                    ),
                    const SizedBox(height: 20),
                    STextField(
                      controller: passwordController,
                      labelText: "Password",
                      hintText: "Enter your password",
                      prefixIcon: const Icon(Icons.fingerprint_rounded),
                      obsureText: !isPasswordVisible,
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
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Password?"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    SElevatedButton(
                      onPressed: () {
                        login();
                      },
                      child: isLoading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : const Text("Log In"),
                    ),
                    const SizedBox(height: 15),
                    SOutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                      },
                      child: const Text('Create Account'),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Expanded(child: Divider(color: greyColor)),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "OR SIGN IN WITH",
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: greyColor)),
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
                            icon: const FaIcon(FontAwesomeIcons.google,
                                color: Colors.white),
                            label: const Text("Google",
                                style: TextStyle(color: Colors.white)),
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
                            icon: const Icon(
                              Icons.facebook,
                              color: Colors.white,
                            ),
                            label: const Text("Facebook",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
