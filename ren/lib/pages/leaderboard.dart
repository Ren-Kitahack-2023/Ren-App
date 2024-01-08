// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ren/components/profile_information.dart';

class Leaderboard extends StatelessWidget {

  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<String> examples = ['John Doe', 'Chloe Ayers', 'Simeon Alvarado', 'Farrah Osborn', 'Melisa Carroll', 'Ela Brown', 'Camilla Stuart', 'Hana York', 'Layton Hamilton', 'Arun Wilkinson', 'Leon Beard', 'Levi O\'Brien','Carrie O\'Ryan'];
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBar( 
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text('Leaderboard', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Card(
              color: Color(0xFF2C2C2E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ProfileInfo(info:['John Doe', 'Top 17%', 'Rank: #123']),
              )
            ),
          ),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: 
                 ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => ListTile(
                                                        title: Row(
                                                          children:[
                                                            CircleAvatar(
                                                              radius: 20,
                                                              backgroundImage: AssetImage('lib/images/profileavatar.png'),
                                                            ),
                                                            const SizedBox(width: 20,),
                                                            Text(examples[index], style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'Roboto',))
                                                          ]
                                                        ),
                                                        leading: Text('${index + 1}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                                                        trailing: Text('${100000/(index+1)}'.toString().substring(0,5),style: TextStyle(color: Colors.grey[300], fontSize: 11, fontWeight: FontWeight.bold, fontFamily: 'Roboto',)),)), 
                  separatorBuilder: (context, index) => const Divider(color: Colors.transparent,thickness: 1,), 
                  itemCount: 12),
              ),
          ),
           
          //list
        ],
      ),
    );
  }
}