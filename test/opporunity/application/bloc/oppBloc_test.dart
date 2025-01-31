import 'package:app/core/failure/failure.dart';
import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/data/source/remote_data_source.dart';
import 'package:app/features/opportunities/domain/entities/opportunity_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:app/features/opportunities/domain/opportunity_repository.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';


void main() {
  //group('OpportunitiesBloc', () {
  //  late OpportunityRepository mockRepository;
  //
  //  setUp(() {
  //    mockRepository = OpportunityRepository(remoteSource: OpportunityRemoteSource());
  //  });
  //
  //  test('initial state is OpportunitiesBlocInitial', () {
  //    final bloc = OpportunitiesBlocBloc(mockRepository);
  //    expect(bloc.state, OpportunitiesBlocInitial());
  //  });
  //
  //  blocTest<OpportunitiesBlocBloc, OpportunitiesBlocState>(
  //    'emits [OpportunitiesLoadInProgress, OpportunitiesLoadSuccess] when LoadOpportunitiesEvent is added',
  //    build: () {
  //
  //      // Correctly mock the repository call
  //
  //      return OpportunitiesBlocBloc(mockRepository); // Return the bloc instance
  //    },
  //    act: (bloc) => bloc.add(LoadOpportunitiesEvent()), // Trigger the event
  //    expect: () => [
  //      OpportuntitiesLoadInProgress(),
  //      OpportuntitiesLoadSuccess([Opportunity.internship(
  //        id: '123',
  //        title: 'Internship at Company A',
  //        description: 'An amazing internship opportunity',
  //        skills: ['Flutter', 'Dart'],
  //        company: Company(id: '1', name: 'Company A', category: 'Tech', profilepic: 'profilepic.jpg'),
  //        status: OpportunityStatus.ongoing,
  //        duration: '6 months',
  //        category: 'Software',
  //      )])
  //    ],
  //  );
  //
  // });
}
