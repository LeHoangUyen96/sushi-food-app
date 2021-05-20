import 'package:flutter/material.dart';
import 'package:sushi_food_app/modules/auth/components/image_bottom.dart';
import 'package:sushi_food_app/modules/auth/components/logo.dart';
import 'package:sushi_food_app/modules/auth/components/orange_button.dart';
import 'package:sushi_food_app/modules/auth/components/text_field.dart';
import 'package:sushi_food_app/modules/auth/components/validate.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool autoValidate = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Form(
        key: _formKey,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: size * 0.08),
                  Logo(),
                  Container(height: size * 0.05),
                  Text("Sign up",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      )),
                  Container(height: size * 0.015),
                  WhiteTextField(
                    title: 'Username',
                    autoValidate: autoValidate,
                    myController: usernameController,
                    icon: Icon(Icons.account_box),
                    onValidate: (String value) {
                      return validateUsername(usernameController.text);
                    },
                  ),
                  Container(height: size * 0.015),
                  WhiteTextField(
                    title: 'Email',
                    autoValidate: autoValidate,
                    myController: emailController,
                    icon: Icon(Icons.mail),
                    onValidate: (String value) {
                      return validateEmail(emailController.text);
                    },
                  ),
                  Container(height: size * 0.015),
                  WhiteTextField(
                    title: 'Password',
                    autoValidate: autoValidate,
                    myController: passwordController,
                    icon: Icon(Icons.lock),
                    onValidate: (String value) {
                      return validatePassword(passwordController.text);
                    },
                  ),
                  Container(height: size * 0.015),
                  OrangeButton(
                    topTitle: 'Sign up',
                    bottomTitle: 'Sign in',
                    submit: onSuccess,
                    changePage: () {
                      Navigator.of(context).pushNamed('sign_in');
                    },
                  ),
                  Container(height: size * 0.08),
                  ImageBottom()
                ],
              ),
            )));
  }

  void onSuccess() {
    if (_formKey.currentState.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign up Success')));
    }
  }
}
