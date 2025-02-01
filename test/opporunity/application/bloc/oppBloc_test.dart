
import 'package:app/core/failure/failure.dart';
import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/domain/entities/opportunity_constants.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:app/features/opportunities/domain/opportunity_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Create a MockOpportunityRepository using mocktail.
class MockOpportunityRepository extends Mock implements OpportunityRepository {}

void main() {
  group('OpportunitiesBloc', () {
    late MockOpportunityRepository mockRepository;

    setUp(() {
      mockRepository = MockOpportunityRepository();
    });

    test('initial state is OpportunitiesBlocInitial', () {
      final bloc = OpportunitiesBlocBloc(mockRepository);
      expect(bloc.state, isA<OpportunitiesBlocInitial>());
    });

    blocTest<OpportunitiesBlocBloc, OpportunitiesBlocState>(
      'emits [OpportuntitiesLoadInProgress, OpportuntitiesLoadSuccess] when LoadOpportunitiesEvent is added',
      build: () {
        final company = Company(
          id: '1',
          name: 'Company A',
          category: 'Tech',
          profilepic: 'profilepic.jpg',
        );
        final opportunities = [
          Opportunity.internship(
            id: '123',
            title: 'Internship at Company A',
            description: 'An amazing internship opportunity',
            skills: ['Flutter', 'Dart'],
            company: company,
            duration: '6 months',
            category: 'Software',
          ),
        ];

        // Use mocktail's syntax with a lambda.
        when(() => mockRepository.getOpportunitiesPagination(1, 15))
            .thenAnswer((_) async => Right(opportunities));

        return OpportunitiesBlocBloc(mockRepository);
      },
      act: (bloc) => bloc.add(LoadOpportunitiesEvent()),
      expect: () => [
        OpportuntitiesLoadInProgress(),
        OpportuntitiesLoadSuccess([
          Opportunity.internship(
            id: '123',
            title: 'Internship at Company A',
            description: 'An amazing internship opportunity',
            skills: ['Flutter', 'Dart'],
            company: Company(
              id: '1',
              name: 'Company A',
              category: 'Tech',
              profilepic: 'profilepic.jpg',
            ),
            status: OpportunityStatus.ongoing,
            duration: '6 months',
            category: 'Software',
          )
        ]),
      ],
    );

    blocTest<OpportunitiesBlocBloc, OpportunitiesBlocState>(
      'emits [OpportuntitiesLoadInProgress, OpportuntitiesLoadFailure] when LoadOpportunitiesEvent fails',
      build: () {
        // Mock a failure response.
        when(() => mockRepository.getOpportunitiesPagination(1,15))
            .thenAnswer(
                (_) async => Left(Failure('Failed to load opportunities')));

        return OpportunitiesBlocBloc(mockRepository);
      },
      act: (bloc) => bloc.add(LoadOpportunitiesEvent()),
      expect: () => [
        OpportuntitiesLoadInProgress(),
        OpportuntitiesLoadFailure('Failed to load opportunities'),
      ],
    );
  });
}

