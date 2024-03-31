import 'package:daily_algo/src/services/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

class AuthService {
  Future<void> signInWithEmailAndPassword(email, password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword(
      email, password, displayName, phoneNumber) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .whenComplete(() {
      final user = UserModel(
        id: FirebaseAuth.instance.currentUser!.uid,
        displayName: displayName,
        email: email,
        phoneNumber: phoneNumber,
      );
      UserRepository().createUser(user);
    });
  }

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw "Unable to log out";
    }
  }

  Future<UserCredential> signInWithGitHub() async {
    GithubAuthProvider githubProvider = GithubAuthProvider();

    if (kIsWeb) {
      return await FirebaseAuth.instance.signInWithPopup(githubProvider);
    } else {
      return await FirebaseAuth.instance.signInWithProvider(githubProvider);
    }
  }

  // Future signInWithGithub() async {
  //   if (kIsWeb) {
  //     // Create a new provider
  //     GithubAuthProvider githubProvider = GithubAuthProvider();

  //     // Once signed in, return the UserCredential
  //     return await FirebaseAuth.instance.signInWithPopup(githubProvider);
  //   } else {
  //     // Trigger the sign-in flow
  //     final GithubSignIn gitHubSignIn = GithubSignIn(
  //       clientId: 'YOUR_GITHUB_CLIENT_ID',
  //       clientSecret: 'YOUR_GITHUB_CLIENT_SECRET',
  //       redirectUrl: 'YOUR_GITHUB_REDIRECT_URL',
  //     );

  //     final result = await gitHubSignIn.signIn(context);

  //     // Create a credential from the access token
  //     final AuthCredential githubAuthCredential =
  //         GithubAuthProvider.credential(result.token);

  //     // Once signed in, return the UserCredential
  //     return await FirebaseAuth.instance
  //         .signInWithCredential(githubAuthCredential);
  //   }
  // }

  Future<UserCredential> signInWithGoogle() async {
    if (kIsWeb) {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithPopup(googleProvider);

      // Or use signInWithRedirect
      // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
    } else {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }
}
