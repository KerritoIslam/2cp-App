import 'package:app/features/autentication/application/pages/onboarding/pages_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 120.h),
                
                child: IntroductionScreen(
                  globalFooter:SizedBox(
              width: 343.w,
              height: 56.h,
              child: ElevatedButton(
                  onPressed: () {
                        GoRouter.of(context).go('/offline');
                  },
                  style: ButtonStyle(
                      elevation: const WidgetStatePropertyAll(0),
                      backgroundColor:
                          WidgetStatePropertyAll(Theme.of(context).primaryColor),
                      shape: const WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))))),
                  child: Text(
                    'Continue',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white
                          ,                    fontWeight: FontWeight.w700,      
                  ),
                  )),
            ),

                  showSkipButton: false,
                  skip: const Text('Skip'),
                  showNextButton: false,
                  onSkip: (){
                    print('Done');
                  },
                  showDoneButton: false,
                 
                  
                  pages: [
                   PagesData.firstPage,
                    PagesData.secondPage,
                    PagesData.thirdPage,
                    PagesData.fourthPage,
                  ],
                  dotsDecorator: DotsDecorator(
                      size: Size(8.sp, 8.sp),
                      activeSize: Size(15.sp, 15.sp),
                      activeColor:Theme.of(context).primaryColor,                      
                    color:Theme.of(context).secondaryHeaderColor.withOpacity(0.2),
                                 

              ),
            ),)),
                                ],
        ),
      ),
    );
  }
}
