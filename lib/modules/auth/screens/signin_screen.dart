import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/auth/components/image_bottom.dart';
import 'package:sushi_food_app/modules/auth/components/logo.dart';
import 'package:sushi_food_app/modules/auth/components/orange_button.dart';
import 'package:sushi_food_app/modules/auth/components/check_box.dart';
import 'package:sushi_food_app/modules/auth/components/text_field.dart';
import 'package:sushi_food_app/modules/auth/constants/demo_user.dart';
import 'package:sushi_food_app/modules/auth/helpers/check_user.dart';
import 'package:sushi_food_app/modules/auth/redux/reducers.dart';
import 'package:sushi_food_app/redux/store.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController =
      TextEditingController(text: DemoUser.email);
  TextEditingController passwordController =
      TextEditingController(text: DemoUser.password);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: size * 0.1),
              Logo(),
              Container(height: size * 0.06),
              Text("Sign in",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  )),
              Container(height: size * 0.02),
              WhiteTextField(
                title: 'Email',
                myController: emailController,
                icon: Icon(Icons.mail),
              ),
              Container(height: size * 0.015),
              WhiteTextField(
                  obscureText: true,
                  title: 'Password',
                  myController: passwordController,
                  icon: Icon(Icons.lock)),
              Container(height: size * 0.005),
              CheckBoxSignin(),
              Container(height: size * 0.005),
              OrangeButton(
                topTitle: 'Sign in',
                bottomTitle: 'Sign up',
                submit: onSuccess,
                changePage: () {
                  Navigator.of(context).pushNamed('sign_up');
                },
              ),
              Container(height: size * 0.08),
              ImageBottom()
            ],
          ),
        ));
  }

  void onSuccess() async {
    if (checkUser(emailController.text, passwordController.text)) {
      Navigator.of(context).pushNamed('home');
      await store.dispatch(onLoginActions(
          emailController.text, passwordController.text, context));
    }
  }
}
