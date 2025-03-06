import 'package:app/features/Search/application/bloc/search_bloc.dart';
import 'package:app/features/Search/application/widgets/search_bar.dart';
import 'package:app/features/autentication/application/bloc/auth_bloc.dart';
import 'package:app/features/autentication/application/bloc/auth_events.dart';
import 'package:app/shared/widgets/loadingIndicator.dart';
import 'package:app/utils/service_locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<SearchBloc>(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:10.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(child: const CoolSearchBar()),
            
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                switch (state) {
                  case SearchInitial():
                    return SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(height: 120.h),
                          SvgPicture.asset('assets/images/files.svg'),
                        ],
                      ),
                    );

                  case SearchSuccess():
                    return SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          ...[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Opportunities:",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor),
                              ),
                            ),
                            ...state.data.opportunities
                                .map((opportunity) => ListTile(
                                      title: Text(opportunity.title),
                                      titleTextStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor),
                                      subtitleTextStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor
                                                  .withOpacity(0.45)),
                                      subtitle: Text(opportunity.description),
                                    )),
                          ],
                          ...[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Companies:",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor),
                              ),
                            ),
                            ...state.data.companies.map((company) => ListTile(
                                  title: Text(company.name),
                                  titleTextStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor),
                                  subtitle: Text(company.category),
                                  subtitleTextStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor
                                              .withOpacity(0.45)),
                                  leading: CircleAvatar(
                                    backgroundImage:CachedNetworkImageProvider(company.profilepic)
                                       
                                  ),
                                )),
                          ],
                        ],
                      ),
                    );
                  case SearchLoading():
                    return SliverToBoxAdapter(child:  Loadingindicator());
                  case SearchEmpty():
                    return SliverToBoxAdapter(
                                          child: Column(
                        children: [
                          SizedBox(height: 120.h),
                          SvgPicture.asset('assets/images/files.svg'),
                        ],
                      ),
                    );

                  default:
                    return const SliverToBoxAdapter(
                      child: Center(child: Text("Unknown Error")),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showAdaptiveDialog(
          context: context,
          builder: (ctx) => FDialog(
            direction: Axis.horizontal,
            title: const Text('Are you absolutely sure?'),
            body: const Text(
              'This will log you out of the app and you will have to log in again.',
            ),
            actions: [
              FButton(
                style: FButtonStyle.outline,
                label: const Text('Cancel'),
                onPress: () => Navigator.of(ctx).pop(),
              ),
              FButton(
                label: const Text('Logout'),
                onPress: () {
                  context.pop();
                  context.read<AuthBloc>().add(AuthLogoutRequested());
                },
              ),
            ],
          ),
        );
      },
      child: const Text('Logout'),
    );
  }
}
