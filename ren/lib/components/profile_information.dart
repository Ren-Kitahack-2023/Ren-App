// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("lib/images/profileavatar.png"),
          ),
          const SizedBox(height: 20,),
          Text('John Doe', style: TextStyle(color: Colors.white, fontSize:20, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
          Text('Kuala Lumpur, KUL, MY',style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
          Text('Joined 2023', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
          const SizedBox(height: 20,),
        ]
      ),
    );
  }
}