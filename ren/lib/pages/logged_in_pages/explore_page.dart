import 'package:flutter/material.dart';
import 'package:ren/components/ren_cards.dart';

class ExplorePage extends StatelessWidget {
  final List<RenCard> renInfo = [
    RenCard(
      imageUrl: 'https://i.postimg.cc/Dw926NzR/batu-feringghi-dirty-beach.png',
      title: 'Batu Ferringhi Beach',
      details: 'Penang Island\n32% • 1.62 km • 34 Volunteers',
    ),
    // I can add more RenCards here to add to the horizontal list view
  ];

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
      body: Container(
        height: 275,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: renInfo.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: buildCard(renInfo[index]),
          ),
        ),
      ),
    );
  }

}
