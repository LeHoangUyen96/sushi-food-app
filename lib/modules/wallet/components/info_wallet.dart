import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';

class WalletInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color(MainConstant.orange),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.all(15.0),
      height: size.height * 0.16,
      width: size.width * 0.92,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('My Balance'),
              Container(height: 10.0),
              Text(
                '\$ 25,350.00',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ]),
            Image.asset(
              'assets/icons/dolla.png',
              height: size.height * 0.065,
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Master Card'), Text('**** **** **** 5801')],
          )
        ],
      ),
    );
  }
}
