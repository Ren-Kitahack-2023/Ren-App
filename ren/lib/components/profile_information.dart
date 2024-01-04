// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";

class ProfileInfo extends StatelessWidget {
  final List<String> info;


  const ProfileInfo({super.key, required this.info});

  List<Widget> buildChildren(List<String> info) {
    List<Widget> children = List.filled(3, Text(''));
    for (var i = 0; i < info.length; i++) {
      if (i == 0){
        children[i] = Text(info[i],style: TextStyle(color: Colors.green, fontSize:15, fontWeight: FontWeight.bold, fontFamily: 'Roboto',));
      }
      else{
        children[i] = Text(info[i],style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Roboto',));
      }
     
    }
    return children;
  }

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
                children: buildChildren(info),
              ),
            ),
          ),
          
        ]
      ),
    );
  }
}