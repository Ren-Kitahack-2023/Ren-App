// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ren/components/profile_information.dart';
import 'package:ren/components/achievement_card.dart';
import 'package:ren/pages/leaderboard.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  // Sign user out method
  void userSignOut() async {
    await FirebaseAuth.instance.signOut();

    // sign out from google
    await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),

      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white),),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [PopupMenuButton(  
          color: Color(0xFF2C2C2E),
          position: PopupMenuPosition.under,
          offset: Offset(0, 10),
          tooltip: '',
          itemBuilder: (context) =>[
            PopupMenuItem(
              child:Text('Logout', style: TextStyle(color: Colors.white),),
              value:'logout' 
            )
          ],
          onSelected: (String value) {
            if(value == 'logout'){
              userSignOut();
            }
          },  
          )
          
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // profile information
          Padding(
            padding: EdgeInsets.only(bottom: 20.0, left:20.0, right:20.0),
            child: Card(
              color: Color(0xFF2C2C2E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ProfileInfo(info:['John Doe', 'Kuala Lumpur, KUL, MY', 'Joined 2023']),
              )
            ),
          ),

          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
            
          Padding(
            padding: EdgeInsets.symmetric(horizontal:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Streak', textAlign: TextAlign.start, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto', ),),
                Card(
                  color: Color(0xFF2C2C2E),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("lib/images/streak.png", height: 50, width: 50,),
                        Text('82 days streak', textAlign: TextAlign.center, style: TextStyle(color: Colors.orange, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text('Achievement', textAlign: TextAlign.start, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto', ),),
                const SizedBox(height: 20,),
                Container(
                  height: 345,
                  decoration: BoxDecoration(
                    color: Color(0xFF2C2C2E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AchievementCard(imageurl: 'lib/images/Gold_Medal.png', text: '23 Ren Hosted'),
                      AchievementCard(imageurl: 'lib/images/Silver_Medal.png', text: '2 Ren Hosted'),
                      AchievementCard(imageurl: 'lib/images/Bronze_Medal.png', text: '20+ kg Cleaned', subtext:'24 kilograms Cleaned'),
                    ],
                  ),
                )
              ],
            )
                    
                  
          ),
          const SizedBox(height: 30,),
          
          Center(
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Leaderboard()));
              }, 
              style: ElevatedButton.styleFrom(
                minimumSize: Size(350, 50),
                backgroundColor:Color(0xFF2C2C2E),
                // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                side: BorderSide.none,
                shape: StadiumBorder(),
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text("View Leaderboard", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
              
              ),
          ),
          const SizedBox(height: 20,),
        ]
          
      )
              
    )
    );
                 
  }
}

  


