import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/home/constant/navigation.dart';

class NavigationBar extends StatelessWidget {
  void onTap(String nextRoute, BuildContext context) async {
    Navigator.of(context)
      ..pop()
      ..pushNamed(nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Container(
      height: size * 0.07,
      decoration: BoxDecoration(
        color: Color(MainConstant.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(navigation.length, (index) {
            final row = navigation[index];
            return FlatButton(
              onPressed: () => onTap(row['router'], context),
              child: Image.asset(
                row['icon'],
                color: Color(MainConstant.white),
                height: size * 0.035,
              ),
            );
          })
        ],
      ),
    );
  }
}
