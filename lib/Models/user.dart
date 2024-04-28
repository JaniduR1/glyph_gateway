import 'dart:ffi';

class User {
  int id;
  String username;
  String email;
  String password;
  Bool isPremium;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.isPremium,
  });
}
