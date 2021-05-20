import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';

class TitleHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fresh Helthy',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
            Text('Delicious Sushi',
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.5,
                    color: Color(MainConstant.grey),
                    fontWeight: FontWeight.w600)),
          ],
        ));
  }
}
