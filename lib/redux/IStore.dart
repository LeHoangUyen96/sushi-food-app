import 'package:equatable/equatable.dart';
import 'package:sushi_food_app/modules/auth/models/auth.dart';
import 'package:sushi_food_app/modules/detail/models/cart.dart';
import 'package:sushi_food_app/modules/payment/models/payment.dart';
import 'package:sushi_food_app/modules/order_histories/model/histories.dart';
import 'package:sushi_food_app/modules/favorites/models/favorite.dart';
import 'package:sushi_food_app/modules/profile/models/user_info.dart';

class AppState extends Equatable {
  final Auth auth;
  final UserInfo userInfo;
  final Cart cart;
  final Payment payment;
  final History history;
  final CartFavorite cartFavorite;

  AppState({
    this.auth,
    this.userInfo,
    this.cart,
    this.payment,
    this.history,
    this.cartFavorite,
  });

  factory AppState.initial() {
    return AppState(
      auth: Auth.initial(),
      cart: Cart.initialState(),
      userInfo: UserInfo.initialState(),
      payment: Payment.initial(),
      history: History.initialState(),
      cartFavorite: CartFavorite.initialState(),
    );
  }

  AppState copyWith({
    Auth auth,
    UserInfo userInfo,
    Cart cart,
    Payment payment,
    History history,
    CartFavorite cartFavorite,
  }) {
    return AppState(
      auth: auth ?? this.auth,
      cart: cart ?? this.cart,
      userInfo: userInfo ?? this.userInfo,
      payment: payment ?? this.payment,
      history: history ?? this.history,
      cartFavorite: cartFavorite ?? this.cartFavorite,
    );
  }

  @override
  List<Object> get props => [
        auth,
        cart,
        userInfo,
        payment,
        history,
        cartFavorite,
      ];
}
