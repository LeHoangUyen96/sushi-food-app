import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:sushi_food_app/modules/detail/models/item.dart';

var now = DateTime.now();
String times = DateFormat('yyyy-MM-dd kk:mm').format(now);

class History extends Equatable {
  final Map<int, CartItem> cartItems;
  final String time;
  History({
    this.cartItems,
    this.time,
  });

  factory History.initialState() {
    return History(
      cartItems: {},
      time: times,
    );
  }
  @override
  List<Object> get props => [
        cartItems,
        time,
      ];

  History copyWith({
    Map<int, CartItem> cartItems,
    String time,
  }) {
    return History(
      cartItems: cartItems ?? this.cartItems,
      time: time ?? this.time,
    );
  }
}

List<History> list = [
  History(
    cartItems: {},
    time: times,
  ),
];
