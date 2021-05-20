import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData({
  String fullName,
  String image,
  String phone,
  String email,
  String password,
  String location,
  String job,
}) async {
  final Map<String, String> userInfo = {
    'fullName': fullName,
    'image': image,
    'phone': phone,
    'email': email,
    'password': password,
    'location': location,
    'job': job,
  };
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  userInfo.forEach((key, value) {
    if (value != null && value != '') {
      preferences.setString(key, value);
    }
  });
}
