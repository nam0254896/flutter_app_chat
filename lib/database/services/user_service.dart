import 'package:flutterappclone/views/pages/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../views/widgets/snackbar.dart';

class UserService {
  static Future getUserInfo() async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    final storage = FlutterSecureStorage();
    String? UID = await storage.read(key: 'uID');
    final result = await users.doc(UID).get();
    // final UserModel user = UserModel(
    //     gender: result.get('gender'),
    //     email: result.get('email'),
    //     phone: result.get('phone'),
    //     age: result.get('age'),
    //     avartaURL: result.get('avartaURL'),
    //     fullName: result.get('fullName'));
    //print(result.get('fullName'));
    return result;
  }

  static addUser({
    required String? UID,
    required String fullName,
    required String email,
  }) {
    // Call the user's CollectionReference to add a new user
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users
          .doc(UID)
          .set({
            'uID': UID,
            'fullName': fullName,
            'email': email,
            'avartaURL':
                'https://iotcdn.oss-ap-southeast-1.aliyuncs.com/RpN655D.png',
            'phone': 'None',
            'age': 'None',
            'gender': 'None',
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } catch (e) {}
  }

  static editUserFetch(
      {required BuildContext context,
      required age,
      required gender,
      required phone,
      required fullName}) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final storage = FlutterSecureStorage();
      String? UID = await storage.read(key: 'uID');
      users
          .doc(UID)
          .update({
            'fullName': fullName,
            'age': age,
            'phone': phone,
            'gender': gender,
          })
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      getSnackBar(
        'Edit Info',
        'Edit Success.',
        Colors.green,
      ).show(context);
    } catch (e) {
      getSnackBar(
        'Edit Info',
        'Edit Fail. $e',
        Colors.red,
      ).show(context);
      print(e);
    }
  }

  static editUserImage(
      {required BuildContext context, required ImageStorageLink}) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final storage = FlutterSecureStorage();
      String? UID = await storage.read(key: 'uID');
      users
          .doc(UID)
          .update({
            'avartaURL': ImageStorageLink,
          })
          .then((value) => print("User's Image Updated"))
          .catchError((error) => print("Failed to update user: $error"));
      return false;
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomeScreen()),
      // );
      getSnackBar(
        'Edit Image',
        'Edit Success.',
        Colors.green,
      ).show(context);
    } catch (e) {
      getSnackBar(
        'Edit Image',
        'Edit Fail. $e',
        Colors.red,
      ).show(context);
      print(e);
    }
  }
}
