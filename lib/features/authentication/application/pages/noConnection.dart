import 'package:app/features/opportunities/application/widgets/app_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Noconnection extends StatelessWidget {
  final String path;
  const Noconnection({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        title: AppLogo(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.go(path);
            },
            icon: Icon(Icons.arrow_back,
                color: Theme.of(context).secondaryHeaderColor)),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            RichText(
                text: TextSpan(
                    text: 'You Are ',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontWeight: FontWeight.w800),
                    children: [
                  TextSpan(children: [
                    TextSpan(
                        text: 'Offline ',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    TextSpan(text: '!'),
                  ])
                ])),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "It looks like you're offline! Check your \n connection and try again.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
              textScaleFactor: 1.1,
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 1,
            ),
            SvgPicture.asset(
              'assets/images/offline.svg',
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
