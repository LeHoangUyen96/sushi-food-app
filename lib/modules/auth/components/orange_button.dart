import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';

class OrangeButton extends StatelessWidget {
  final String topTitle;
  final String bottomTitle;
  final VoidCallback submit;
  final VoidCallback changePage;
  OrangeButton(
      {@required this.topTitle,
      this.bottomTitle,
      this.submit,
      this.changePage});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 55.0,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(MainConstant.orange)),
        child: TextButton(
          onPressed: submit,
          child: Text(
            topTitle,
            style: TextStyle(
              color: Color(MainConstant.black),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      Container(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Color(MainConstant.black)),
          ),
          InkWell(
            onTap: changePage,
            child: Text(
              bottomTitle,
              style: TextStyle(
                  color: Color(MainConstant.black),
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    ]);
  }
}
