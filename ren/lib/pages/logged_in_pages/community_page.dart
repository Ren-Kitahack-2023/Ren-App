import 'package:flutter/material.dart';
import 'package:ren/components/following_tab_community_page.dart';
import 'package:ren/components/local_tab_community_page.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFF202020), // Dark background color
        appBar: AppBar(
          backgroundColor: Color(0xFF1C1C1E), // AppBar color to match the design
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () {
                // TODO: Add notification action
              },
            ),
            IconButton(
              icon: Icon(Icons.person_add, color: Colors.white),
              onPressed: () {
                // TODO: Add profile action
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorColor: Colors.green, // Tab indicator color
                labelColor: Colors.white, // Selected label color
                unselectedLabelColor: Colors.grey, // Unselected label color
                tabs: [
                  Tab(text: 'Local'),
                  Tab(text: 'Following'),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Latest\nnearby',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold, // Adjust weight as necessary
                letterSpacing: 0.8, // Adjust letter spacing as necessary
              ),
            ),
          ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: buildSearchBar(),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  LocalTabCommunityPage(),
                  FollowingTabCommunityPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLocalTab() {
    // Placeholder for local tab content
    return Center(child: Text('Local Tab'));
  }

  Widget buildFollowingTab() {
    // Placeholder for following tab content
    return Center(child: Text('Following Tab'));
  }

  Widget buildSearchBar() {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey[800], // Adjust color to match design
        borderRadius: BorderRadius.circular(18), // Rounded corners
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Explore by destination',
          hintStyle: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.5)),
          prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.5)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 0), // Center the text vertically
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
