import 'package:app/core/failure/failure.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:app/features/profile/data/source/remote/profile_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepository(this._profileRemoteDataSource);

  Future<Either<Failure, Company>> getCompany(int id) async {
    final result = await _profileRemoteDataSource.getProfile(id);
    return result.fold(
      (failure) => left(failure),
      (company) => right(company),
    );
  }

  Future<Either<Failure, List<Opportunity>>> getOpportunities(
      int id, int page, int limit) async {
    final result =
        await _profileRemoteDataSource.getOpportunities(id, page, limit);
    return result.fold(
      (failure) => left(failure),
      (opportunities) => right(opportunities),
    );
  }
}
