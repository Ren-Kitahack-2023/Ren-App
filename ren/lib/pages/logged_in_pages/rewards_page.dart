import 'package:flutter/material.dart';
import 'package:ren/components/reward_card.dart';

class RewardsPage extends StatefulWidget {
  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  double _userPoints = 150; // Example points
  double _nextRewardAt = 200; // Next reward level

  // Example rewards
  List<Reward> rewards = [
    Reward(
      title: 'Grab RM30 Voucher',
      imageUrl: 'https://i.postimg.cc/9QsxM0wX/grab-voucher.jpg',
    ),
    Reward(
      title: 'KFC RM20 Voucher',
      imageUrl: 'https://i.postimg.cc/XqrS9NdY/kfc-voucher.jpg',
    ),
    Reward(
      title: 'McDonalds RM10 Voucher',
      imageUrl: 'https://i.postimg.cc/4N8PrvDq/mcd-voucher.png',
    ),
    Reward(
      title: 'Free TGV Movie Ticket',
      imageUrl: 'https://i.postimg.cc/x8Br5r3y/tgv-voucher.jpg',
    ),
  ];

  List<Map<String, String>> redeemedItems = [
    {'name': 'Grab Voucher', 'date': '2023-01-01'},
    {'name': 'Coffee Coupon', 'date': '2023-01-05'},
    {'name': 'Movie Ticket', 'date': '2023-01-10'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBar(
        title: Text('Rewards',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Color(0xFF1C1C1E),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Your Rewards',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            LinearProgressIndicator(
              value: _userPoints / _nextRewardAt,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '${_userPoints.toInt()} / ${_nextRewardAt.toInt()} points',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            _buildRewardsCatalog(),
            _buildRedeemHistory(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Redeem action
                },
                child: Text('Redeem Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFB5DBAA),
                  onPrimary: Colors.grey[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardsCatalog() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rewards Catalog',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          // Horizontal list of reward cards
          Container(
            height: 220, // Adjust based on the card height
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: rewards.length,
              itemBuilder: (context, index) {
                var reward = rewards[index];
                return Container(
                  width: 160, // Adjust based on the card width
                  padding: EdgeInsets.only(right: 8),
                  child: Card(
                    color: Color(0xFF1C1C1E),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(8.0), // Border radius
                          child: Image.network(
                            reward.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            reward.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRedeemHistory() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Redeem History',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Table(
            border: TableBorder.all(color: Colors.white), // Add table border
            columnWidths: const {
              0: FlexColumnWidth(2), // Adjust column width ratio
              1: FlexColumnWidth(1),
            },
            children: redeemedItems.map((item) {
              return TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['name'] ?? '',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['date'] ?? '',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
