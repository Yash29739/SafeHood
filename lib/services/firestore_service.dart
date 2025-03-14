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

  Future<bool> login(String email, String password) async {
    try {
      var userSnapshot = await _firestore.collection('users').doc(email).get();
      if (userSnapshot.exists && userSnapshot.data()?['password'] == password) {
        debugPrint("Login Successful");
        return true;
      } else {
        debugPrint("invalid email or password");
        return false;
      }
    } catch (e) {
      debugPrint("Login Error: $e");
      return false;
    }
  }
}
