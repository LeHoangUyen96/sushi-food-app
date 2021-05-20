import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/profile/components/avatar.dart';
import 'package:sushi_food_app/modules/profile/components/info.dart';
import 'package:sushi_food_app/modules/profile/components/info_user.dart';
import 'package:sushi_food_app/modules/profile/components/list.dart';
import 'package:sushi_food_app/redux/IStore.dart';

class ViewModel extends Equatable {
  final String fullName;
  final String phone;
  final String email;
  final String location;
  ViewModel({
    this.fullName,
    this.phone,
    this.email,
    this.location,
  });
  @override
  List<Object> get props => [
        fullName,
        phone,
        email,
        location,
      ];
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> onInit(Store<AppState> store) async {}
  ViewModel converter(Store<AppState> store) {
    return ViewModel(
      fullName: store?.state?.userInfo?.fullName,
      email: store?.state?.userInfo?.email,
      phone: store?.state?.userInfo?.phone,
      location: store?.state?.userInfo?.location,
    );
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return StoreConnector<AppState, ViewModel>(
        onInit: (Store<AppState> store) async => await onInit(store),
        converter: (Store<AppState> store) => converter(store),
        builder: (context, viewModel) {
          return Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                leading: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('home');
                    },
                    child: Image.asset('assets/icons/back.png')),
              ),
              body: SingleChildScrollView(
                  child: Column(children: [
                Avatar(),
                Container(
                    height: 1.5,
                    width: size * 0.35,
                    color: Color(MainConstant.grey)),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: size * 0.03),
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.red),
                            Container(width: 10.0),
                            Text('Basic Info',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                            Spacer(),
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('edit_profile');
                                })
                          ],
                        ),
                        Container(height: 10.0),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(children: [
                              InfoUser(
                                  icon: Icon(Icons.mail),
                                  text: viewModel.email),
                              Container(height: 10.0),
                              InfoUser(
                                  icon: Icon(Icons.phone),
                                  text: viewModel.phone),
                              Container(height: 10.0),
                              InfoUser(
                                  icon: Icon(Icons.location_on),
                                  text: viewModel.location),
                            ])),
                        Container(height: size * 0.06),
                        ListProfile(
                            preIcon:
                                Icon(Icons.favorite_border, color: Colors.red),
                            text: 'Favorited',
                            press: () {
                              Navigator.of(context).pushNamed('favorited');
                            }),
                        ListProfile(
                            preIcon: Icon(Icons.wallet_giftcard_rounded,
                                color: Colors.red),
                            text: 'Wallet',
                            press: () {
                              Navigator.of(context).pushNamed('wallet');
                            }),
                        Container(height: size * 0.15),
                        Information()
                      ],
                    )),
              ])));
        });
  }
}
