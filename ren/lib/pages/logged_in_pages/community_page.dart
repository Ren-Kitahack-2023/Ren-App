import 'package:flutter/material.dart';
import 'package:ren/components/following_tab_community_page.dart';
import 'package:ren/components/local_tab_community_page.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFF1C1C1E),
        appBar: AppBar(
          backgroundColor: Color(0xFF1C1C1E),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person_add, color: Colors.white),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Color(0xFFB5DBAA),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
            ),
            tabs: [
              Tab(text: 'Local'),
              Tab(text: 'Following'),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Latest',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: 'Roboto',
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        TextSpan(
                          text: '\nnearby',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              SizedBox(height: 8),
              buildSearchBar(), // Now part of the scrollable content
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
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          spreadRadius: 0,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Explore by destination',
        hintStyle: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.5)),
        prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.5)),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear, color: Colors.white.withOpacity(0.5)),
          onPressed: () {/* Clear search logic here */},
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 0), // Center the text vertically
      ),
      style: TextStyle(color: Colors.white),
      onTap: () {
        // Add animation or style changes on tap if needed
      },
    ),
  );
}

}
