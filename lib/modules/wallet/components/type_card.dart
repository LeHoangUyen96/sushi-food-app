import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/wallet/constant/type_card.dart';

class TypeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(children: [
      ...List.generate(typeCard.length, (index) {
        final row = typeCard[index];
        return Container(
            padding: EdgeInsets.all(10.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                row['image'],
                height: size.height * 0.05,
              ),
              Container(width: 10.0),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(row['name']),
                Container(height: 5.0),
                Text(row['balance']),
              ]),
            ]));
      })
    ]);
  }
}
