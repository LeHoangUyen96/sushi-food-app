import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 15.0),
        Text(
            'The main ingredient is rice (mixed with awasesu mixed vinegar), seafood ingredients and can be served with seafood, seaweed or vegetables.',
            style: TextStyle(fontSize: 16)),
        Container(height: 20.0),
        Row(
          children: [
            Text('Delivery Time'),
            Container(width: 10.0),
            Icon(Icons.timer),
            Container(width: 3.0),
            Text('25 Mins', style: TextStyle(fontWeight: FontWeight.bold))
          ],
        )
      ],
    ));
  }
}
