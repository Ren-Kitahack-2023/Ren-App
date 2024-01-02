import 'package:flutter/material.dart';

class FollowingTabCommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Latest from friends',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            OutlinedButton(
              onPressed: () {
                // TODO: Add button press functionality
              },
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color.fromARGB(255, 134, 162, 126),
                side: BorderSide(color: Colors.white),
              ),
              child: Text('Add'),
            ),
            Spacer(),
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.person_add, 
                    size: 48,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Grow your community',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'See who you already know on Ren to keep up with friends and stay inspired.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Add button press functionality
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 134, 162, 126),
                      onPrimary: Colors.white,
                    ),
                    child: Text('Connect with Friends'),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Add button press functionality
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Text('Connect later'),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
