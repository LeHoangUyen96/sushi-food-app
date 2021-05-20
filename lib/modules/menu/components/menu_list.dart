import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/auth/redux/reducers.dart';
import 'package:sushi_food_app/modules/menu/constant/drawer.dart';
import 'package:sushi_food_app/redux/store.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  void onTap(String nextRoute, BuildContext context) async {
    if (nextRoute == 'logout') {
      await store.dispatch(logoutAction(context));
      return;
    }
    Navigator.of(context)
      ..pop()
      ..pushNamed(nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: drawer.length,
        itemBuilder: (context, index) {
          final row = drawer[index];
          return Column(
            children: [
              GestureDetector(
                  onTap: () => onTap(row['nextRoute'], context),
                  child: Container(
                      padding: EdgeInsets.only(top: 20, bottom: 8, left: 20),
                      child: Row(children: [
                        Icon(row['icon'], color: Colors.red),
                        Container(width: 10.0),
                        Text(row['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20))
                      ]))),
              (index != drawer.length - 1)
                  ? Container(
                      width: size * 3 / 4,
                    )
                  : Container()
            ],
          );
        },
      ),
    );
  }
}
