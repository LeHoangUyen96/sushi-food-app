class SetFullName {
  final String fullName;
  SetFullName(this.fullName);
}

class SetImage {
  final String image;
  SetImage(this.image);
}

class SetPhone {
  final String phone;
  SetPhone(this.phone);
}

class SetEmail {
  final String email;
  SetEmail(this.email);
}

class SetPassword {
  final String password;
  SetPassword(this.password);
}

class SetLocation {
  final String location;
  SetLocation(this.location);
}

class SetJob {
  final String job;
  SetJob(this.job);
}

class SaveInfo {
  final String fullName;
  final String image;
  final String phone;
  final String email;
  final String password;
  final String location;
  final String job;
  SaveInfo({
    this.fullName,
    this.image,
    this.phone,
    this.email,
    this.password,
    this.location,
    this.job,
  });
}
