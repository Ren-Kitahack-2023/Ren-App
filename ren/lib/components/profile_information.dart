// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage("lib/images/profileavatar.png"),
          ),
          const SizedBox(width: 40),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('John Doe', style: TextStyle(color: Colors.green, fontSize:15, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
                  Text('Kuala Lumpur, KUL, MY',style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
                  Text('Joined 2023', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
                ],
              ),
            ),
          ),
          
        ]
      ),
    );
  }
}