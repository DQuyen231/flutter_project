// import 'package:flutter/material.dart';

// class CustomNavigation extends StatefulWidget {
//   // final ValueChanged<int> onTabSelected;

//   // CustomNavigation({required this.onTabSelected});
//   CustomNavigation();

//   @override
//   _CustomNavigationState createState() => _CustomNavigationState();
// }

// class _CustomNavigationState extends State<CustomNavigation> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       // widget.onTabSelected(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.notifications),
//           label: 'Notification',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Profile',
//         ),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.blue,
//       onTap: _onItemTapped,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:laundry_middle_transportation/dashboard.dart';
import 'package:laundry_middle_transportation/model/order_model.dart';
import 'package:laundry_middle_transportation/presentation/screens/profile/profile_screen.dart';
import 'package:laundry_middle_transportation/presentation/screens/order.dart';

class CustomNavigation extends StatefulWidget {
  @override
  _CustomNavigationState createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Use Navigator to navigate to different pages based on the selected index.
    switch (index) {
      case 0:
        // Navigate to the Home page.
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
        break;
      case 1:
        // Navigate to the Notification page.
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OrderList()));
        break;
      case 2:
        // Navigate to the Profile page.
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
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
