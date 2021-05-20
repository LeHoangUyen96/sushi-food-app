import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/home/models/sushi.dart';

class ImageProduct extends StatelessWidget {
  final Sushi sushi;
  ImageProduct({this.sushi});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Image.asset(sushi.image),
    ));
  }
}
