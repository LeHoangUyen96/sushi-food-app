import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sushi_food_app/modules/favorites/component/card_favorites.dart';
import 'package:sushi_food_app/modules/favorites/component/favorite_empty.dart';
import 'package:sushi_food_app/modules/home/models/sushi.dart';
import 'package:sushi_food_app/redux/IStore.dart';

class ViewModel extends Equatable {
  final Map<int, Sushi> cartItems;
  final bool isFavorite;
  ViewModel({
    this.cartItems,
    this.isFavorite,
  });
  @override
  List<Object> get props => [
        cartItems,
        isFavorite,
      ];
}

class ListFavorite extends StatefulWidget {
  @override
  _ListFavoriteState createState() => _ListFavoriteState();
}

class _ListFavoriteState extends State<ListFavorite> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      onInit: (store) {},
      converter: (store) {
        return ViewModel(
          cartItems: store.state.cartFavorite.sushi,
        );
      },
      builder: (context, viewModel) {
        if (viewModel.cartItems == null || viewModel.cartItems.isEmpty) {
          return FavoritesEmpty();
        }
        return ListView(
          shrinkWrap: true,
          children: viewModel.cartItems.entries
              .map(
                (entry) => Container(
                  padding: EdgeInsets.all(5.0),
                  child: CardFavorite(id: entry.key),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
