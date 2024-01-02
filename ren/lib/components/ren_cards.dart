import 'package:flutter/material.dart';

class RenCard {
  final String imageUrl;
  final String title;
  final String details;

  RenCard({
    required this.imageUrl,
    required this.title,
    required this.details,
  });
}


Widget buildCard(RenCard info) => Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0), // Adjust radius to get the desired roundness
  ),
  color: Color(0xFF1C1C1E),
  child: Container(
    width: 300,
    height: 300,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)), // Top corners rounded
          child: Image.network(
            info.imageUrl,
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              color: Color(0xFF1C1C1E),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)), // Bottom corners rounded
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              '${info.title}\n${info.details}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);
