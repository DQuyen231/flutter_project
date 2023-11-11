// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:laundry_middle_transportation/presentation/screens/login_page.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _LoadingPageState();
// }

// class _LoadingPageState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => LoginPage(),
//         ),
//       );
//     });
//     return Scaffold(
//       body: Container(
//         color: Colors.blue,
//         child: const Center(
//           child: Text(
//             'App',
//             style: TextStyle(
//               fontSize: 34,
//               fontWeight: FontWeight.w700,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:laundry_middle_transportation/presentation/screens/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      setState(() {
        opacity = 1.0;
      });
    });

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(190, 224, 247, 1.0),
        child: Center(
            child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 3),
          child: Image.asset('assets/images/app_image.png'),
        )),
      ),
    );
  }
}
