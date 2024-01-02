// local_tab_community_page.dart
import 'package:flutter/material.dart';
import 'package:ren/components/post_cards.dart';

class LocalTabCommunityPage extends StatelessWidget {
  // Sample list of posts (you can replace this with your data)
  final List<PostCard> posts = [
    PostCard(
      userName: 'NakaNation',
      userImage: 'https://i.postimg.cc/V6TctQJ1/naka.jpg',
      postImage: 'https://i.postimg.cc/YSs3mVGf/naka-langkawi.png',
      timeAgo: '2 hours ago',
      description: 'Gotong-royong dekat Philippines, sangat best!',
      location: 'Philippines',
      length: '5.2 km',
      elevationGain: '120 m',
      time: '2h 30m',
      likes: 10,
      comments: 5,
    ),
    PostCard(
      userName: 'Muhammad Fawwad Ali Khurram',
      userImage: 'https://i.postimg.cc/4y33c8DZ/faw.jpg',
      postImage: 'https://i.postimg.cc/26htwrf7/gotong-royong.jpg',
      timeAgo: '3 hours ago',
      description: 'Nama saya Fawwad, saya suka gotong-royong!',
      location: 'Rumah Amirul',
      length: '2.1 km',
      elevationGain: '80 m',
      time: '1h 15m',
      likes: 20,
      comments: 7,
    ),
    PostCard(
      userName: 'Amirul Akmal bin Mohammad Azizol',
      userImage: 'https://i.postimg.cc/W3mwf4YS/amirul.png',
      postImage: 'https://i.postimg.cc/mgJxTdLJ/amirul-midfing.jpg',
      timeAgo: '8 hours ago',
      description: 'Is your name Aida? Coz Aida lama minat you.. ;)',
      location: 'Shah Alam',
      length: '1.1 km',
      elevationGain: '60 m',
      time: '3h 30m',
      likes: 69,
      comments: 420,
    )
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
