import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ren/pages/logged_in_pages/explore_page.dart';
import 'package:ren/pages/logged_in_pages/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItem = 0;

  List<Widget> children = [
    ExplorePage(),
    ExplorePage(),
    ExplorePage(),
    ExplorePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: children[selectedItem],
      bottomNavigationBar: Material(
        color: Color(0xFF1B1B1B),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFF1B1B1B),
          selectedItemColor: Color(0xFF8E8E93),
          unselectedItemColor: Color(0xFF8E8E93),
          currentIndex: selectedItem,
          showUnselectedLabels: true,
          onTap: (currIndex) {
            setState(() {
              selectedItem = currIndex;
            });
          },
          items: [
            // ... other BottomNavigationBarItems
        
            // Profile BottomNavigationBarItem
            BottomNavigationBarItem(
              icon: _buildNavItem(Icons.search, 'Explore', selectedItem == 0),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem(Icons.people, 'People', selectedItem == 1),
              label: 'People',
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem(Icons.place, 'Ren', selectedItem == 2),
              label: 'Ren',
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem(Icons.card_giftcard, 'Rewards', selectedItem == 3),
              label: 'Rewards',
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem(Icons.person, 'Profile', selectedItem == 4),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData iconData, String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: isSelected
          ? BoxDecoration(
              color: Color(0xFFB5DBAA), // Green background color
              borderRadius: BorderRadius.circular(18), // Pill shape
            )
          : null, // No decoration when not selected
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(iconData,
              size: 24, color: isSelected ? Colors.black : Color(0xFF8E8E93)),
          ],
        
      ),
    );
  }

  // Sign user out method
  void userSignOut() async {
    await FirebaseAuth.instance.signOut();

    // sign out from google
    await GoogleSignIn().signOut();
  }
}
