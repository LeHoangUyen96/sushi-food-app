import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.height * 0.06,
        vertical: size.width * 0.3,
      ),
      child: Image.asset(
        'assets/images/cart.png',
      ),
    );
  }
}
