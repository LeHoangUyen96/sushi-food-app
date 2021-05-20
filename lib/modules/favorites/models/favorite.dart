import 'package:equatable/equatable.dart';
import 'package:sushi_food_app/modules/home/models/sushi.dart';

class CartFavorite extends Equatable {
  final Map<int, Sushi> sushi;
  CartFavorite({
    this.sushi,
  });

  factory CartFavorite.initialState() {
    return CartFavorite(
      sushi: {},
    );
  }
  @override
  List<Object> get props => [
        sushi,
      ];

  CartFavorite copyWith({
    Map<int, Sushi> sushi,
  }) {
    return CartFavorite(
      sushi: sushi ?? this.sushi,
    );
  }
}

List<CartFavorite> list = [
  CartFavorite(
    sushi: {},
  ),
];
