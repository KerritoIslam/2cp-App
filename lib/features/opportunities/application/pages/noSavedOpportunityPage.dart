import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class noSavedOpportunityPage extends StatelessWidget {
  const noSavedOpportunityPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
      
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
     SvgPicture.asset('assets/images/fillInfo.svg') ,
     Text('You have no opportunities saved !',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),),
     TextButton(
            onPressed: (){
              context.go('/protected/layout/0');
            },
       child: Text('Explore opportunities now.',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                //TO control the distance between the text and the underline
                shadows: [
                  Shadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      offset: Offset(0, -2))
                ],
                color: Colors.transparent
                ,decoration: TextDecoration.underline,
                decorationColor: Theme.of(context).primaryColor,
                decorationThickness: 4
                ,decorationStyle: TextDecorationStyle.solid),),
     ),
      Spacer(flex: 3,)],
      ),
      
    );
  }
}

