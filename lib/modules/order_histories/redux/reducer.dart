import 'package:redux_thunk/redux_thunk.dart';
import 'package:sushi_food_app/modules/detail/models/item.dart';
import 'package:sushi_food_app/modules/detail/redux/action.dart';
import 'package:sushi_food_app/modules/order_histories/model/histories.dart';
import 'package:redux/redux.dart';
import 'package:sushi_food_app/modules/order_histories/redux/action.dart';
import 'package:sushi_food_app/redux/IStore.dart';
import 'package:sushi_food_app/redux/store.dart';

final Reducer<History> historyReducer =
    combineReducers(<History Function(History, dynamic)>[
  TypedReducer<History, SaveHistory>(onSaveHistory),
]);

History onSaveHistory(History state, SaveHistory action) {
  final newCartItem = {...store.state.cart.cartItems};
  final times = store.state.history.time;
  state = state.copyWith(
    cartItems: newCartItem,
    time: times,
  );
  return state;
}

ThunkAction<AppState> checkoutAction() {
  return (store) async {
    try {
      Map<int, CartItem> cartItems;
      DateTime time;
      await store.dispatch(SaveHistory(cartItems, time));
      await store.dispatch(ClearItem());
    } catch (e) {
      print(e);
    }
  };
}
