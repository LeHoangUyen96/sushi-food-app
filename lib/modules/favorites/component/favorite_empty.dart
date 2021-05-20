import 'package:flutter/material.dart';

class FavoritesEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.height * 0.06,
        vertical: size.width * 0.3,
      ),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/favorite_empty.png',
            ),
            Text('There are no favorites', style: TextStyle(fontSize: 23)),
          ],
        ),
      ),
    );
  }
}
