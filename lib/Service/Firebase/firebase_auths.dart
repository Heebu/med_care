import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuths {
  // Create a FirebaseAuth instance
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  /// Firebase Sign Up
  Future<String> firebaseSignUp(String email, String password) async {
    String isCompleted = 'An unexpected error occurred';
    try {
      // Create a user with an email address and password
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential users = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // Send a verification email to the user
        await users.user?.sendEmailVerification();
        // Check if the email has been verified
        isCompleted = 'success';
      } else {
        isCompleted = 'Please fill in the text fields';
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth exceptions
      isCompleted = getErrorMessage(e);
    } catch (e) {
      // Handle other types of errors
      isCompleted = 'An unexpected error occurred';
    }
    return isCompleted;
  }

  /// Function to store user information
  Future<String> storeUserInfo(
    String firstName,
    String lastName,
    String phoneNumber,
    String sex,
    String dob,
    String address,
    String city,
    String state,
  ) async {
    String result = 'An unexpected error occurred';
    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        address.isNotEmpty &&
        city.isNotEmpty &&
        state.isNotEmpty &&
        sex.isNotEmpty &&
        dob.isNotEmpty) {
      try {
        final User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          String uid = user.uid;
          String? email = user.email;
          await FirebaseFirestore.instance.collection('users').doc(uid).set({
            'email': email ?? '',
            'password': '',
            'firstName': firstName,
            'lastName': lastName,
            'sex': sex,
            'date of birth': dob,
            'address': address,
            'city': city,
            'state': state,
            'phoneNumber': phoneNumber,
            'uid': uid,
          });
          bool isVerified = user.emailVerified;
          // If the email is not verified, show an error message
          result = 'success';
          if (!isVerified) {
            result = 'notVerified';
          }
        } else if (user == null) {
          result = 'Null';
        }
      } on FirebaseAuthException catch (e) {
        // Handle specific Firebase Auth exceptions
        result = getErrorMessage(e);
      } catch (e) {
        result = e.toString();
      }
    } else {
      result = 'please fill in the text-fields';
    }
    return result;
  }

  ///sign in user
  Future<String> firebaseSignIn(String email, String password) async {
    String isSignedIn = 'An unexpected error occurred';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        User? user = FirebaseAuth.instance.currentUser;

        user!.emailVerified
            ? isSignedIn = 'success'
            : isSignedIn =
                'A mail  has been sent to your account for verification';
      } else if (email.isEmpty || password.isEmpty) {
        isSignedIn = 'Please fill in the text fields';
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth exceptions
      isSignedIn = getErrorMessage(e);
    } catch (e) {
      isSignedIn = e.toString();
    }
    return isSignedIn;
  }

  ///forgot password
  Future<String> firebaseForgotPassword(String email) async {
    String isSent = 'an unexpected error has occurred';

    if (email.isNotEmpty) {
      try {
        //send change password link
        await auth.sendPasswordResetEmail(email: email);
        isSent = 'success';
      } on FirebaseAuthException catch (e) {
        // Handle specific Firebase Auth exceptions
        isSent = getErrorMessage(e);
      } catch (e) {
        isSent = e.toString();
      }
    } else {
      //if email is empty

      isSent = 'Please fill in your email';
    }
    return isSent;
  }

  /// log out
  Future<String> firebaseSignOut(context) async {
    String isLoggedOut = 'An unexpected error occurred';
    try {
      //log out function
      await auth.signOut();
      Navigator.popUntil(context, (route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth exceptions
      isLoggedOut = getErrorMessage(e);
    } catch (e) {
      isLoggedOut = e.toString();
    }
    return isLoggedOut;
  }

  ///sign in with google sign in
  Future<String> signInWithGoogle() async {
    //Google sign in instance
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      // Trigger the Google Sign-In flow.
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        // Obtain the authentication details from the Google user.
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential using the token and ID token from the Google user.
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the created credential.
        await auth.signInWithCredential(credential);

        User? user = FirebaseAuth.instance.currentUser;
        String? uid = user?.uid;

        String email = googleUser.email;

        // Now, let's check if the user's email matches any 'restaurantEmail' in the 'Kitchens' subcollection
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection('restaurant')
                .doc(uid) // Use the uid to get the correct restaurant document
                .collection('Kitchen')
                .where('restaurantEmail', isEqualTo: email)
                .get();

        if (querySnapshot.docs.isNotEmpty) {
          return 'success';
        } else {
          return 'You do not have access to this restaurant.';
        }
      } else {
        // User cancelled the sign-in process.
        return 'User cancelled';
      }
    } catch (e) {
      print(e.toString());
      // Handle sign-in error.
      return 'Sign-in failed: $e';
    }
  }

  ///signUp with google sign Up auth
  Future<String> signUpWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Check if the user already exists
        final List<String> existingUser =
            await auth.fetchSignInMethodsForEmail(googleUser.email);

        if (existingUser.isNotEmpty) {
          // User already exists, return an error or appropriate message
          return 'User already exists';
        } else {
          // User doesn't exist, proceed with sign-up
          await auth.signInWithCredential(credential);

          // Return 'success' if the sign-up is successful
          return 'success';
        }
      } else {
        return 'User cancelled';
      }
    } catch (e) {
      print(e.toString());
      return 'Sign-up failed: $e';
    }
  }

  ///delete account
  Future<String> deleteAccount(context, String password) async {
    String result = 'an unexpected error occurred';
    User? user = FirebaseAuth.instance.currentUser;

    try {
      String res = await firebaseSignIn(user!.email.toString(), password);
      if (res == 'success') {
        await user.delete();
        result = 'success';
      } else {
        result = res;
      }
    } catch (e) {
      result = getErrorMessage(e);
    }
    return result;
  }

  String getErrorMessage(e) {
    if (e is FirebaseAuthException) {
      if (e.code == 'user-not-found') {
        return 'User not found. Please check your email';
      } else if (e.code == 'wrong-password') {
        return 'Incorrect password';
      } else if (e.code == 'network-request-failed') {
        return 'Network request failed. Please check your internet connection';
      } else if (e.code == 'email-already-in-use') {
        return 'Email already in use';
      } else if (e.code == 'weak-password') {
        return 'Password is too weak';
      } else if (e.code == 'invalid-email') {
        return 'Email is invalid';
      } else if (e.code == 'user-disabled') {
        return 'User is disabled';
      } else if (e.code == 'too-many-requests') {
        return 'Too many requests. Please try again later.';
      } else {
        return 'Firebase error: ${e.code}';
      }
    } else {
      return 'An unexpected error occurred.';
    }
  }
}
