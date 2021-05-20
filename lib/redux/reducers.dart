import 'package:sushi_food_app/modules/auth/redux/reducers.dart';
import 'package:sushi_food_app/modules/detail/redux/reducer.dart';
import 'package:sushi_food_app/modules/payment/redux/reducer.dart';
import 'package:sushi_food_app/modules/order_histories/redux/reducer.dart';
import 'package:sushi_food_app/modules/favorites/redux/reducer.dart';
import 'package:sushi_food_app/modules/profile/redux/reducer.dart';
import 'IStore.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    auth: authReducer(state.auth, action),
    cart: cartReducer(state.cart, action),
    userInfo: userInfoReducer(state.userInfo, action),
    payment: paymentReducer(state.payment, action),
    history: historyReducer(state.history, action),
    cartFavorite: cartFavoriteReducer(state.cartFavorite, action),
  );
}
