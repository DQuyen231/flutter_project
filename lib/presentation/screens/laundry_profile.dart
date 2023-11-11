import 'package:flutter/material.dart';
import 'package:laundry_middle_transportation/presentation/screens/laundry_dashboard.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_middle_transportation/presentation/screens/login_page.dart';

class LaundryProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/images/avatar.jpg'), // Replace with your avatar image
              ),
              SizedBox(height: 20),
              Text(
                'User',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildProfileButton(
                icon: Icons.account_circle,
                text: 'My Account',
                onPressed: () {
                  // Add functionality for My Account button
                },
              ),
              _buildProfileButton(
                icon: Icons.notifications,
                text: 'Notifications',
                onPressed: () {
                  // Add functionality for Notifications button
                },
              ),
              _buildProfileButton(
                icon: Icons.settings,
                text: 'Settings',
                onPressed: () {
                  // Add functionality for Settings button
                },
              ),
              _buildProfileButton(
                icon: Icons.logout,
                text: 'Logout',
                onPressed: () {
                  // Add functionality for Logout button
                  GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileButton(
      {required IconData icon,
      required String text,
      required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity, // Set the width to fill the available space
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon),
          label: Text(text),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
