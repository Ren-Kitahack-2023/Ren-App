import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String userName;
  final String userImage;
  final String postImage;
  final String timeAgo;
  final String description;
  final String location;
  final String length;
  final String elevationGain;
  final String time;
  final int likes;
  final int comments;

  const PostCard({
    Key? key,
    required this.userName,
    required this.userImage,
    required this.postImage,
    required this.timeAgo,
    required this.description,
    required this.location,
    required this.length,
    required this.elevationGain,
    required this.time,
    required this.likes,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Color(0xFF1C1C1E),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(userImage), // User profile image URL
            ),
            title: Text(userName, style: TextStyle(color: Colors.white)),
            subtitle: Text(
              '$timeAgo • Follow',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                // TODO: Implement action
              },
            ),
          ),
          Image.network(
            postImage, // Post image URL
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description, style: TextStyle(color: Colors.white)),
                SizedBox(height: 8),
                Text(location, style: TextStyle(color: Colors.white70)),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.directions_walk, color: Colors.white70),
                    SizedBox(width: 8),
                    Text(length, style: TextStyle(color: Colors.white70)),
                    SizedBox(width: 16),
                    Icon(Icons.terrain, color: Colors.white70),
                    SizedBox(width: 8),
                    Text(elevationGain,
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(width: 16),
                    Icon(Icons.access_time, color: Colors.white70),
                    SizedBox(width: 8),
                    Text(time, style: TextStyle(color: Colors.white70)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.favorite, color: Colors.red),
                    SizedBox(width: 8),
                    Text('$likes likes',
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(width: 16),
                    Icon(Icons.comment, color: Colors.white70),
                    SizedBox(width: 8),
                    Text('$comments comments',
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
