import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/detail/components/add_product.dart';
import 'package:sushi_food_app/modules/detail/components/cart.dart';
import 'package:sushi_food_app/modules/detail/components/description.dart';
import 'package:sushi_food_app/modules/detail/components/image_product.dart';
import 'package:sushi_food_app/modules/detail/components/total_money.dart';
import 'package:sushi_food_app/modules/home/models/sushi.dart';

class DetailScreen extends StatefulWidget {
  final Sushi sushi;
  DetailScreen({Key key, this.sushi}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/icons/back.png')),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageProduct(sushi: widget.sushi),
                Container(height: 30.0),
                Text(
                  widget.sushi.ingredient,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Text(widget.sushi.name,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700)),
                      AddProduct()
                    ])),
                Container(height: 5.0),
                Description(),
                Container(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TotalPrice(),
                    CartIcon(),
                  ],
                )
              ],
            )));
  }
}
