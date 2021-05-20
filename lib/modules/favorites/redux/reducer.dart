import 'package:sushi_food_app/modules/favorites/models/favorite.dart';
import 'package:sushi_food_app/modules/favorites/redux/action.dart';
import 'package:redux/redux.dart';
import 'package:sushi_food_app/modules/home/models/sushi.dart';

final Reducer<CartFavorite> cartFavoriteReducer =
    combineReducers(<CartFavorite Function(CartFavorite, dynamic)>[
  TypedReducer<CartFavorite, Favorites>(addFavorite),
]);

CartFavorite addFavorite(CartFavorite state, Favorites action) {
  final Map<int, Sushi> favorites = state.sushi;
  if (favorites[action.sushi?.id] == null) {
    favorites[action.sushi?.id] = action.sushi;
    state.copyWith(sushi: favorites);
    return state;
  }

  favorites.remove(action.sushi?.id);
  state.copyWith(sushi: favorites);
  return state;
}
