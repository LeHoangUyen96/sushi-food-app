import 'package:sushi_food_app/modules/auth/constants/demo_user.dart';

bool checkUser(String email, String password) {
  if (email == DemoUser.email && password == DemoUser.password) {
    return true;
  }
  return false;
}
