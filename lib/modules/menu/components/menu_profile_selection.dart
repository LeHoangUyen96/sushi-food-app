import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/redux/IStore.dart';
import 'package:redux/redux.dart';

class ViewModel extends Equatable {
  final String fullName;
  final String image;

  ViewModel({
    this.fullName,
    this.image,
  });
  @override
  List<Object> get props => [
        fullName,
        image,
      ];
}

class MenuProfileSection extends StatefulWidget {
  @override
  _MenuProfileSectionState createState() => _MenuProfileSectionState();
}

class _MenuProfileSectionState extends State<MenuProfileSection> {
  Future<void> onInit(Store<AppState> store) async {}
  ViewModel converter(Store<AppState> store) {
    return ViewModel(
      fullName: store?.state?.userInfo?.fullName,
      image: store?.state?.userInfo?.image,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, ViewModel>(
        onInit: (Store<AppState> store) async => await onInit(store),
        converter: (Store<AppState> store) => converter(store),
        builder: (context, viewModel) {
          return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('profile');
              },
              child: Container(
                width: size,
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  children: [
                    Container(width: 10.0),
                    CircleAvatar(
                      radius: 24.0,
                      backgroundImage: AssetImage(viewModel.image),
                    ),
                    Container(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.fullName,
                          style: TextStyle(
                            color: Color(MainConstant.black),
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Container(height: 5.0),
                        Text(
                          'Activity',
                          style: TextStyle(
                              color: Color(MainConstant.black),
                              fontWeight: FontWeight.w100,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        });
  }
}
