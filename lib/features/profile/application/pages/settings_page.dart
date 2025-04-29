import 'package:app/features/authentication/application/bloc/auth_bloc.dart';
import 'package:app/features/authentication/application/bloc/auth_events.dart';
import 'package:app/shared/widgets/action_button.dart';
import 'package:app/utils/bloc/theme_provider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool isDarkEnabled;
  @override
  void initState() {
    isDarkEnabled = context.read<ThemeProviderBloc>().state is DarkTheme;
    super.initState();
  }

  List<Map<String, dynamic>> pageElements = [
    {
      'name': 'Rate App',
      'icon': 'assets/icons/star.svg',
      'iconDark': 'assets/icons/star_dark.svg'
    },
    {
      'name': 'Share App',
      'icon': 'assets/icons/share.svg',
      'iconDark': 'assets/icons/share_dark.svg',
      'onPress': () {
        print("Sharing app");
        SharePlus.instance.share(ShareParams(
          text: 'Check out the app: https://example.com',
          subject: 'Check out the app',
        ));
      }
    },
    {
      'name': 'Privacy Policy',
      'icon': 'assets/icons/lock.svg',
      'iconDark': 'assets/icons/lock_dark.svg'
    },
    {
      'name': 'Terms and Conditions',
      'icon': 'assets/icons/terms.svg',
      'iconDark': 'assets/icons/terms_dark.svg'
    },
    {
      'name': 'Cookies Policy',
      'icon': 'assets/icons/cookiesPolicy.svg',
      'iconDark': 'assets/icons/cookiesPolicy_dark.svg'
    },
    {
      'name': 'Contact',
      'icon': 'assets/icons/contact.svg',
      'iconDark': 'assets/icons/contact_dark.svg'
    },
    {
      'name': 'Feedback',
      'icon': 'assets/icons/chat.svg',
      'iconDark': 'assets/icons/chat_dark.svg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).secondaryHeaderColor),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 90.h,
        scrolledUnderElevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            onPressed: () => context.pop()),
      ),
      body: BlocBuilder<ThemeProviderBloc, ThemeProviderState>(
        builder: (context, state) {
          final isDarkMode = state is DarkTheme;
          return Column(
            children: [
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  AnimatedSwitcher(
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,
                    duration: Duration(milliseconds: 300), // Smooth transition
                    transitionBuilder: (child, animation) =>
                        FadeTransition(opacity: animation, child: child),
                    child: SvgPicture.asset(
                      isDarkMode
                          ? 'assets/icons/darkMode_dark.svg'
                          : 'assets/icons/darkMode.svg',
                      key: ValueKey(
                          isDarkMode), // Important for AnimatedSwitcher to detect changes
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text('Dark Mode',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).secondaryHeaderColor)),
                  Spacer(),
                  Switch(
                    activeColor: Theme.of(context).primaryColor,
                    trackOutlineColor: WidgetStatePropertyAll(Theme.of(context)
                        .secondaryHeaderColor
                        .withOpacity(0.4)),
                    value: isDarkMode,
                    inactiveTrackColor:
                        Theme.of(context).scaffoldBackgroundColor,
                    onChanged: (val) {
                      context.read<ThemeProviderBloc>().add(
                            SetThemeEvent(val ? DarkTheme() : LightTheme()),
                          );
                    },
                  )
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (ctx, idx) => GestureDetector(
                        onTap: pageElements[idx]['onPress'] != null
                            ? pageElements[idx]['onPress'] as void Function()
                            : () {
                                print("No onPress");
                              },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            SvgPicture.asset(
                              isDarkMode
                                  ? pageElements[idx]['iconDark'] ?? ""
                                  : pageElements[idx]['icon'] ?? "",
                              key: ValueKey(
                                  isDarkMode), // Important for AnimatedSwitcher to detect changes
                            ),
                            SizedBox(width: 20.w),
                            Text(pageElements[idx]['name'] ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor)),
                          ],
                        ),
                      ),
                  separatorBuilder: (ctx, idx) => SizedBox(
                        height: 50.h,
                      ),
                  itemCount: pageElements.length),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: ActionButton(
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
                              context
                                  .read<AuthBloc>()
                                  .add(AuthLogoutRequested());
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  text: "Logout",
                  suffix: Icon(
                    Icons.logout,
                    color: Colors.white,
                    weight: 700,
                    size: 30.r,
                  ),
                ),
              ),
              Spacer(),
            ],
          );
        },
      ),
    );
  }
}
