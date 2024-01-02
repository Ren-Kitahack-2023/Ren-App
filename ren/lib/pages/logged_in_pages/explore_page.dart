import 'package:flutter/material.dart';
import 'package:ren/components/ren_cards.dart';

class ExplorePage extends StatelessWidget {
  final List<RenCard> topRens = [
    RenCard(
      imageUrl: 'https://i.postimg.cc/Dw926NzR/batu-feringghi-dirty-beach.png',
      title: 'Batu Ferringhi Beach',
      details: 'Penang Island\n32% • 1.62 km • 34 Volunteers',
    ),
    RenCard(
      imageUrl: 'https://i.postimg.cc/ZqmsZtPn/batu-dirty-2.png',
      title: 'Petaling Pond',
      details: 'Jalan Petaling\n12% • 2.31 km • 3 Volunteers',
    ),
    RenCard(
      imageUrl: 'https://i.postimg.cc/Dw926NzR/batu-feringghi-dirty-beach.png',
      title: 'Batu Ferringhi Beach',
      details: 'Penang Island\n32% • 1.62 km • 34 Volunteers',
    ),
    RenCard(
      imageUrl: 'https://i.postimg.cc/ZqmsZtPn/batu-dirty-2.png',
      title: 'Petaling Pond',
      details: 'Jalan Petaling\n12% • 2.31 km • 3 Volunteers',
    )
  ];

  final List<RenCard> upcomingRens = [
    RenCard(
      imageUrl: 'https://i.postimg.cc/ZqmsZtPn/batu-dirty-3.png',
      title: 'Tebrau River',
      details: 'Johor Bahru\nIn 33 hours • 7.62 km • 92 Volunteers',
    ),
    RenCard(
      imageUrl: 'https://i.postimg.cc/LsnsD77C/la-beach.png',
      title: 'Los Angeles Beach',
      details: 'California\nStarted by @JohnDoe • 12 Volunteers',
    )
  ];

  final List<RenCard> recentWins = [
    RenCard(
      imageUrl: 'https://i.postimg.cc/LsnsD77C/la-beach.png',
      title: 'Los Angeles Beach',
      details: 'California\nStarted by @JohnDoe • 12 Volunteers',
    ),
    RenCard(
      imageUrl: 'https://i.postimg.cc/LsnsD77C/la-beach.png',
      title: 'Los Angeles Beach',
      details: 'California\nStarted by @JohnDoe • 12 Volunteers',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1C1E),
        elevation: 0,
        titleSpacing: 0,
        title: buildSearchBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildSection('Top Rens Nearby', topRens),
            buildSection('Upcoming Rens', upcomingRens),
            buildSection('Recent Wins', recentWins),
          ],
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black, 
          hintText: 'Find a Ren',
          hintStyle:
              TextStyle(color: Colors.grey[500]), 
          prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
          suffixIcon: Icon(Icons.keyboard_arrow_down,
              color: Colors.grey[500]), // Added dropdown icon
          contentPadding: EdgeInsets.zero, 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                30.0), 
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildSection(String title, List<RenCard> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          height: 275,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                  left: 16, right: index == cards.length - 1 ? 16 : 0),
              child: buildCard(cards[index]),
            ),
          ),
        ),
      ],
    );
  }
}
