
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  debugPrint('Google User $googleUser');
  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  debugPrint('accessToken: ${googleAuth?.accessToken}');

  // Once signed in, return the UserCredential
  final sNcredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  // debugPrint('Token : $sNcredential');
  return sNcredential;
}