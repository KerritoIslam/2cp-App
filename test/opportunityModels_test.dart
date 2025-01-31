
import 'package:app/features/opportunities/domain/entities/opportunity_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/features/opportunities/data/models/company_model.dart';
import 'package:app/features/opportunities/data/models/opportunity_model.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';

void main() {
  group('CompanyModel Tests', () {
    test('fromJson should return a valid model', () {
      final json = {
        'id': '1',
        'name': 'Tech Corp',
        'category': 'Tech',
        'profilepic': 'https://example.com/image.png'
      };
      final model = CompanyModel.fromJson(json);
      expect(model.id, '1');
      expect(model.name, 'Tech Corp');
      expect(model.category, 'Tech');
      expect(model.profilepic, 'https://example.com/image.png');
    });

    test('toJson should return a valid map', () {
      final model = CompanyModel(
        id: '1',
        name: 'Tech Corp',
        category: 'Tech',
        profilepic: 'https://example.com/image.png',
      );
      final json = model.toJson();
      expect(json['id'], '1');
      expect(json['name'], 'Tech Corp');
      expect(json['category'], 'Tech');
      expect(json['profilepic'], 'https://example.com/image.png');
    });
  });

  group('Company Entity Tests', () {
    test('fromModel should correctly map CompanyModel to Company', () {
      final model = CompanyModel(
        id: '1',
        name: 'Tech Corp',
        category: 'Law',
        profilepic: 'https://example.com/image.png',
      );
      final entity = Company.fromModel(model);
      expect(entity.id, model.id);
      expect(entity.name, model.name);
      expect(entity.profilepic, model.profilepic);
    });

    test('toModel should correctly map Company to CompanyModel', () {
      final entity = Company(
        id: '1',
        name: 'Tech Corp',
        category: 'Law',
        profilepic: 'https://example.com/image.png',
      );
      final model = entity.toModel();
      expect(model.id, entity.id);
      expect(model.name, entity.name);
      expect(model.profilepic, entity.profilepic);
    });
  });

  group('OpportunityModel Tests', () {
    test('fromJson should return a valid internship model', () {
      final json = {
        'id': '101',
        'title': 'Software Internship',
        'description': 'Internship at Tech Corp',
        'skills': ['Dart', 'Flutter'],
        'company': {
          'id': '1',
          'name': 'Tech Corp',
          'category': 'CS',
          'profilepic': 'https://example.com/image.png'
        },
        'status': 'ongoing',
        'duration': '6 months',
        'type': 'internship',
        'category': 'CS'
      };
      final model = OpportunityModel.fromJson(json) as InternshipModel;
      expect(model.id, '101');
      expect(model.title, 'Software Internship');
      expect(model.skills, contains('Dart'));
    });

    test('toJson should return a valid map', () {
      final model = OpportunityModel.internship(
        id: '101',
        title: 'Software Internship',
        description: 'Internship at Tech Corp',
        skills: ['Dart', 'Flutter'],
        company: CompanyModel(
          id: '1',
          name: 'Tech Corp',
          category: 'Law',
          profilepic: 'https://example.com/image.png',
        ),
        duration: '6 months',
        category: OpportunityCategory.CS,
      
      );
      final json = model.toJson();
      expect(json['id'], '101');
      expect(json['title'], 'Software Internship');
      expect(json['skills'], contains('Dart'));
    });
  });
}
