import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sushi_food_app/modules/detail/models/item.dart';
import 'package:sushi_food_app/modules/order_histories/components/card_order.dart';
import 'package:sushi_food_app/modules/order_histories/components/order_empty.dart';
import 'package:sushi_food_app/redux/IStore.dart';

class ViewModel extends Equatable {
  final Map<int, CartItem> cartItems;
  final String times;
  ViewModel({
    this.cartItems,
    this.times,
  });
  @override
  List<Object> get props => [
        cartItems,
        times,
      ];
}

class CardHistory extends StatefulWidget {
  final int index;
  const CardHistory({
    Key key,
    this.index,
  }) : super(key: key);
  @override
  _CardHistoryState createState() => _CardHistoryState();
}

class _CardHistoryState extends State<CardHistory> {
  bool show = false;
  void toogleShow() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      onInit: (store) {},
      converter: (store) {
        return ViewModel(
          cartItems: store.state.history.cartItems,
          times: store.state.history.time,
        );
      },
      builder: (context, viewModel) {
        double cost = 0.0;
        viewModel.cartItems.forEach((key, value) {
          cost = cost + (value.numOfItems * value.sushi.price);
        });
        if (viewModel.cartItems == null || viewModel.cartItems.isEmpty) {
          return OrderEmpty();
        }
        return Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$' + cost.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )),
                      Container(width: 20.0),
                      Text(
                        viewModel.times.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  FlatButton(
                    child: show
                        ? Icon(Icons.arrow_drop_down)
                        : Icon(Icons.arrow_drop_up),
                    onPressed: () => toogleShow(),
                  )
                ],
              ),
              show
                  ? ListView(
                      shrinkWrap: true,
                      children: viewModel.cartItems.entries
                          .map(
                            (entry) => CardOrder(id: entry.value.sushi.id),
                          )
                          .toList(),
                    )
                  : Container()
            ],
          ),
        );
      },
    );
  }
}
