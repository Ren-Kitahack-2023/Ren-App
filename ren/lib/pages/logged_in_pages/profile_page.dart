import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ren/components/profile_information.dart';
import 'package:ren/components/ren_cards.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),

      // button to logout
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: () {
          userSignOut();
        },


        ),

      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.settings))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left:20),
              child: ProfileInfo()
              ),
          ],
        ),
      ),
    

    );
  }
}

  // Sign user out method
  void userSignOut() async {
    await FirebaseAuth.instance.signOut();

    // sign out from google
    await GoogleSignIn().signOut();
  }


