import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/detail/models/item.dart';
import 'package:sushi_food_app/redux/IStore.dart';

class ViewModel extends Equatable {
  final Map<int, CartItem> cartItems;
  final double totalMoney;
  ViewModel({
    this.cartItems,
    this.totalMoney,
  });

  @override
  List<Object> get props => [
        cartItems,
        totalMoney,
      ];
}

class CardOrder extends StatefulWidget {
  final int id;
  CardOrder({this.id});
  @override
  _CardOrderState createState() => _CardOrderState();
}

class _CardOrderState extends State<CardOrder> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      onInit: (store) {},
      converter: (store) {
        return ViewModel(
          cartItems: store.state.cart.cartItems,
          totalMoney: store.state.cart.totalMoney,
        );
      },
      builder: (context, viewModel) {
        final size = MediaQuery.of(context).size.height * 0.06;
        final item = viewModel.cartItems[widget.id];
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              height: size * 2,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 5,
                      blurRadius: 15.0,
                      color: Color(0xFFC2C2C2).withOpacity(0.5),
                      offset: Offset(0, 10))
                ],
                color: Color(MainConstant.lightGrey),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                children: [
                  Container(
                    height: size * 0.13,
                    width: size * 0.1,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Image.asset(item.sushi.image, width: 80.0),
                  Container(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.sushi.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(item.sushi.ingredient),
                      Row(children: [
                        Text('\$'),
                        Text((item.sushi.price * item.numOfItems)
                            .toStringAsFixed(1))
                      ])
                    ],
                  ),
                  Spacer(),
                  Text(
                    item.numOfItems.toString() + 'X',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(width: 20.0)
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
