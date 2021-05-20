import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/auth/constants/image_bottom.dart';

class ImageBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width * 0.17,
        child: Row(
          children: images.map((e) => Image.asset(e)).toList(),
        ));
  }
}
