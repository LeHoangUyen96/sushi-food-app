import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sushi_food_app/constants/main_constant.dart';
import 'package:sushi_food_app/modules/home/screen/home_screen.dart';
import 'package:sushi_food_app/modules/auth/helpers/check_user.dart';
import 'package:sushi_food_app/modules/auth/redux/reducers.dart';
import 'package:sushi_food_app/redux/IStore.dart';
import 'package:redux/redux.dart';
import 'package:sushi_food_app/redux/store.dart';
import 'package:sushi_food_app/routes.dart';
import 'package:sushi_food_app/modules/onboarding/screen/onboarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(SushiFoodApp()));
}

class SushiFoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sushi Food App',
          onGenerateRoute: onGenerateRoute,
          theme: ThemeData(
            primaryColor: Color(MainConstant.lightGrey),
            appBarTheme: AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Color(MainConstant.black),
              ),
              actionsIconTheme: IconThemeData(
                color: Color(MainConstant.black),
              ),
              backgroundColor: Color(MainConstant.lightGrey),
            ),
            textTheme: Theme.of(context).textTheme.apply(
                  fontFamily: 'Roboto',
                  bodyColor: Color(MainConstant.black),
                  displayColor: Color(MainConstant.black),
                ),
            scaffoldBackgroundColor: Color(MainConstant.lightGrey),
            fontFamily: 'Roboto',
          ),
          home: MyHomePage(),
        ));
  }
}

class ViewModel extends Equatable {
  final String email;
  final String password;
  ViewModel({@required this.email, this.password});
  @override
  List<Object> get props => [email, password];
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> onInit(store) async {
    await store.dispatch(loadDataAction());
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  ViewModel converter(Store<AppState> store) {
    final email = store.state.auth.email;
    final password = store.state.auth.password;
    return ViewModel(email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        onInit: (store) async => await onInit(store),
        converter: (Store<AppState> store) => converter(store),
        builder: (BuildContext context, ViewModel viewModel) {
          if (checkUser(viewModel.email, viewModel.password)) {
            return HomeScreen();
          }
          return BoardingScreen();
        });
  }
}
