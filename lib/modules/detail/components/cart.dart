import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/detail/models/item.dart';
import 'package:sushi_food_app/modules/detail/redux/action.dart';
import 'package:sushi_food_app/modules/home/models/sushi.dart';
import 'package:sushi_food_app/redux/IStore.dart';
import 'package:sushi_food_app/redux/store.dart';

class ViewModel extends Equatable {
  final Map<int, CartItem> cartItems;
  final Sushi tempSushi;
  final int tempNum;
  final double totalMoney;
  ViewModel({
    this.cartItems,
    this.tempSushi,
    this.tempNum,
    this.totalMoney,
  });

  @override
  List<Object> get props => [
        cartItems,
        tempNum,
        tempSushi,
        totalMoney,
      ];
}

class CartIcon extends StatefulWidget {
  final int index;
  const CartIcon({
    Key key,
    this.index,
  }) : super(key: key);
  @override
  _CartIconState createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(onInit: (store) async {
      await store.dispatch(SetTempNumber(1));
    }, converter: (store) {
      return ViewModel(
        cartItems: store.state.cart.cartItems,
        tempSushi: store.state.cart.tempSushi,
        tempNum: store.state.cart.tempNum,
        totalMoney: store.state.cart.totalMoney,
      );
    }, builder: (context, viewModel) {
      int count = 0;
      viewModel.cartItems.forEach((key, value) {
        count = count + value.numOfItems;
      });
      return InkWell(
        onTap: () async {
          await store.dispatch(TotalMoney(this.widget.index));
          await store.dispatch(AddNewCartItem(
            viewModel.tempSushi,
            viewModel.tempNum,
            viewModel.totalMoney,
          ));
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                height: 70.0, child: Image.asset('assets/icons/black.png')),
            Image.asset(
              'assets/icons/cart.png',
              height: 30.0,
              color: Color(MainConstant.white),
            ),
            Positioned(
              top: 10.0,
              left: 45.0,
              child: Container(
                alignment: Alignment.topCenter,
                height: 17,
                width: 17,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Text(count.toString(),
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      );
    });
  }
}
