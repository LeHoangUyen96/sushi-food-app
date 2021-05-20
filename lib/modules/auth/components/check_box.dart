import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';

class CheckBoxSignin extends StatefulWidget {
  @override
  _CheckBoxSigninState createState() => _CheckBoxSigninState();
}

class _CheckBoxSigninState extends State<CheckBoxSignin> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            checkColor: Color(MainConstant.black),
            activeColor: Color(MainConstant.white),
            value: isCheck,
            onChanged: (bool value) {
              setState(() {
                isCheck = value;
              });
            }),
        Text(
          'Remember me',
          style: TextStyle(fontSize: 15),
        ),
        Spacer(),
        Text('Forgot Password?', style: TextStyle(fontSize: 15))
      ],
    );
  }
}
