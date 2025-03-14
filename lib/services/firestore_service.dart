import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> signUp(
    String username,
    String email,
    String occupation,
    String dob,
    String age,
    String doorno,
    String peopleCount,
    String flatCode,
    String flatname,
    String phone,
    String emergencyPhone,
    String emergencyContactName,
    String description,
    String orgPlaceOfResidence,
    String password,
    String confirmPassword,
  ) async {
    try {
      var userSnapshot =
          await _firestore
              .collection('users')
              .where('email', isEqualTo: email)
              .get();
      if (userSnapshot.docs.isNotEmpty) {
        debugPrint("User Already Exists");
        return false;
      }

      await _firestore.collection('users').doc(email).set({
        'username': username,
        'email': email,
        'occupation': occupation,
        'dob': dob,
        'age': age,
        'doorno': doorno,
        'peopleCount': peopleCount,
        'flatCode': flatCode,
        'flatname': flatname,
        'phone': phone,
        'emergencyPhone': emergencyPhone,
        'emergencyContactName': emergencyContactName,
        ' description': description,
        'orgPlaceOfResidence': orgPlaceOfResidence,
        'password': password,
        'confirmPassword': confirmPassword,
        'createdAt': DateTime.now(),
      });

      return true;
    } catch (e) {
      debugPrint("Signup error: $e");
      return false;
    }
  }

  Future<bool> login(String email, String password, context) async {
    try {
      _firestore
      .collection('users')
      .doc(email)
      .get()
      .then((DocumentSnapshot docSnapshot) {
        if (docSnapshot.exists) {
          /// implement login logic
          // Logic -> [get the password from the firestore ; compare the entered password with the fetched password ; 
          //           If they match, allow the user into the homeScreen ; else, popup an error]

          String fetchedPass = docSnapshot.get('password');
          print("Fetched Password: $fetchedPass"); /// debug
          if (password == fetchedPass) {
            /// redirect to homeScreen
            const successSnackBar = SnackBar(content: Text("Successful Login"));
            ScaffoldMessenger.of(context).showSnackBar(successSnackBar);
            return true;
          }
          else {
            /// incorrect credentials
            return false;
          }
        }
        else {
          /// document not found -> redirect to sign-up page
          Navigator.pushNamed(context, '/signup');
          return false;
        }
      });

      return true;
    }
    catch(e) {
      print("Error: $e");
      return false;
    }
  }
}
