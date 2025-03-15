import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _showError(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

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
    BuildContext context,
  ) async {
    try {
      var userSnapshot =
          await _firestore
              .collection('users')
              .where('email', isEqualTo: email)
              .get();
      if (userSnapshot.docs.isNotEmpty) {
        _showError("User Already Exists", context);
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
        'createdAt': DateTime.now(),
      });

      return true;
    } catch (e) {
      debugPrint("Signup error: $e");
      return false;
    }
  }

  Future<bool> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      _firestore.collection('users').doc(email).get().then((
        DocumentSnapshot docSnapshot,
      ) {
        if (docSnapshot.exists) {
          String fetchedPass = docSnapshot.get('password');

          if (password == fetchedPass) {
            return true;
          } else {
            _showError("Incorrect Password", context);
            return false;
          }
        } else {
          _showError("Email not Found!, Create a new Account", context);
          return false;
        }
      });

      return true;
    } catch (e) {
      debugPrint("Error: $e");
      return false;
    }
  }
}
