import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:laundry_middle_transportation/presentation/widgets/navigation.dart';
import 'package:laundry_middle_transportation/dashboard.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboard(),
              ),
            );
          },
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomNavigation(),
    );
  }
}
