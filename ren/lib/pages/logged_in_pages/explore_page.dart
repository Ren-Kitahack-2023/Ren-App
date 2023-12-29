import 'package:flutter/material.dart';
import 'package:ren/components/ren_cards.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E), // Dark background color
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1C1E), // AppBar with the same color as background
        elevation: 0, // Remove shadow
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              // Filter action
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Find a Ren',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  suffixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Top Rens Nearby',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          RenCard(
            // Make sure to define the following properties in your RenCard widget
            imageUrl: 'https://i.postimg.cc/Dw926NzR/batu-feringghi-dirty-beach.png',
            title: 'Batu Ferringhi Beach',
            location: 'Penang Island',
            completionPercentage: '32%',
            distance: '1.62 km',
            volunteerCount: '34 Volunteers',
          ),
          // More RenCards...
          // The rest of your ListView content...
        ],
      ),
      // The BottomNavigationBar code remains unchanged...
    );
  }
}