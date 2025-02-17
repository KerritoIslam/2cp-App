import 'package:app/features/autentication/data/models/user_model.dart';

class LoginResDtoModel {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  LoginResDtoModel({required this.accessToken, required this.refreshToken, required this.user});
  factory LoginResDtoModel.fromJson(Map<String, dynamic> json) {
    return LoginResDtoModel(
      accessToken: json['access'],
      refreshToken: json['refresh'],
      user: UserModel.fromJson(json['user']),
    );
  }
}

