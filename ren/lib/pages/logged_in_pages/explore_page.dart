import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rens Nearby'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
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
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Find a Ren',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                filled: true,
              ),
            ),
          ),
          RenCard(
            imageUrl: 'path/to/image',
            title: 'Batu Ferringhi Beach',
            location: 'Penang Island',
            completionPercentage: '32%',
            distance: '1.62 km',
            volunteerCount: '34 Volunteers',
          ),
          // More RenCards...
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Upcoming Rens',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          // More content here...
        ],
      ),
      // Add BottomNavigationBar here
    );
  }
}

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
      child: Column(
        children: [
          Image.network(imageUrl),
          ListTile(
            title: Text(title),
            subtitle: Text('$location\n$completionPercentage • $distance • $volunteerCount'),
          ),
        ],
      ),
    );
  }
}