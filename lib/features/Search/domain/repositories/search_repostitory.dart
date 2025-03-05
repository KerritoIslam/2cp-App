import 'package:app/core/failure/failure.dart';
import 'package:app/features/Search/data/source/remote/SearchRemoteDataSource.dart';
import 'package:app/features/Search/domain/entities/SearchResultEntitiy.dart';
import 'package:dartz/dartz.dart';

class SearchRepository {
  final Searchremotedatasource remoteDataSource;

  SearchRepository({required this.remoteDataSource}); 

  Future<Either<Failure,SearchResult>> search(String query) async {
    try {
      final res=await remoteDataSource.Search(query) ;
      return res.fold((l)=>Left(Failure(l.message)),(r)=>Right( r.toEntity( )));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
