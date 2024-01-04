import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  final String imageurl;
  final String text;
  final String? subtext;
  const AchievementCard({
    super.key,
    required this.imageurl,
    required this.text,
    this.subtext
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(imageurl, height: 75, width: 75,),
          const SizedBox(width: 20),

          if(subtext != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),
                Text(subtext!, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, fontFamily: 'Roboto',)),
              ],
            )
          else
            Text(text, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Roboto',),),

            
        ]
      ),
    );
  }
}

