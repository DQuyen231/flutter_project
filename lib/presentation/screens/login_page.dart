import 'package:flutter/material.dart';
import 'package:laundry_middle_transportation/dashboard.dart';
import 'package:laundry_middle_transportation/repository/auth_api.dart';
import 'package:laundry_middle_transportation/presentation/widgets/button.dart';
import 'package:laundry_middle_transportation/presentation/widgets/square_tile.dart';
import 'package:laundry_middle_transportation/presentation/widgets/textfield.dart';
import 'package:laundry_middle_transportation/presentation/screens/error_screen.dart';

class LoginPage extends StatelessWidget {
  final String errorMessage;

  LoginPage({super.key, this.errorMessage = ""});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 224, 224),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              const Icon(
                Icons.local_laundry_service,
                size: 200,
                weight: 2,
              ),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SquareTile(
                    imagePath: 'assets/images/google.png',
                    onClick: () async {
                      bool success =
                          await AuthService().loginWithGoogle(context);
                      if (success) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Dashboard(),
                        //   ),
                        // );
                      } else {
                        print("Error message: $errorMessage");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(
                              errorMessage:
                                  "You don't have permission to access this app",
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),

              const SizedBox(height: 50),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                )
            ],
          ),
        ),
      ),
    );
  }
}
