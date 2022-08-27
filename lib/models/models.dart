import 'package:flutter/foundation.dart';

class Users {
  int id;
  String email, firstName, lastName, avatar;

  Users({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        avatar: json['avatar']);
  }
}
