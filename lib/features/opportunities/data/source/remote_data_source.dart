
import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/opportunities/data/models/company_model.dart';
import 'package:app/features/opportunities/data/models/opportunity_model.dart';
import 'package:dartz/dartz.dart';

//Note that this will be removed once the backend is ready
class MockData{
  static List<Map<String,dynamic>> opportunityList=
[
  {
    "type": "internship",
    "id": "1",
    "title": "Software Engineering Internship",
    "description": "Gain hands-on experience in software development.",
    "skills": ["Dart", "Flutter", "Firebase"],
    "company": {
      "id": "101",
      "name": "TechCorp",
      "category": "CS",
      "profilepic": "https://avatars.githubusercontent.com/u/145935984?v=4"
    },
    "status": "ongoing",
    "duration": "3 months",
    "category": "CS"
  },
  {
    "type": "internship",
    "id": "2",
    "title": "Data Science Internship",
    "description": "Work on cutting-edge AI models and data analysis.",
    "skills": ["Python", "TensorFlow", "SQL"],
    "company": {
      "id": "102",
      "name": "AI Solutions",
      "category": "CS",
      "profilepic": "https://avatars.githubusercontent.com/u/145935984?v=4"
    },
    "status": "pending",
    "duration": "6 months",
    "category": "CS"
  },
  {
    "type": "Problem",
    "id": "3",
    "title": "AI Bias Detection",
    "description": "Develop an AI model to detect biases in hiring processes.",
    "skills": ["Machine Learning", "Ethics", "NLP"],
    "company": {
      "id": "103",
      "name": "FairAI",
      "category": "CS",
      "profilepic": "https://avatars.githubusercontent.com/u/145935984?v=4"
    },
    "status": "ongoing",
    "category": "CS"
  },
  {
    "type": "Problem",
    "id": "4",
    "title": "Sustainable Energy Challenge",
    "description": "Create a model to optimize energy consumption in urban areas.",
    "skills": ["Renewable Energy", "Simulation", "Mathematical Modeling"],
    "company": {
      "id": "104",
      "name": "GreenFuture",
      "category": "EG",
      "profilepic": "https://avatars.githubusercontent.com/u/145935984?v=4"
    },
    "status": "ended",
    "category": "EG"
  },
  {
    "type": "internship",
    "id": "5",
    "title": "Healthcare Data Analyst",
    "description": "Analyze patient data and optimize medical processes.",
    "skills": ["R", "Data Visualization", "Healthcare Analytics"],
    "company": {
      "id": "105",
      "name": "MediTech",
      "category": "HL",
      "profilepic": "https://avatars.githubusercontent.com/u/145935984?v=4"
    },
    "status": "ongoing",
    "duration": "4 months",
    "category": "HL"
  },
  {
    "type": "Problem",
    "id": "6",
    "title": "LegalTech Innovation",
    "description": "Build an AI-powered contract review system.",
    "skills": ["Legal Compliance", "AI", "NLP"],
    "company": {
      "id": "106",
      "name": "LexAI",
      "category": "LW",
      "profilepic": "https://avatars.githubusercontent.com/u/145935984?v=4"
    },
    "status": "pending",
    "category": "LW"
  }
];
  static List<Map<String,dynamic>> companies=[
  {
    "id": "101",
    "name": "TechCorp",
    "category": "CS",
    "profilepic": "https://avatars.githubusercontent.com/u/145935984?v=4"
  },
  {
    "id": "102",
    "name": "AI Solutions",
    "category": "CS",
    "profilepic": "https://avatars.githubusercontent.com/u/145935984?v=4"
  },
  {
    "id": "103",
    "name": "FairAI",
    "category": "CS",
    "profilepic": "https://avatars.githubusercontent.com/u/145935984?v=4"
  },
 ];

  
}

class OpportunityRemoteSource{
  //TODO do Error Handling based on the response status code
  final dio = DioServices.dio;
  Future<Either<Failure,List<OpportunityModel>>>getOpportunitiesPagination(int page ,int limit)async{
try  {   await Future.delayed(Duration(milliseconds: 1500));
    return Right(MockData.opportunityList.map((e) => OpportunityModel.fromJson(e)).toList());
  }catch(e){
    return Left(Failure(e.toString()));
  }
  }
  Future<Either<Failure,OpportunityModel>> getOpportunityById(String id)async{
try  {     await Future.delayed(Duration(milliseconds: 20));
    return Right(MockData.opportunityList.map((e) => OpportunityModel.fromJson(e)).firstWhere((element) => element.id==id));
  }catch(e){
      return left( Failure(e.toString()) );
    }  }
  Future<Either<Failure,CompanyModel>> getCompanyById(String id)async{
try  {     await Future.delayed(Duration(milliseconds: 20));
    return Right(MockData.companies.map((e) => CompanyModel.fromJson(e)).firstWhere((element) => element.id==id));
  }catch(e){
      return left( Failure(e.toString()) );
    }  }
  Future<Either<Failure,OpportunityModel>>saveOpportunity(String id)async{
try  {     await Future.delayed(Duration(milliseconds: 20));
    return Right(MockData.opportunityList.map((e) => OpportunityModel.fromJson(e)).firstWhere((element) => element.id==id));
  }catch(e){
      return left(Failure(e.toString()));
    }  }
  Future<Either<Failure,Unit>>removeSavedOpportunity(String id)async{
    try{
 await Future.delayed(Duration(milliseconds: 20));
    return Right(unit);

    }catch(e){
     return Left(Failure(e.toString()));
    }
     }
  Future<Either<Failure,List<OpportunityModel>>>getSavedOpportunities()async{
try  {     await Future.delayed(Duration(milliseconds: 20));
    return Right(MockData.opportunityList.map((e) => OpportunityModel.fromJson(e)).toList());
  }catch(e){
      return left(Failure(e.toString()) );
    }  }
}
