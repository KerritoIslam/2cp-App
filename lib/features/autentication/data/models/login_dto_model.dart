import 'package:app/features/autentication/data/models/user_model.dart';

class LoginResDtoModel {
  final TokensModel tokens;
  final UserModel user;

  LoginResDtoModel({required this.tokens,required this.user});
  factory LoginResDtoModel.fromJson(Map<String, dynamic> json) {
    return LoginResDtoModel(
      tokens: TokensModel.fromJson(json['tokens']),
          user: UserModel.fromJson(json['user']),
    );
  }
}
class TokensModel {
  final String accessToken;
  final String refreshToken;

  TokensModel({required this.accessToken, required this.refreshToken});
  factory TokensModel.fromJson(Map<String, dynamic> json) {
    return TokensModel(
      accessToken: json['access'],
      refreshToken: json['refresh'],
    );
  }
}

