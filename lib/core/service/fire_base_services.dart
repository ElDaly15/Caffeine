// ignore_for_file: use_build_context_synchronously, duplicate_ignore
import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/errors/exceptions.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/featuers/auth/presentation/views/get_started_view.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseServices {
  final _messaging = FirebaseMessaging.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future deleteAccount() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  /// Listen for ban status in real-time
  void listenForBan(BuildContext context) {
    User? user = _auth.currentUser;
    if (user == null) return;

    _firestore.collection('banned_users').doc(user.uid).snapshots().listen(
      (snapshot) async {
        if (snapshot.exists) {
          await signOut();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => GetStartedView(),
                ),
              );
            }
          });
          getIt<CustomSnackBar>().showCustomSnackBar(
            message: 'You have been banned.',
            context: context,
            type: AnimatedSnackBarType.error,
          );
        }
      },
    );
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    try {
      // Create the user with email and password
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.updateDisplayName(name);
      await credential.user!.reload();
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      return FirebaseAuth.instance.currentUser!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: S.of(context).weak_password);
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: S.of(context).email_already_in_use);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: S.of(context).network_error);
      } else {
        throw CustomException(message: S.of(context).unknown_error);
      }
    } on SocketException {
      // Handle no internet connection
      throw CustomException(message: S.of(context).network_error);
    } catch (e) {
      throw CustomException(message: S.of(context).unknown_error);
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Attempt to sign in with Firebase Auth
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = credential.user;
      if (user == null) {
        throw CustomException(message: 'User not found.');
      }

      // Check if user is banned before allowing login
      DocumentSnapshot banDoc = await FirebaseFirestore.instance
          .collection('banned_users')
          .doc(user.uid)
          .get();

      if (banDoc.exists) {
        // User is banned, force logout immediately
        await FirebaseAuth.instance.signOut();
        throw CustomException(
            message: S.of(context).your_account_has_been_banned);
      }

      // If email verification is required
      if (!user.emailVerified) {
        await user.sendEmailVerification();
        getIt<CustomSnackBar>().showCustomSnackBar(
          message: S.of(context).verify_email,
          context: context,
          type: AnimatedSnackBarType.warning,
        );
      }

      // Start listening for future bans
      FireBaseServices().listenForBan(context);

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'User not found.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'Incorrect email or password.');
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
            message: 'Too many failed login attempts. Try again later.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'Network error. Please check your connection.');
      } else {
        throw CustomException(message: 'An error occurred. Please try again.');
      }
    } on SocketException {
      throw CustomException(
          message: 'No internet connection. Please check your network.');
    } catch (e) {
      throw CustomException(message: 'An unexpected error occurred.');
    }
  }

  Future<void> sendPasswordResetEmail(
      String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      getIt<CustomSnackBar>().showCustomSnackBar(
          message: S.of(context).reset_password_sent,
          context: context,
          type: AnimatedSnackBarType.success);
    } catch (error) {
      getIt<CustomSnackBar>().showCustomSnackBar(
          message: 'An error occurred. Please try again.',
          context: context,
          type: AnimatedSnackBarType.error);
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw CustomException(
        message: 'Google sign-in failed. Please try again.',
      );
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<void> signOut() async {
    final token = await _messaging.getToken();

    await FirebaseFirestore.instance
        .collection('UsersData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'notificationToken': FieldValue.arrayRemove([token]),
    });
    await FirebaseAuth.instance.signOut();
    if (await GoogleSignIn().isSignedIn()) {
      await GoogleSignIn().disconnect();
    }
  }
}
