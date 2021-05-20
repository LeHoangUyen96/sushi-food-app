import 'package:sushi_food_app/modules/payment/models/payment.dart';
import 'package:sushi_food_app/modules/payment/redux/action.dart';
import 'package:redux/redux.dart';

final Reducer<Payment> paymentReducer =
    combineReducers(<Payment Function(Payment, dynamic)>[
  TypedReducer<Payment, SetSelectedPaymentMethod>(setSelectedPaymentMethod),
]);

Payment setSelectedPaymentMethod(
    Payment state, SetSelectedPaymentMethod action) {
  return state.copyWith(
    selectedPaymentMethod: action.selectedPaymentMethod,
  );
}
