import 'package:app/core/failure/failure.dart';
import 'package:app/features/autentication/data/remots/rest_auth_remote.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final RestAuthRemote restAuthRemote;
  AuthRepository({required this.restAuthRemote});
  Future<Either<Failure, Response>> login(
      String email, String password) async {
    try {
      final response = await restAuthRemote.login(email, password);
      return response.fold((failure) => left(failure), (response) => right(response));
    }on Failure catch (e) {
      return left(Failure(e.toString()));
    }
  }
  Future<Either<Failure, Response>> register(
      String name, String email, String password) async {
    try {
      final response = await restAuthRemote.register(name, email, password);
      return response.fold((failure) => left(failure), (response) => right(response));
    }on Failure catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
