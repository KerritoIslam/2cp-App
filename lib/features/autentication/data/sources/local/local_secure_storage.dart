import 'package:app/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSecureStorage {
  final FlutterSecureStorage storage;
  LocalSecureStorage(this.storage);
  Future<Either<Failure, Unit>> setToken(String token) async {
    try {
      await storage.write(key: 'token', value: token);
      return Right(unit);
    } catch (e) {
      return Left(Failure('Error setting token: $e'));
    }
  }

  Future<Either<Failure, String?>> getToken() async {
    try {
      String? token = await storage.read(key: 'token');
      return right(token);
    } catch (e) {
      throw left(Failure('Error getting token: $e'));
    }
  }

  Future<void> deleteToken() async {
    try {
      await storage.delete(key: 'token');
    } catch (e) {
      throw Failure('Error deleting token: $e');
    }
  }
}
