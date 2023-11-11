import 'package:flutter/material.dart';
import 'package:laundry_middle_transportation/dashboard.dart';
import 'package:laundry_middle_transportation/presentation/screens/laundry_dashboard.dart';
import 'package:laundry_middle_transportation/presentation/screens/orderOfLaundryStore.dart';
import 'package:laundry_middle_transportation/presentation/screens/profile/profile_screen.dart';
import 'package:laundry_middle_transportation/presentation/screens/order.dart';
import 'package:laundry_middle_transportation/presentation/screens/laundry_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomNavigation extends StatefulWidget {
  @override
  _CustomNavigationState createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? laundryStoreId = prefs.getString('laundry_store_id');

    setState(() {
      _selectedIndex = index;
    });

    // Use Navigator to navigate to different pages based on the selected index.
    switch (index) {
      case 0:
        // Navigate to the Home page.
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
        break;
      case 1:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => OrderByLaundryStore(
                      laundryStoreID: laundryStoreId,
                    )));
        break;
      case 2:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LaundryProfileScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}
