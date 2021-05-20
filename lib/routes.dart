import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/auth/screens/signin_screen.dart';
import 'package:sushi_food_app/modules/auth/screens/signup_screen.dart';
import 'package:sushi_food_app/modules/detail/screen/detail_screen.dart';
import 'package:sushi_food_app/modules/favorites/screen/favorite_screen.dart';
import 'package:sushi_food_app/modules/home/screen/home_screen.dart';
import 'package:sushi_food_app/modules/menu/screen/contact_screen.dart';
import 'package:sushi_food_app/modules/menu/screen/menu_screen.dart';
import 'package:sushi_food_app/modules/onboarding/screen/onboarding_screen.dart';
import 'package:sushi_food_app/modules/order/screen/order_screen.dart';
import 'package:sushi_food_app/modules/payment/screen/payment_screen.dart';
import 'package:sushi_food_app/modules/order_histories/screen/order_history_screen.dart';
import 'package:sushi_food_app/modules/profile/screens/edit_profile.dart';
import 'package:sushi_food_app/modules/profile/screens/profile_screen.dart';
import 'package:sushi_food_app/modules/wallet/screen/wallet_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'sign_in':
      return MaterialPageRoute(builder: (context) => SignIn());
    case 'sign_up':
      return MaterialPageRoute(builder: (context) => SignUp());
    case 'home':
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case 'detail':
      return MaterialPageRoute(
          builder: (context) => DetailScreen(sushi: settings.arguments));
    case 'menu':
      return MaterialPageRoute(builder: (context) => MenuScreen());
    case 'contact':
      return MaterialPageRoute(builder: (context) => ContactScreen());
    case 'profile':
      return MaterialPageRoute(builder: (context) => ProfileScreen());
    case 'edit_profile':
      return MaterialPageRoute(builder: (context) => EditProfile());
    case 'onboarding':
      return MaterialPageRoute(builder: (context) => BoardingScreen());
    case 'favorited':
      return MaterialPageRoute(builder: (context) => FavoritesScreen());
    case 'order':
      return MaterialPageRoute(builder: (context) => OrderScreen());
    case 'payment':
      return MaterialPageRoute(builder: (context) => PaymentScreen());
    case 'message':
      return MaterialPageRoute(builder: (context) => OrderHistory());
    case 'wallet':
      return MaterialPageRoute(builder: (context) => WalletScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => Container(),
        settings: settings,
      );
  }
}
