import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sushi_food_app/modules/auth/components/validate.dart';
import 'package:sushi_food_app/modules/profile/components/avatar.dart';
import 'package:sushi_food_app/modules/profile/components/info.dart';
import 'package:sushi_food_app/modules/profile/components/textfield.dart';
import 'package:sushi_food_app/modules/profile/redux/reducer.dart';
import 'package:sushi_food_app/redux/IStore.dart';
import 'package:sushi_food_app/redux/store.dart';

class ViewModel extends Equatable {
  final String fullName;
  final String phone;
  final String email;
  final String password;
  final String location;
  final String job;

  ViewModel({
    this.fullName,
    this.phone,
    this.email,
    this.password,
    this.location,
    this.job,
  });
  @override
  List<Object> get props => [
        fullName,
        phone,
        email,
        password,
        location,
        job,
      ];
}

class EditProfile extends StatefulWidget {
  Future<void> onInit(Store<AppState> store) async {}
  ViewModel converter(Store<AppState> store) {
    return ViewModel(
      fullName: store?.state?.userInfo?.fullName,
      email: store?.state?.userInfo?.email,
      password: store?.state?.userInfo?.password,
      phone: store?.state?.userInfo?.phone,
      location: store?.state?.userInfo?.location,
      job: store?.state?.userInfo?.job,
    );
  }

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  Future<void> onInit(Store<AppState> store) async {}
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return StoreConnector<AppState, ViewModel>(
        onInit: (Store<AppState> store) async => await onInit(store),
        converter: (store) {
          return ViewModel(
            fullName: store?.state?.userInfo?.fullName ?? '',
            phone: store?.state?.userInfo?.phone ?? '',
            email: store?.state?.userInfo?.email ?? '',
            password: store?.state?.userInfo?.password ?? '',
            location: store?.state?.userInfo?.location ?? '',
            job: store?.state?.userInfo?.job ?? '',
          );
        },
        builder: (context, viewModel) {
          return Scaffold(
              appBar: AppBar(
                leading: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/icons/back.png')),
                actions: [
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () async {
                      await store.dispatch(setUserInfoActions(
                        fullName: fullNameController.text,
                        phone: phoneNumberController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        location: locationController.text,
                        job: jobController.text,
                      ));
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Saved')));
                    },
                  )
                ],
              ),
              body: Form(
                  key: scaffoldKey,
                  child: ListView(children: [
                    Avatar(),
                    Container(height: size * 0.03),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InfoTextField(
                              title: 'FullName',
                              placeholder: viewModel.fullName,
                              myController: fullNameController,
                            ),
                            InfoTextField(
                              title: 'Email',
                              placeholder: viewModel.email,
                              myController: emailController,
                              onValidate: (String value) {
                                return validateEmail(emailController.text);
                              },
                            ),
                            InfoTextField(
                              title: 'Phone Number',
                              placeholder: viewModel.phone,
                              keyboardEmailAddress: TextInputType.phone,
                              myController: phoneNumberController,
                            ),
                            InfoTextField(
                              title: 'Location',
                              placeholder: viewModel.location,
                              myController: locationController,
                            ),
                            InfoTextField(
                              title: 'Your Job',
                              placeholder: viewModel.job,
                              myController: jobController,
                            ),
                            InfoTextField(
                              title: 'Password',
                              myController: passwordController,
                              isShowPassword: true,
                              onValidate: (String value) {
                                return validatePassword(
                                    passwordController.text);
                              },
                            ),
                          ],
                        )),
                    Container(height: size * 0.08),
                    Information()
                  ])));
        });
  }
}
