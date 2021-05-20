import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sushi_food_app/modules/detail/redux/action.dart';
import 'package:sushi_food_app/redux/IStore.dart';

class ViewModel extends Equatable {
  final double totalMoney;
  final int tempNum;
  ViewModel({
    this.totalMoney,
    this.tempNum,
  });

  @override
  List<Object> get props => [
        totalMoney,
        tempNum,
      ];
}

class TotalPrice extends StatefulWidget {
  TotalPrice({
    Key key,
  }) : super(key: key);

  @override
  _TotalPriceState createState() => _TotalPriceState();
}

class _TotalPriceState extends State<TotalPrice> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(onInit: (store) async {
      await store.dispatch(SetTempNumber(1));
    }, converter: (store) {
      return ViewModel(
        totalMoney: store.state.cart.totalMoney,
        tempNum: store.state.cart.tempNum,
      );
    }, builder: (context, viewModel) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Price:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              )),
          Container(height: .0),
          Text(
            '\$' + viewModel.totalMoney.toStringAsFixed(1),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )
        ],
      );
    });
  }
}
