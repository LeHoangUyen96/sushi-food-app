import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/order/components/bottom_navigation.dart';
import 'package:sushi_food_app/modules/order/components/list_order.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'Your Order',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('profile');
                },
                icon: Icon(Icons.person))
          ],
        ),
        body: SafeArea(
            child: Stack(children: [
          Positioned.fill(
              child: Container(
                  decoration: BoxDecoration(color: Color(MainConstant.black)))),
          Positioned.fill(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Color(MainConstant.lightGrey),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListOrder(),
                      ],
                    ),
                  )))
        ])),
        bottomNavigationBar: BottomNavigation());
  }
}
