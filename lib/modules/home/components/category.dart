import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';

class Category extends StatefulWidget {
  final String text;
  Category({
    @required this.text,
  });
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: TextAlign.center,
      style: TextStyle(color: Color(MainConstant.black), fontSize: 20),
    );
  }
}
