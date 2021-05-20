import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/wallet/components/card_transections.dart';
import 'package:sushi_food_app/modules/wallet/components/info_wallet.dart';
import 'package:sushi_food_app/modules/wallet/components/type_card.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('home');
                },
                icon: Icon(Icons.arrow_back_ios)),
            title: Text(
              'My Wallet',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            )),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10.0),
                WalletInfo(),
                Container(height: 25.0),
                Text('Your Card',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Container(height: 10.0),
                TypeCard(),
                Container(height: 10.0),
                Text('Laster Transactions',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Container(height: 10),
                Transections(),
                Container(height: 10),
              ],
            ),
          ),
        ));
  }
}
