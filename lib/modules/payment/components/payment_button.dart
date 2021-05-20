import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/order_histories/redux/reducer.dart';
import 'package:sushi_food_app/redux/store.dart';

class PaymentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(MainConstant.orange)),
      child: TextButton(
        onPressed: () async {
          await store.dispatch(checkoutAction());
          Navigator.pushNamed(context, 'wallet');
        },
        child: Text(
          'PAYMENT',
          style: TextStyle(
            color: Color(MainConstant.black),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
