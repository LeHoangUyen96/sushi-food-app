import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/detail/models/item.dart';
import 'package:sushi_food_app/redux/IStore.dart';

class ViewModel extends Equatable {
  final Map<int, CartItem> cartItems;
  ViewModel({this.cartItems});

  @override
  List<Object> get props => [cartItems];
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
          cartItems: store.state.history.cartItems,
        );
      },
      builder: (context, viewModel) {
        final item = viewModel.cartItems[widget.id];
        return Container(
          height: MediaQuery.of(context).size.height * 0.08,
          padding: EdgeInsets.only(right: 25.0),
          child: Row(
            children: [
              Image.asset(
                item.sushi.image,
                width: 45.0,
              ),
              Container(width: 20.0),
              Text(
                item.sushi.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                item.numOfItems.toString() +
                    'X \$' +
                    item.sushi.price.toString(),
                style: TextStyle(
                  color: Color(
                    MainConstant.grey,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
