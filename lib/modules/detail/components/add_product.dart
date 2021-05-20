import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/detail/redux/action.dart';
import 'package:sushi_food_app/redux/IStore.dart';
import 'package:sushi_food_app/redux/store.dart';

class ViewModel extends Equatable {
  final int tempNum;
  ViewModel({
    this.tempNum,
  });

  @override
  List<Object> get props => [
        tempNum,
      ];
}

class AddProduct extends StatefulWidget {
  final int index;
  const AddProduct({
    Key key,
    this.index,
  }) : super(key: key);
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Future<void> decreaseNum(int number) async {
    if (number == 1) {
      return;
    }
    await store.dispatch(DecrementTemp(this.widget.index));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(onInit: (store) async {
      await store.dispatch(SetTempNumber(1));
    }, converter: (store) {
      return ViewModel(
        tempNum: store.state.cart.tempNum,
      );
    }, builder: (context, viewModel) {
      return Row(
        children: <Widget>[
          buildOutlineButton(
            icon: Icons.remove,
            press: () async {
              await decreaseNum(viewModel.tempNum);
              await store.dispatch(TotalMoney(this.widget.index));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              viewModel.tempNum.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          buildOutlineButton(
            icon: Icons.add,
            press: () async {
              await store.dispatch(IncrementTemp(widget.index));
              await store.dispatch(TotalMoney(this.widget.index));
            },
          ),
        ],
      );
    });
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
        width: 22,
        height: 22,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          color: Color(MainConstant.black),
          padding: EdgeInsets.zero,
          onPressed: press,
          child: Icon(
            icon,
            size: 12,
            color: Color(MainConstant.white),
          ),
        ));
  }
}
