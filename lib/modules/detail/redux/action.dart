import 'package:sushi_food_app/modules/home/models/sushi.dart';

class SetTempSushi {
  final Sushi sushi;
  SetTempSushi(this.sushi);
}

class SetTempPrice {
  final double price;
  SetTempPrice(this.price);
}

class SetTempNumber {
  final int num;
  SetTempNumber(this.num);
}

class IncrementTemp {
  final int index;
  IncrementTemp(this.index);
}

class DecrementTemp {
  final int index;
  DecrementTemp(this.index);
}

class TotalMoney {
  final int index;
  TotalMoney(this.index);
}

class AddNewCartItem {
  final Sushi sushi;
  final int number;
  final double price;
  AddNewCartItem(
    this.sushi,
    this.number,
    this.price,
  );
}

class DeleteItem {
  final int id;
  DeleteItem(this.id);
}

class ClearItem {}
