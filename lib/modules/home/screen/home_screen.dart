import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/detail/redux/action.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/home/components/item_card.dart';
import 'package:sushi_food_app/modules/home/components/navigation_bar.dart';
import 'package:sushi_food_app/modules/home/components/category.dart';
import 'package:sushi_food_app/modules/home/components/title.dart';
import 'package:sushi_food_app/modules/home/constant/sushi_constant.dart';
import 'package:sushi_food_app/modules/home/models/sushi.dart';
import 'package:sushi_food_app/modules/menu/screen/menu_screen.dart';
import 'package:sushi_food_app/redux/store.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget buildItems(List<Sushi> sushis) {
    return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        childAspectRatio: 0.7,
        physics: BouncingScrollPhysics(),
        children: sushis
            .map((sushi) => Center(
                child: InkWell(
                    onTap: () async {
                      await store.dispatch(SetTempSushi(sushi));
                      await store.dispatch(SetTempPrice(sushi.price));
                      Navigator.pushNamed(context, 'detail', arguments: sushi);
                    },
                    child: Center(child: ItemCard(sushi: sushi)))))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuScreen(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TitleHome(),
        actions: [
          IconButton(
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
              icon: Image.asset(
                'assets/icons/dots.png',
                height: 25.0,
              ))
        ],
      ),
      body: SafeArea(
          child: DefaultTabController(
        length: 3,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(MainConstant.black),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(MainConstant.lightGrey),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Container(height: size.height * 0.03),
                    Container(
                        height: size.height * 0.055,
                        width: size.width,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: TabBar(
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(MainConstant.white)),
                            tabs: [
                              Tab(child: Category(text: 'Rolls')),
                              Tab(child: Category(text: 'Soups')),
                              Tab(child: Category(text: 'Nigiri')),
                            ])),
                    Expanded(
                      child: TabBarView(
                        children: [
                          buildItems(sushis['roll']),
                          buildItems(sushis['soup']),
                          buildItems(sushis['nigiri']),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
