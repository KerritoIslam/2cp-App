import 'package:app/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSecureStorage {
  final FlutterSecureStorage storage;
  LocalSecureStorage(this.storage);
  Future<Either<Failure, Unit>> setToken(
      {required String key, required String token}) async {
    try {
      await storage.write(key: key, value: token);
      return Right(unit);
    } catch (e) {
      return Left(Failure('Error setting token: $e'));
    }
  }

  Future<Either<Failure, String?>> getToken(String key) async {
    try {
      String? token = await storage.read(key: key);
      return right(token);
    } catch (e) {
      throw left(Failure('Error getting token: $e'));
    }
  }

  Future<void> deleteToken(String key) async {
    try {
      await storage.delete(key: 'token');
    } catch (e) {
      throw Failure('Error deleting token: $e');
    }
  }
}
