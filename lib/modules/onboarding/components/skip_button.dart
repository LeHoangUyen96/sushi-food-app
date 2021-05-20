import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';

class SkipButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.08,
        width: size.height * 0.08,
        margin: EdgeInsets.only(left: size.width * 0.7),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Color(MainConstant.black)),
        child: TextButton(
            child: Text('Skip',
                style:
                    TextStyle(color: Color(MainConstant.white), fontSize: 18)),
            onPressed: () {
              Navigator.of(context).pushNamed('sign_in');
            }));
  }
}
