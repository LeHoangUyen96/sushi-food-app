import 'package:sushi_food_app/modules/detail/models/item.dart';

class SaveHistory {
  final Map<int, CartItem> cartItem;
  final DateTime time;
  SaveHistory(
    this.cartItem,
    this.time,
  );
}
