import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ren/pages/logged_in_pages/explore_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var selectedItem = 0;

  List children = [
    ExplorePage(),
    ExplorePage(),
    ExplorePage(),
    ExplorePage(),
    ExplorePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: children[selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1B1B1B),
        selectedItemColor: Color(0xFF8E8E93),
        iconSize: 27.0,
        currentIndex: selectedItem,
        unselectedLabelStyle: TextStyle(color: Color(0xFF1B1B1B)),
        unselectedItemColor: Color(0xFF888888),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (currIndex) {
          setState(() {
            selectedItem = currIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1B1B1B),
            icon: Stack( // Use Stack to place elements on top of each other
              children: <Widget>[
                Icon(Icons.explore),
                Positioned( // Position your indicator or badge
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 5.0,
                    width: 5.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFB5DBAA),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1B1B1B),
            icon: Stack( // Use Stack to place elements on top of each other
              children: <Widget>[
                Icon(Icons.people),
                Positioned( // Position your indicator or badge
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 5.0,
                    width: 5.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFB5DBAA),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1B1B1B),
            icon: Stack( // Use Stack to place elements on top of each other
              children: <Widget>[
                Icon(Icons.place),
                Positioned( // Position your indicator or badge
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 5.0,
                    width: 5.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFB5DBAA),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Ren',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1B1B1B),
            icon: Stack( // Use Stack to place elements on top of each other
              children: <Widget>[
                Icon(Icons.card_giftcard),
                Positioned( // Position your indicator or badge
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 5.0,
                    width: 5.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFB5DBAA),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1B1B1B),
            icon: Stack( // Use Stack to place elements on top of each other
              children: <Widget>[
                Icon(Icons.person),
                Positioned( // Position your indicator or badge
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 5.0,
                    width: 5.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFB5DBAA),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Profile',
          ),
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