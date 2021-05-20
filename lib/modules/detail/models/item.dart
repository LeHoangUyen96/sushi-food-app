import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sushi_food_app/modules/home/models/sushi.dart';

class CartItem extends Equatable {
  final Sushi sushi;
  final int numOfItems;
  final double price;
  final bool isFavorite;

  CartItem({
    @required this.sushi,
    this.numOfItems,
    this.price,
    this.isFavorite,
  });

  factory CartItem.initialState() {
    return CartItem(
      sushi: Sushi.initialState(),
      numOfItems: 0,
      price: 0,
      isFavorite: false,
    );
  }

  CartItem copyWith({
    Sushi sushi,
    int numOfItems,
    double price,
    bool isFavorite,
  }) {
    return CartItem(
      sushi: sushi ?? this.sushi,
      numOfItems: numOfItems ?? this.numOfItems,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object> get props => [
        sushi,
        numOfItems,
        price,
        isFavorite,
      ];
}

List<CartItem> demoCartItems = [];
