import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/onboarding/constant/boarding_content.dart';

class Boarding extends StatelessWidget {
  final String image;
  final String content;
  final VoidCallback onSwipeRight;

  const Boarding({
    Key key,
    this.content,
    this.image,
    this.onSwipeRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(height: size.height * 0.03),
          Container(
            height: size.height * 0.5,
            child: Image.asset(image),
          ),
          Container(
            height: size.height * 0.02,
          ),
          Container(
              width: size.width * 0.8,
              child: Column(children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 34,
                    color: Color(MainConstant.black),
                  ),
                ),
                Container(height: 10.0),
                Text(
                  content ?? '',
                  style: TextStyle(
                    color: Color(MainConstant.grey),
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                )
              ])),
        ],
      ),
    );
  }
}
