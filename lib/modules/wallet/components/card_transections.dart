import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/wallet/constant/transection.dart';
import 'package:intl/intl.dart';

class Transections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(children: [
      ...List.generate(
        transection.length,
        (index) {
          final row = transection[index];
          return Container(
              padding: EdgeInsets.all(5.0),
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  height: size.height * 0.085,
                  width: size.width * 0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/money.png',
                          height: size.height * 0.05),
                      Container(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(row['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Container(height: 3.0),
                          Text(row['number']),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('\$' + row['money'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Container(height: 3.0),
                          Text(DateFormat('dd MMM yyyy').format(row['time'])),
                        ],
                      ),
                    ],
                  )));
        },
      ),
    ]);
  }
}
