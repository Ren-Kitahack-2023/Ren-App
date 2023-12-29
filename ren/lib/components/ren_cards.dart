import 'package:flutter/material.dart';

class RenCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String completionPercentage;
  final String distance;
  final String volunteerCount;

  const RenCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.completionPercentage,
    required this.distance,
    required this.volunteerCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Color(0xFF1C1C1E),
      child: Column(
        children: [
          Image.network(imageUrl),
          ListTile(
            title: Text(
              title,
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
            subtitle: Text(
              '$location\n$completionPercentage • $distance • $volunteerCount',
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
          ),
        ],
      ),
    );
  }
}
