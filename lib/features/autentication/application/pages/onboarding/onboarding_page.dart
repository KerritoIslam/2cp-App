import 'package:app/features/autentication/application/pages/onboarding/pages_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late GlobalKey<IntroductionScreenState> _key;
  late int currIndex;
  late String buttonText;
  
  
  @override
    void dispose() {
      _key.currentState?.dispose();
      super.dispose();
      
    }
  @override
    void initState() {
      super.initState();
    _key=GlobalKey<IntroductionScreenState>();
    buttonText='Next';
    currIndex=0;
    }
  @override

  Widget build(BuildContext context) {

    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(15.r),
              child: GestureDetector(
                onTap: () {
                    _key.currentState?.animateScroll(3);
                              },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Skip",
                      style:TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp
                      ),),
                    SizedBox(width: 3.w,),
                    Icon(Icons.arrow_forward,color: Theme.of(context).primaryColor,)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 120.h),
                
                child: IntroductionScreen(
                  onChange: (index){
                   currIndex=index;
                    if (index==3) {
                      buttonText='Continue';
                    }
                    else{
                      buttonText='Next';
                    }
                    setState(() {
                                          
                                        });
                  },

                                   key: _key,
                  globalFooter:SizedBox(
              width: 343.w,
              height: 56.h,
              child: ElevatedButton(
                  onPressed: () {
                        
                        if (currIndex==3) {
GoRouter.of(context).go('/auth/welcome');

                        }
                        else{
                          _key.currentState?.next();
                        }
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
             buttonText,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white
                          ,                    fontWeight: FontWeight.w700,      
                  ),
                  )),
            ),

                  showSkipButton: false,
                  skip: Align(
                   alignment: Alignment.topRight,
                    child: const Text('Skip')),

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
