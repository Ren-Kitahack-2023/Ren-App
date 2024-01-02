import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
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
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
              color: Colors.green
            ),
            child: Column(
              children: [ 
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('lib/images/profileavatar.png'),
                ),
                const Divider(color: Colors.transparent,),
                Text('John Doe', style: TextStyle(fontSize:20, color: Colors.white),),
                const Divider(color: Colors.transparent,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children:[
                        RichText(text: TextSpan(
                          text: 'Top ',
                          style: TextStyle(fontSize:20, color: Colors.white,fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(text: '0.74%', style: TextStyle(fontSize:20, color: Colors.white, fontWeight: FontWeight.bold)),
                          ]
                        )),
                        Text(
                          '24 KILOGRAMS CLEANED',
                          style: TextStyle(fontSize:10, fontWeight:FontWeight.bold, color: Colors.white),
                        ), 
                      ]
                    ),
                    Column(
                      children:[
                         Text('#123', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                         Text('Rank', style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),),
                      ]
                      
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 25,),
          Text('LeaderBoard', style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
          Container(
            margin: EdgeInsets.all(30),
            child: 
               ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) => ListTile(
                                                      title: Row(children:[
                                                        CircleAvatar(
                                                          radius: 20,
                                                          backgroundImage: AssetImage('lib/images/profileavatar.png'),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Text("John Doe",)
                                                      ]),
                                                      leading: 
                                                        Text('${index + 1}', style: TextStyle(fontWeight: FontWeight.bold),),
                                                      trailing: Text('${100000/index+1}'.toString().substring(0,5)),)), 
                separatorBuilder: (context, index) => const Divider(color: Colors.transparent,thickness: 1,), 
                itemCount: 12),
            ),
           
          //list
        ],
      ),
    );
  }
}