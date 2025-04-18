



import 'package:app/features/applications%20status/data/models/application_model.dart';
import 'package:app/features/opportunities/data/models/opportunity_model.dart';
import 'package:app/features/opportunities/domain/entities/opportunity_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/features/applications%20status/constants/status.dart';
import 'package:app/features/opportunities/data/models/company_model.dart';

void main() {
  group('ApplicationModel', () {
    // Test data for a dummy company model and application model
    final company = CompanyModel(id: 1,category: OpportunityCategory.CS.name,name: 'Test Company', profilepic: 'https://example.com/logo.png');
    final application = ApplicationModel(
      id: 123,
      proposal: 'This is a proposal',
      post: OpportunityModel.problem(id: 5, title: "Test", description: "Test", skills: ['Dart'], company: company, category: OpportunityCategory.CS),
      sumbittedAt: DateTime(2023, 1, 1),
      type: 'Full-time',
      status: ApplicationStatus.submitted,
    );

    // Test the toJson method
    test('toJson should convert ApplicationModel to a valid JSON map', () {
      final json = application.toCustomJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], '123');
      expect(json['proposal'], 'This is a proposal');
      expect(json['sumbittedAt'], '2023-01-01T00:00:00.000');
      expect(json['type'], 'Full-time');
      expect(json['status'], ApplicationStatus.submitted.name);
    });

    // Test the fromJson method
  //  test('fromJson should convert JSON map to ApplicationModel', () {
  //    final json = {
  //      'id': '123',
  //      'proposal': 'This is a proposal',
  //      'postId': '456',
  //      'company': {
  //        'id': '1',
  //        'name': 'Test Company',
  //        'profilepic': 'https://example.com/logo.png',
  //        'category' :'CS',
  //      },
  //      'sumbittedAt': '2023-01-01T00:00:00.000',
  //      'type': 'Full-time',
  //      'status': ApplicationStatus.sumbitted.name,
  //    };
  //
  //    final applicationFromJson = ApplicationModel.fromJson(json);
  //
  //    expect(applicationFromJson.id, '123');
  //    expect(applicationFromJson.proposal, 'This is a proposal');
  //    expect(applicationFromJson.sumbittedAt, DateTime(2023, 1, 1));
  //    expect(applicationFromJson.type, 'Full-time');
  //    expect(applicationFromJson.status, ApplicationStatus.sumbitted);
    //});
  });
}

