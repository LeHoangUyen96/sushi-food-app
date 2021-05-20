import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/menu/components/menu_profile_selection.dart';
import 'package:sushi_food_app/modules/menu/components/menu_list.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              MenuProfileSection(),
              Container(height: MediaQuery.of(context).size.height * 0.03),
              MenuList(),
            ],
          )
        ),
      ),
    );
  }
}
