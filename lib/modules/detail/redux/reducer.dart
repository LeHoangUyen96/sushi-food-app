import 'package:sushi_food_app/modules/detail/models/cart.dart';
import 'package:sushi_food_app/modules/detail/models/item.dart';
import 'package:sushi_food_app/modules/detail/redux/action.dart';
import 'package:redux/redux.dart';

final Reducer<Cart> cartReducer =
    combineReducers(<Cart Function(Cart, dynamic)>[
  TypedReducer<Cart, AddNewCartItem>(onAddNewCartItem),
  TypedReducer<Cart, SetTempNumber>(onSetTempNumber),
  TypedReducer<Cart, SetTempSushi>(onSetTempSushi),
  TypedReducer<Cart, SetTempPrice>(onSetTempPrice),
  TypedReducer<Cart, IncrementTemp>(onIncrementTemp),
  TypedReducer<Cart, DecrementTemp>(onDecrementTemp),
  TypedReducer<Cart, TotalMoney>(onTotalMoney),
  TypedReducer<Cart, DeleteItem>(onDeleteItem),
  TypedReducer<Cart, ClearItem>(onClearItem),
]);

Cart onSetTempSushi(Cart state, SetTempSushi action) {
  state = state.copyWith(tempSushi: action.sushi);
  return state;
}

Cart onSetTempNumber(Cart state, SetTempNumber action) {
  state = state.copyWith(tempNum: action.num);
  return state;
}

Cart onSetTempPrice(Cart state, SetTempPrice action) {
  state = state.copyWith(totalMoney: action.price);
  return state;
}

Cart onIncrementTemp(Cart state, IncrementTemp action) {
  final int tempNumber = state.tempNum;
  state = state.copyWith(tempNum: tempNumber + 1);
  return state;
}

Cart onDecrementTemp(Cart state, DecrementTemp action) {
  final int tempNumber = state.tempNum;
  state = state.copyWith(tempNum: tempNumber - 1);
  return state;
}

Cart onTotalMoney(Cart state, TotalMoney action) {
  final double price = state.tempSushi.price;
  final int tempNumber = state.tempNum;
  state = state.copyWith(totalMoney: price * tempNumber);
  return state;
}

Cart onAddNewCartItem(Cart state, AddNewCartItem action) {
  final newCartItems = {...state.cartItems};
  if (newCartItems[action.sushi.id] != null) {
    var cartItem = newCartItems[action.sushi.id];
    cartItem = cartItem.copyWith(
      numOfItems: cartItem.numOfItems + action.number,
    );
    newCartItems[action.sushi.id] = cartItem;
    state = state.copyWith(cartItems: newCartItems);
    return state;
  }
  newCartItems[action.sushi.id] = CartItem(
    sushi: action.sushi,
    numOfItems: action.number,
    price: action.price,
  );
  state = state.copyWith(cartItems: newCartItems);
  return state;
}

Cart onDeleteItem(Cart state, DeleteItem action) {
  final newCartItems = {...state.cartItems};
  newCartItems.remove(action.id);
  state = state.copyWith(cartItems: newCartItems);
  return state;
}

Cart onClearItem(Cart state, ClearItem action) {
  state = state.copyWith(
    cartItems: {},
    totalMoney: 0.0,
  );
  return state;
}
