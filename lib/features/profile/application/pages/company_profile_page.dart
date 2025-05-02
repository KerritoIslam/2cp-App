import 'package:app/core/failure/failure.dart';
import 'package:app/features/opportunities/application/widgets/opportunity_card.dart';
import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:app/features/profile/domain/profile_repository.dart';
import 'package:app/shared/pages/loading_page.dart';
import 'package:app/utils/service_locator.dart';
import 'package:dartz/dartz.dart' as dz;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class CompanyProfilePage extends StatefulWidget {
  final int id;
  const CompanyProfilePage({super.key, required this.id});

  @override
  State<CompanyProfilePage> createState() => _CompanyProfilePageState();
}

class _CompanyProfilePageState extends State<CompanyProfilePage> {
  final ProfileRepository _profileRepository = locator.get<ProfileRepository>();
  late ScrollController _scrollController;
  bool _isLoadingMore = false;
  Company? _company;
  int page = 1;
  int limit = 10;
  late Future<dz.Either<Failure, dz.Unit>> _loadProfileFuture;
  final List<Opportunity> _opportunites = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _loadProfileFuture = _loadProfile(widget.id);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 600 &&
        !_isLoadingMore &&
        _opportunites.length > 9) {
      _loadMoreItems();
    }
  }

  Future<dz.Either<Failure, dz.Unit>> _loadProfile(int id) async {
    try {
      final result = await _profileRepository.getCompany(id);
      return result.fold(
        (failure) {
          print('Company fetch error: ${failure.message}');
          return dz.left(failure);
        },
        (company) async {
          _company = company;
          setState(() {});
          try {
            final opportunitiesRes =
                await _profileRepository.getOpportunities(id, page, limit);
            return opportunitiesRes.fold(
              (failure) {
                print('Opportunities fetch error: ${failure.message}');
                return dz.left(failure);
              },
              (opportunities) {
                if (opportunities.length == limit) page++;
                _opportunites.addAll(opportunities);
                return dz.right(dz.unit);
              },
            );
          } catch (e) {
            print('Opportunities fetch exception: $e');
            return dz.left(Failure(e.toString()));
          }
        },
      );
    } catch (e) {
      print('Company fetch exception: $e');
      return dz.left(Failure(e.toString()));
    }
  }

  Future<dz.Either<Failure, dz.Unit>> _loadMoreItems() async {
    setState(() => _isLoadingMore = true);

    // Simulate fetch
    final result =
        await _profileRepository.getOpportunities(widget.id, page, limit);
    return result.fold(
      (failure) {
        setState(() => _isLoadingMore = false);
        print(failure.message);
        return dz.left(failure);
      },
      (opportunities) {
        if (opportunities.length == limit) page++;
        setState(() {
          _opportunites.addAll(opportunities);

          // Append fake items for now, or call your BLoC/repo to fetch

          _isLoadingMore = false;
        });
        return dz.right(dz.unit);
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dz.Either<Failure, dz.Unit>>(
        future: _loadProfileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              _company == null) {
            return LoadingPage();
          }

          if (snapshot.hasError || _company == null) {
            return Scaffold(
              body: SingleChildScrollView(
                child: RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      _loadProfileFuture = _loadProfile(widget.id);
                    });
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text('Network Error'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: SafeArea(
                child: ListView.builder(
              controller: _scrollController,
              itemCount: _opportunites.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildProfileHeader(_company!, _opportunites.length);
                } else if (index <= _opportunites.length) {
                  return Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      padding: EdgeInsets.only(top: 10.h),
                      child: opportunityCard(
                          opportunity: _opportunites[index - 1]));
                } else {
                  return _isLoadingMore
                      ? Container(
                          padding: EdgeInsets.symmetric(vertical: 100.h),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Center(
                              child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          )))
                      : const SizedBox.shrink();
                }
              },
            )),
          );
        });
  }

  Widget _buildProfileHeader(Company company, int opportunitiesCount) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                context.go('/protected/layout/0');
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                SharePlus.instance.share(ShareParams(
                  text: 'Check out the app: https://example.com',
                  subject: 'Check out this company',
                ));
              },
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          ],
        ),
        IntrinsicHeight(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 22.h),
                padding: EdgeInsets.only(top: 120.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(100.r),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      company.name,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 10.h),
                    Text(company.email ?? 'no email provided',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey,
                            )),
                    SizedBox(height: 22.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              company.location ?? 'no location\nprovided',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.grey[400],
                                  ),
                            ),
                            Text(
                              'location',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.grey[600],
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              company.date_joined ?? 'no date provided',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.grey[400],
                                  ),
                            ),
                            Text(
                              'Member since',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.grey[600],
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 65.r,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 60.r,
                    backgroundImage: company.profilepic == ''
                        ? AssetImage('assets/images/avatar.png')
                            as ImageProvider
                        : NetworkImage(company.profilepic) as ImageProvider,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ],
    );
  }
}
