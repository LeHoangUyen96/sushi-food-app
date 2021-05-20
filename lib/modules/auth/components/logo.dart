import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: size.width * 0.3),
      height: size.height * 0.15,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
