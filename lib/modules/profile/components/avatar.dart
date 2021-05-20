import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/redux/IStore.dart';

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

Future<void> onInit(store) async {}

ViewModel converter(Store<AppState> store) {
  return ViewModel(
    fullName: store?.state?.userInfo?.fullName,
    image: store?.state?.userInfo?.image,
  );
}

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return StoreConnector<AppState, ViewModel>(
        onInit: (store) async => await onInit(store),
        converter: (Store<AppState> store) => converter(store),
        builder: (BuildContext context, ViewModel viewModel) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: size * 0.15,
                      height: size * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        image: DecorationImage(
                          image: AssetImage(viewModel.image),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Container(height: 4.0),
                    Text(
                      viewModel.fullName,
                      style: TextStyle(
                          color: Color(MainConstant.black),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(height: 4.0),
                  ]));
        });
  }
}
