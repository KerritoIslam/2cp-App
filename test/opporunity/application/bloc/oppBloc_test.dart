import 'package:app/core/failure/failure.dart';
import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:app/features/opportunities/domain/entities/opportunity_constants.dart';
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
      final bloc = OpportunitiesBloc(mockRepository);
      expect(bloc.state, isA<OpportunitiesBlocInitial>());
    });

    blocTest<OpportunitiesBloc, OpportunitiesBlocState>(
      'emits [OpportuntitiesLoadInProgress, OpportuntitiesLoadSuccess] when LoadOpportunitiesEvent is added',
      build: () {
        final company = Company(
          id: 1,
          name: 'Company A',
          category: 'Tech',
          profilepic: 'profilepic.jpg',
        );
        final opportunities = [
          Opportunity.internship(
            id: 123,
            title: 'Internship at Company A',
            description: 'An amazing internship opportunity',
            skills: ['Flutter', 'Dart'],
            company: company,
            duration: '6 months',
            category: 'Software',
            applicantsAvatars: [],
            totalApplications: 10,
          ),
        ];

        // Use mocktail's syntax with a lambda.
        when(() => mockRepository.getOpportunitiesPagination(any(), any()))
            .thenAnswer((_) async => Right(opportunities));

        return OpportunitiesBloc(mockRepository);
      },
      act: (bloc) => bloc.add(LoadOpportunitiesEvent()),
      expect: () => [
        OpportuntitiesLoadInProgress(opportunities: []),
        OpportuntitiesLoadSuccess([
          Opportunity.internship(
            id: 123,
            title: 'Internship at Company A',
            description: 'An amazing internship opportunity',
            skills: ['Flutter', 'Dart'],
            company: Company(
              id: 1,
              name: 'Company A',
              category: 'Tech',
              profilepic: 'profilepic.jpg',
            ),
            status: OpportunityStatus.open,
            duration: '6 months',
            category: 'Software',
            applicantsAvatars: [],
            totalApplications: 10,
          )
        ]),
      ],
    );

    blocTest<OpportunitiesBloc, OpportunitiesBlocState>(
      'emits [OpportuntitiesLoadInProgress, OpportuntitiesLoadFailure] when LoadOpportunitiesEvent fails',
      build: () {
        // Mock a failure response.
        when(() => mockRepository.getOpportunitiesPagination(any(), any()))
            .thenAnswer(
                (_) async => Left(Failure('Failed to load opportunities')));

        return OpportunitiesBloc(mockRepository);
      },
      act: (bloc) => bloc.add(LoadOpportunitiesEvent()),
      expect: () => [
        OpportuntitiesLoadInProgress(opportunities: []),
        OpportuntitiesLoadFailure('Failed to load opportunities'),
      ],
    );
  });
  group("Saving Posts Test", () {
    late MockOpportunityRepository mockRepository;

    setUp(() {
      mockRepository = MockOpportunityRepository();
    });
    blocTest<OpportunitiesSavedBloc, OpportunitiesSavedState>(
        'Should Save Post Succefully if Unless It is already in the Saved Posts or No APi Error ',
        build: () {
          when(() => mockRepository.saveOpportunity(any()))
              .thenAnswer((_) async => Right(Opportunity.internship(
                    id: 5,
                    title: 'Internship at Company A',
                    description: 'An amazing internship opportunity',
                    skills: ['Flutter', 'Dart'],
                    company: Company(
                      id: 1,
                      name: 'Company A',
                      category: 'Tech',
                      profilepic: 'profilepic.jpg',
                    ),
                    duration: '6 months',
                    category: 'Software',
                    applicantsAvatars: [],
                    totalApplications: 10,
                  )));
          return OpportunitiesSavedBloc(mockRepository);
        },
        act: (bloc) {
          bloc.add(SaveOpportunityEvent(5));
          return bloc.add(SaveOpportunityEvent(5));
        },
        expect: () => [
              OpportunitySavedSucces(
                [
                  Opportunity.internship(
                    id: 5,
                    title: 'Internship at Company A',
                    description: 'An amazing internship opportunity',
                    skills: ['Flutter', 'Dart'],
                    company: Company(
                      id: 1,
                      name: 'Company A',
                      category: 'Tech',
                      profilepic: 'profilepic.jpg',
                    ),
                    duration: '6 months',
                    category: 'Software',
                    applicantsAvatars: [],
                    totalApplications: 10,
                  )
                ],
              ),
              OpportunitySavedFailure('Already Saved')
            ]);
    blocTest<OpportunitiesSavedBloc, OpportunitiesSavedState>(
        'Should Return Failure when The an error from the api',
        build: () {
          when(() => mockRepository.saveOpportunity(any())).thenAnswer(
              (_) async => Left(Failure('Failed to save opportunity')));
          return OpportunitiesSavedBloc(mockRepository);
        },
        act: (bloc) => bloc.add(SaveOpportunityEvent(5)),
        expect: () => [OpportunitySavedFailure('Failed to save opportunity')]);
    final company = Company(
      id: 1,
      name: 'Company A',
      category: 'Tech',
      profilepic: 'profilepic.jpg',
    );

    final opportunities = [
      Opportunity.internship(
        id: 123,
        title: 'Internship at Company A',
        description: 'An amazing internship opportunity',
        skills: ['Flutter', 'Dart'],
        company: company,
        duration: '6 months',
        category: 'Software',
        applicantsAvatars: [],
        totalApplications: 10,
      ),
      Opportunity.problem(
        id: 123,
        title: 'Storage Management Company A',
        description: 'We need a way to manage our storage',
        skills: ['Flutter', 'Dart'],
        company: company,
        category: 'Software',
        totalApplications: 10,
        applicantsAvatars: [],
      ),
    ];

    blocTest<OpportunitiesSavedBloc, OpportunitiesSavedState>(
        "Should Load Saved Posts Succefully",
        build: () {
          when(() => mockRepository.getSavedOpportunities())
              .thenAnswer((_) async => Right(opportunities));
          return OpportunitiesSavedBloc(mockRepository);
        },
        act: (bloc) {
          bloc.add(LoadSavedOpportunitiesEvent());
        },
        expect: () => [
              OpportunitySavedInProgress(),
              SavedOpportunitiesLoadSuccess(opportunities)
            ]);
  });
}
