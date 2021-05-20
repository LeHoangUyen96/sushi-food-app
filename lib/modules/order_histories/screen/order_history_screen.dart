import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/order_histories/components/card_history.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pushNamed('home');
            }),
        title: Text('Order History', style: TextStyle(fontSize: 22)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
            children: [
              CardHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
