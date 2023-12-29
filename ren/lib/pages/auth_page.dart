import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ren/pages/home_page.dart';
import 'package:ren/pages/login_page.dart';


// basucally, if the user is not logged in, show the login page
// if the user is logged in, show the home page lol
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          // If the user is logged in, show the home page
          if (snapshot.hasData) {
            return HomePage();

          // If the user is not logged in, show the login page
          } else {
            return LoginPage();
          }
        },
      ),


    );
  }
}


