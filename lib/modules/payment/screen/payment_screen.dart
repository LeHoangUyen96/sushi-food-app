import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/payment/components/payment_button.dart';
import 'package:sushi_food_app/modules/payment/components/payment_selected.dart';
import 'package:sushi_food_app/modules/payment/constant/payment.dart';
import 'package:sushi_food_app/modules/payment/redux/action.dart';
import 'package:sushi_food_app/redux/IStore.dart';
import 'package:sushi_food_app/redux/store.dart';
import 'package:redux/redux.dart';

class _ViewModel extends Equatable {
  final String selectedPayment;

  _ViewModel({this.selectedPayment});

  @override
  List<Object> get props => [];
}

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isSelected(String key, String selectedKey) {
    if (key == selectedKey) {
      return true;
    }
    return false;
  }

  Future<void> onSelectedPaymentChanged(String payment) async {
    await store.dispatch(SetSelectedPaymentMethod(payment));
  }

  Future<void> onInit(Store<AppState> store) async {}

  _ViewModel getConverter(Store<AppState> store) {
    return _ViewModel(
      selectedPayment: store.state.payment.selectedPaymentMethod,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInit: (store) async {
          await onInit(store);
        },
        converter: (store) => getConverter(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          final size = MediaQuery.of(context).size;
          return Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                title: Text(
                  'Payment',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                )),
            body: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PAYMENT METHOD',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Select one of the payment methods',
                    style: TextStyle(
                        color: Color(MainConstant.grey), fontSize: 16),
                  ),
                  Container(height: 20),
                  Column(
                    children: methodList.entries
                        .map(
                          (e) => PaymentSelection(
                            description: e.value.description,
                            image: e.value.image,
                            isSelected:
                                isSelected(e.key, viewModel.selectedPayment),
                            title: e.value.name,
                            onTap: () => onSelectedPaymentChanged(e.key),
                          ),
                        )
                        .toList(),
                  ),
                  Container(height: size.height * 0.42),
                  PaymentButton(),
                ],
              ),
            ),
          );
        });
  }
}
