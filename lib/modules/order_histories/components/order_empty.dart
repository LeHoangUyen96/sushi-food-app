import 'package:flutter/material.dart';

class OrderEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.25),
      child: Center(
        child: Column(
          children: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('home');
              },
              child: Image.asset(
                'assets/images/order-empty.png',
                height: 180.0,
              ),
            ),
            Text('Do not have any orders',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
