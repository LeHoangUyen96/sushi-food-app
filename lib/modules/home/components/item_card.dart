import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/detail/models/item.dart';
import 'package:sushi_food_app/modules/favorites/redux/action.dart';
import 'package:sushi_food_app/modules/home/components/%08favorites.dart';
import 'package:sushi_food_app/modules/home/models/sushi.dart';
import 'package:sushi_food_app/redux/store.dart';

class ViewModel extends Equatable {
  final Map<int, CartItem> cartItems;
  ViewModel({
    this.cartItems,
  });
  @override
  List<Object> get props => [
        cartItems,
      ];
}

class ItemCard extends StatelessWidget {
  final Sushi sushi;
  final int index;
  const ItemCard({
    Key key,
    this.sushi,
    this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                spreadRadius: 5,
                blurRadius: 15.0,
                color: Color(0xFFC2C2C2).withOpacity(0.5),
                offset: Offset(0, 10))
          ],
          color: Color(MainConstant.lightGrey),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    height: size.height * 0.2,
                    width: size.width * 0.3,
                    child: Image.asset(sushi.image)),
                flex: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sushi.name,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      height: 1.5,
                    ),
                  ),
                  Text(
                    sushi.ingredient,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      height: 1.5,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${sushi.price}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, height: 1.5)),
                        FavoriteButton(valueChanged: (_isFavorite) async {
                          await store.dispatch(Favorites(
                            sushi,
                          ));
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container(), flex: 1),
          ],
        ),
      ),
    );
  }
}
