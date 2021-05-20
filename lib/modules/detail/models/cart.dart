import 'package:equatable/equatable.dart';
import 'package:sushi_food_app/modules/detail/models/item.dart';
import 'package:sushi_food_app/modules/home/models/sushi.dart';

class Cart extends Equatable {
  final Map<int, CartItem> cartItems;
  final int tempNum;
  final Sushi tempSushi;
  final double totalMoney;

  Cart({
    this.cartItems,
    this.tempNum,
    this.tempSushi,
    this.totalMoney,
  });

  factory Cart.initialState() {
    return Cart(
      cartItems: {},
      tempNum: 1,
      tempSushi: Sushi.initialState(),
      totalMoney: 1,
    );
  }
  @override
  List<Object> get props => [
        cartItems,
        tempNum,
        tempSushi,
        totalMoney,
      ];

  Cart copyWith({
    Map<int, CartItem> cartItems,
    int tempNum,
    Sushi tempSushi,
    double totalMoney,
  }) {
    return Cart(
      cartItems: cartItems ?? this.cartItems,
      tempNum: tempNum ?? this.tempNum,
      tempSushi: tempSushi ?? this.tempSushi,
      totalMoney: totalMoney ?? this.totalMoney,
    );
  }
}

List<Cart> list = [
  Cart(
    cartItems: {},
    tempNum: 1,
    tempSushi: Sushi.initialState(),
    totalMoney: 1,
  ),
];
