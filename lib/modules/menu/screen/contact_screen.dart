import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/menu/components/contact.dart';
import 'package:url_launcher/url_launcher.dart';

String url = 'http://sntsolutions.io/';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(MainConstant.orange),
          leading: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  Icon(Icons.arrow_back_ios, color: Color(MainConstant.black))),
          title: Text('Contact', style: TextStyle(fontSize: 22)),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(height: 20.0),
                Contact(
                  icon: Icon(Icons.person, color: Color(MainConstant.black)),
                  preText: 'Name Company',
                  suxText: 'SNT Solutions Co.,Ltd',
                ),
                Contact(
                  icon: Icon(Icons.phone, color: Color(MainConstant.black)),
                  preText: 'Phone',
                  suxText: '+84909168777',
                ),
                Contact(
                  icon: Icon(Icons.web, color: Color(MainConstant.black)),
                  open: () {
                    openUrl();
                  },
                  suxText: url,
                  preText: 'Website',
                ),
              ],
            )));
  }

  openUrl() {
    launch(url);
  }
}
