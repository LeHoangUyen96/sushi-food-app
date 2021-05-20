String validateEmail(String value) {
  const Pattern pattern = ValidatePatern.email;
  final RegExp regex = RegExp(pattern);
  if (regex.hasMatch(value)) {
    return null;
  }
  return 'Please enter valid email (ex: example@email.com)';
}

String validateUsername(String value) {
  const Pattern pattern = ValidatePatern.username;
  final RegExp regex = RegExp(pattern);
  if (regex.hasMatch(value)) {
    return null;
  }
  return 'Please enter username';
}

String validatePassword(String value) {
  const Pattern pattern = ValidatePatern.password;
  final RegExp regex = RegExp(pattern);
  if (regex.hasMatch(value)) {
    return null;
  }
  return 'A password must have at least seven characters including one letter and one alphanumeric character.';
}

class ValidatePatern {
  static const Pattern email =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const Pattern password = r'^((?=.*\d)(?=.*[a-z]).{7,15})$';
  static const Pattern username =
      r'^([a-zA-Z0-9](_(?!(\.|_))|\.(?!(_|\.))|[a-zA-Z0-9]){6,18}[a-zA-Z0-9])$';
}
