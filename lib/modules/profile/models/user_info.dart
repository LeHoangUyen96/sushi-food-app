import 'package:equatable/equatable.dart';
import 'package:sushi_food_app/modules/auth/constants/demo_user.dart';

class UserInfo extends Equatable {
  final String fullName;
  final String image;
  final String phone;
  final String email;
  final String password;
  final String location;
  final String job;
  UserInfo({
    this.fullName,
    this.image,
    this.phone,
    this.email,
    this.password,
    this.location,
    this.job,
  });
  factory UserInfo.initialState() {
    return UserInfo(
      fullName: "Jennifer Watson",
      image: "assets/images/avatar.jpg",
      phone: "+91 9876503640",
      location: "BangKok, Thailand",
      job: 'Teacher',
      email: DemoUser.email,
      password: DemoUser.password,
    );
  }
  UserInfo copyWith({
    String fullName,
    String image,
    String phone,
    String email,
    String password,
    String location,
    String job,
  }) {
    return UserInfo(
      fullName: fullName ?? this.fullName,
      image: image ?? this.image,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      location: location ?? this.location,
      job: job ?? this.job,
    );
  }

  List<Object> get props => [
        fullName,
        image,
        phone,
        email,
        password,
        location,
        job,
      ];
}
