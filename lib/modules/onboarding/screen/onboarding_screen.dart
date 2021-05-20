import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/onboarding/components/skip_button.dart';
import 'package:sushi_food_app/modules/onboarding/components/boarding.dart';
import 'package:sushi_food_app/modules/onboarding/constant/boarding_content.dart';

class BoardingScreen extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final controller = PageController();

  void buildAction(String action) {
    if (action == 'done') {
      Navigator.of(context).pushNamed('sign_in');
      return;
    }
  }

  List<Widget> buildPages() {
    final size = MediaQuery.of(context).size;
    return boardingContent.map((boarding) {
      return Column(children: [
        Boarding(
          image: boarding['image'],
          content: boarding['content'],
          onSwipeRight: () => buildAction(boarding['action']),
        ),
        Container(height: size.height * 0.06),
      ]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        controller: controller,
        children: buildPages(),
      )),
      floatingActionButton: SkipButton(),
    );
  }
}
