// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ren/components/profile_information.dart';
import 'package:ren/components/ren_cards.dart';
import 'package:ren/components/leaderboard.dart';

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
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [PopupMenuButton(  
          color: Color.fromARGB(255, 66, 66, 71),
          position: PopupMenuPosition.under,
          offset: Offset(0, 10),
          tooltip: '',
          itemBuilder: (context) =>[
            PopupMenuItem(
              child:Text('Logout'),
              value:'logoout' 
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
      body: ListView(
        children: [
          // profile information
          Padding(
            padding: EdgeInsets.all(20),
            child: Card(
              color: Color(0xFF2C2C2E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ProfileInfo(),
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
                        Image.asset("lib/images/streak.png", height: 30, width: 30,),
                        Text('82 days streak', textAlign: TextAlign.center, style: TextStyle(color: Colors.orange, fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey, width: 1), color: Color(0xFF2C2C2E)),
              child: Column(
                children: [
                   
                ],
              )
            ),
          )




                // Column(
                //   children: [
                //     Text('  82 days', textAlign: TextAlign.center, style: TextStyle(color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
                //     Image.asset("lib/images/streak.png", height: 100, width: 100,),
                //     const SizedBox(height: 20,),
                //     Container(
                //       color: Colors.transparent,
                //       child:Column(
                //         children:[
                //           Container(
                //             child: Column(
                //               children: [
                //                 Image.asset("lib/images/streak.png", height: 100, width: 100,),
                //                 Text('1st place', textAlign: TextAlign.center, style: TextStyle(color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
                //               ],
                //             ),
                //           ),
                          
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               Container(
 
                //                   child: Column(
                //                     children: [
                //                       Image.asset("lib/images/streak.png", height: 100, width: 100,),
                //                       Text('2nd place', textAlign: TextAlign.center, style: TextStyle(color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
                //                     ] ,
                //                   ),
                //               ),
                //               Container(
    
                //                 child: Column(
                //                   children: [
                //                     Image.asset("lib/images/streak.png", height: 100, width: 100,),
                //                     Text('3rd place', textAlign: TextAlign.center, style: TextStyle(color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
                //                   ],
                //                 ),
                //               ),
                //             ]  
                //           ),
                //           const SizedBox(height: 50,),
                //           ElevatedButton(
                //             onPressed: (){
                //               Navigator.push(context, MaterialPageRoute(builder: (context) => Leaderboard()));
                //             }, 
                //             style: ElevatedButton.styleFrom(
                //               minimumSize: Size(500,40), //adjust accordingly
                //               backgroundColor:Color.fromARGB(255, 62, 62, 66),
                //               padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                //               side: BorderSide.none,
                //               shape: StadiumBorder(),
                //               textStyle: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //             child: Text("View Leaderboard", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
                            
                //             )
                //         ]
                          
                //       )
                    
                      


                  ],
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


