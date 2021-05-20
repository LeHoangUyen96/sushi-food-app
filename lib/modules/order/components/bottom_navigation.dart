import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.05,
        color: Color(MainConstant.black),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'payment');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Place Order',
                style:
                    TextStyle(color: Color(MainConstant.white), fontSize: 20),
              ),
              Container(width: 10.0),
              Icon(Icons.arrow_forward, color: Color(MainConstant.white))
            ],
          ),
        ));
  }
}
