
// ignore_for_file: non_constant_identifier_names

import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/Search/data/source/models/search_result.dart';
import 'package:app/features/opportunities/data/models/company_model.dart';
import 'package:app/features/opportunities/data/models/opportunity_model.dart';
import 'package:app/features/opportunities/domain/entities/opportunity_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class Searchremotedatasource {
  final dio = DioServices.dio;

  Future<Either<Failure, SearchResultModel>> Search(String query) async {
try  {     // Mock companies
      print('searching for $query');

    final mockCompanies = [
      CompanyModel(
        id: '101',
        name: 'Tech Corp',
        category: 'Software Development',
        profilepic: 'https://github.com/mouloud240.png',
      ),
      CompanyModel(
        id: '102',
        name: 'NestJS Solutions',
        category: 'Backend Development',
        profilepic: 'https://github.com/mouloud240.png',
      ),
    ];

    // Mock opportunities
    final mockOpportunities = [
      OpportunityModel.internship(
        id: '1',
        title: 'Flutter Developer Intern',
        description: 'Work on building a cutting-edge Flutter application.',
        skills: ['Flutter', 'Dart', 'Firebase'],
        company: mockCompanies[0],
        status: OpportunityStatus.ongoing,
        duration: '3 months',
        category: OpportunityCategory.CS,
      ),
      OpportunityModel.problem(
        id: '2',
        title: 'API Security Challenge',
        description: 'Find security vulnerabilities in APIs.',
        skills: ['Cybersecurity', 'Pentesting'],
        company: mockCompanies[1],
        status: OpportunityStatus.ongoing,
        category: OpportunityCategory.CS
        ,
      ),
    ];

    await Future.delayed(Duration(milliseconds: 500));
    if (query.isEmpty){
    return Right(SearchResultModel(
      opportunities: [],
      companies: [],
    ));
    }
    return Right(SearchResultModel(
      opportunities: mockOpportunities,
      companies: mockCompanies,
    ));
  }on DioException catch(e){
    return Left(Failure(e.message.toString()));
    }
      catch(e){
      return Left(Failure('Unkonw error'));
    } }
}

