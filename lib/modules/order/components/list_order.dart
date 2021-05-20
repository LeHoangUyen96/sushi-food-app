import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/detail/models/item.dart';
import 'package:sushi_food_app/modules/detail/redux/action.dart';
import 'package:sushi_food_app/modules/order/components/card_order.dart';
import 'package:sushi_food_app/modules/order/components/cart_empty.dart';
import 'package:sushi_food_app/modules/order/components/infor_order.dart';
import 'package:sushi_food_app/redux/IStore.dart';
import 'package:sushi_food_app/redux/store.dart';

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

class ListOrder extends StatefulWidget {
  @override
  _ListOrderState createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 0.75;
    return StoreConnector<AppState, ViewModel>(
      onInit: (store) {},
      converter: (store) {
        return ViewModel(
          cartItems: store.state.cart.cartItems,
          totalMoney: store.state.cart.totalMoney,
        );
      },
      builder: (context, viewModel) {
        if (viewModel.cartItems == null || viewModel.cartItems.isEmpty) {
          return CartEmpty();
        }

        double cost = 0.0;
        viewModel.cartItems.forEach((key, value) {
          cost = cost + (value.numOfItems * value.sushi.price);
        });
        return Stack(
          children: [
            Container(
              height: size,
              child: ListView(
                shrinkWrap: true,
                children: viewModel.cartItems.entries
                    .map(
                      (entry) => Container(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.horizontal,
                          background: Container(
                            decoration: BoxDecoration(
                              color: Color(MainConstant.lightGrey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Spacer(),
                                Icon(Icons.delete),
                                Text((entry.value.sushi.price *
                                        entry.value.numOfItems)
                                    .toString())
                              ],
                            ),
                          ),
                          onDismissed: (direction) async {
                            await store.dispatch(
                              DeleteItem(entry.value.sushi.id),
                            );
                          },
                          child: Container(
                              padding: EdgeInsets.all(5.0),
                              child: CardOrder(id: entry.key)),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: size),
              child: Column(
                children: [
                  InforOrder(title: 'Promo code', text: '25 mins'),
                  InforOrder(title: 'Delivery time', text: '236fed'),
                  InforOrder(
                      title: 'Total', text: '\$' + cost.toStringAsFixed(1)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
