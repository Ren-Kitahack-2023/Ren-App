// local_tab_community_page.dart
import 'package:flutter/material.dart';
import 'package:ren/components/post_cards.dart';

class LocalTabCommunityPage extends StatelessWidget {
  final List<PostCard> posts = [
        PostCard(
      userName: 'Dhiren',
      userImage: 'https://i.postimg.cc/vmvmBFgT/dhiren-profile-pic.jpg',
      postImage: 'https://i.postimg.cc/tCmCZN4d/dhiren-cleanup.jpg',
      timeAgo: '3 hours ago',
      description: 'Cleaning up the stadium after a football match!',
      location: 'Stadium Sultan Sulaiman, Klang',
      length: '1.1 km',
      elevationGain: '20 m',
      time: '4h 15m',
      likes: 69,
      comments: 13,
    ),
        PostCard(
      userName: 'Tong Jet Kit',
      userImage: 'https://i.postimg.cc/tgG5bPWy/jk-profile-pic.png',
      postImage: 'https://i.postimg.cc/nckjrDyp/Putra-Heights-sign.jpg',
      timeAgo: '1 hour ago',
      description: 'Putra Heights gotong-royong today, had so much fun!',
      location: 'Putra Heights',
      length: '1.0 km',
      elevationGain: '30 m',
      time: '5h 30m',
      likes: 40,
      comments: 12,
    ),
    PostCard(
      userName: 'Muhammad Fawwad Ali Khurram',
      userImage: 'https://i.postimg.cc/4y33c8DZ/faw.jpg',
      postImage: 'https://i.postimg.cc/26htwrf7/gotong-royong.jpg',
      timeAgo: '3 hours ago',
      description: 'Gotong-royong at Tanjung Harapan, Port Klang with my friends!',
      location: 'Tanjung Harapan, Port Klang',
      length: '2.1 km',
      elevationGain: '80 m',
      time: '1h 15m',
      likes: 20,
      comments: 7,
    ),
    PostCard(
      userName: 'Amirul Akmal bin Mohammad Azizol',
      userImage: 'https://i.postimg.cc/W3mwf4YS/amirul.png',
      postImage: 'https://i.postimg.cc/sgtYcy1X/taman-sri-muda.jpg',
      timeAgo: '8 hours ago',
      description: 'Shah Alam is so dirty, I had to clean it up myself!',
      location: 'Shah Alam',
      length: '1.1 km',
      elevationGain: '60 m',
      time: '3h 30m',
      likes: 70,
      comments: 35,
    ),
        PostCard(
      userName: 'Leonaka Choo',
      userImage: 'https://i.postimg.cc/V6TctQJ1/naka.jpg',
      postImage: 'https://i.postimg.cc/28GhPh6P/langkawi-beach.jpg',
      timeAgo: '2 hours ago',
      description: 'Just finished cleaning up the beach in Langkawi!',
      location: 'Pantai Cenang, Langkawi',
      length: '5.2 km',
      elevationGain: '120 m',
      time: '2h 30m',
      likes: 10,
      comments: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Create a ListView.builder to display the list of PostCards
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return PostCard(
          userName: posts[index].userName,
          userImage: posts[index].userImage,
          postImage: posts[index].postImage,
          timeAgo: posts[index].timeAgo,
          description: posts[index].description,
          location: posts[index].location,
          length: posts[index].length,
          elevationGain: posts[index].elevationGain,
          time: posts[index].time,
          likes: posts[index].likes,
          comments: posts[index].comments,
        );
      },
    );
  }
}
