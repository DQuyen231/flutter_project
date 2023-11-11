import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<bool> loginWithGoogle(BuildContext context) async {
    // try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    var userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final token = await userCredential.user!.getIdToken(); // Get the token

    print('Token!!!!!: $token');

    print(credential.toString());
    final response =
        await _dio.post('https://13.212.24.193/api/v1/authenticate',
            data: {"accessToken": token},
            options: Options(
              contentType: Headers.jsonContentType,
            ));

    log(response.toString());

    if (response.statusCode == 200) {
      if (response.data.containsKey("role")) {
        final role = response.data["role"][0];
        final user = response.data["user"]; // Access the "user" object
        final avatar = user["avatar"]; // Access the "avatar" field
        final fullname = user["fullname"];
        final user_id = user["id"];

        saveUserAvatar(avatar);
        saveUserFullName(fullname);
        saveUserId(user_id);

        print("Avatar: $avatar");
        print("FullName: $fullname");
        print("Role: $role");

        if (role == 'LaundryStore') {
          print('He is laundry');
          Navigator.pushReplacementNamed(context, '/laundrystore');
          return true;
        } else if (role == 'Staff') {
          print('He is staff');
          Navigator.pushReplacementNamed(context, '/staff');
          // print('wrong');
          return true;
        } else {
          GoogleSignIn().signOut();
          FirebaseAuth.instance.signOut();
          print('somthing');
          return false;
        }
      }
    } else {
      // Request had an error
      // GoogleSignIn().signOut();
      // FirebaseAuth.instance.signOut();
      // print('somthing');
      print('Error: ${response.statusCode} - ${response.data}');
      return false;
    }

    // } on FirebaseAuthException catch (error) {
    //   log('FirebaseAuthException: ${error.message}');
    // } on DioError catch (error) {
    //   log('DioError: ${error.message}');
    // }
    return false;
  }

  Future<void> saveUserAvatar(String avatar) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_avatar', avatar);
  }

  Future<void> saveUserFullName(String fullname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_fullname', fullname);
  }

  Future<void> saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
  }
}
