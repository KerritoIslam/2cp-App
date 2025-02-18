import 'package:app/core/failure/failure.dart';
import 'package:app/features/autentication/data/models/login_dto_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSecureStorage {
  final FlutterSecureStorage storage;
  LocalSecureStorage(this.storage);
  Future<Either<Failure, Unit>> setTokens(String accessToken,String refreshToken) async {
    try {
      
      await Future.wait(
    [
          //TODO:check them for typos in debugging
          storage.write(key: 'accessToken', value: accessToken),
          storage.write(key:'refreshToken',value:refreshToken),
        ]
      );
      return Right(unit);
    } on Exception catch (e,stacktrace) {
      if (kDebugMode) {
        print(stacktrace);
      }
      return Left(Failure('Error setting token: $e'));
    }
  }

  Future<Either<Failure, TokensModel>> getTokens() async {
    try {
    final [accToken,refreshToken]=await Future.wait(
      [
          //TODO check them for typos in debugging
        storage.read(key: 'accessToken'),
        storage.read(key: 'refreshToken'),
     ]
    )
;
      return right(TokensModel(accessToken: accToken??"", refreshToken: refreshToken??""));
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
