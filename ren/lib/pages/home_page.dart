import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ren/pages/logged_in_pages/explore_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    ExplorePage(),
    Text(
      'Community Page',
      style: optionStyle,
    ),
    Text(
      'Ren Page',
      style: optionStyle,
    ),
    Text(
      'Rewards Page',
      style: optionStyle,
    ),
    Text(
      'Profile Page',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Sign user out method
  void userSignOut() async {
    await FirebaseAuth.instance.signOut();

    // sign out from google
    await GoogleSignIn().signOut();
  }

  // appBar: AppBar(
  //       actions: [IconButton(onPressed: userSignOut, icon: Icon(Icons.logout))]),
  //   );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: userSignOut, icon: Icon(Icons.logout))
      ]),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF1C1C1E),
        child: Container(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(5, (index) => _buildNavItem(index)),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    bool isSelected = _selectedIndex == index;
    IconData iconData;
    String text;
    switch (index) {
      case 0:
        iconData = Icons.search;
        text = 'Explore';
        break;
      case 1:
        iconData = Icons.people;
        text = 'Community';
        break;
      case 2:
        iconData = Icons.place;
        text = 'Ren';
        break;
      case 3:
        iconData = Icons.card_giftcard;
        text = 'Rewards';
        break;
      case 4:
        iconData = Icons.person;
        text = 'Profile';
        break;
      default:
        iconData = Icons.error;
        text = 'Error';
    }
    // Adjust the overall padding if necessary
    double sidePadding = 8.0;
    double totalWidth = MediaQuery.of(context).size.width - (sidePadding * 2);

    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          height: kBottomNavigationBarHeight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 250),
                padding: isSelected
                    ? EdgeInsets.all(6)
                    : EdgeInsets
                        .zero, // Adjust padding to control the size of the highlight
                decoration: isSelected
                    ? BoxDecoration(
                        color: const Color(0xFFB5DBAA), // The green color
                        borderRadius: BorderRadius.circular(10),
                      )
                    : null,
                child: Icon(
                  iconData,
                  color:
                      isSelected ? Colors.white : Colors.white.withOpacity(0.6),
                  size: 24,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
