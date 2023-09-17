import 'package:firechat/core/core.dart';

class User {
  final String email;
  final String password;
  User({
    required this.email,
    required this.password,
  });

  factory User.fromJson(MapString data) {
    return User(
      email: data['email'],
      password: data['password'],
    );
  }

  MapString toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
