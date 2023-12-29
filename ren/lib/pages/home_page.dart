import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});


// Sign user out method
  void userSignOut() async {
    await FirebaseAuth.instance.signOut();
    
    // sign out from google
    await GoogleSignIn().signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: userSignOut, icon: Icon(Icons.logout))]),
      body: Center(
        child: Text('Congrats! You\'re logged in!'),
      ),
    );
  }
}