import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class OpporutnitiesPage extends StatefulWidget {
  const OpporutnitiesPage({super.key});
  @override
  State<OpporutnitiesPage> createState() => _OpporutnitiesPageState();
}
class _OpporutnitiesPageState extends State<OpporutnitiesPage> {
  late bool isProfileCompleted;
  @override
    void initState() {
    //TODO check if user profile is completed
     isProfileCompleted=false;
    super.initState();
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return  displayCorrectPage(isProfileCompleted); }
  
}

class FillProfilePage extends StatelessWidget {
  const FillProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
     SvgPicture.asset('assets/images/fillInfo.svg') ,
          Spacer(),
     Text('Enhance your matches by sharing your preferences',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),),
     TextButton(
            onPressed: (){},
       child: Text('Complete your profile now!',
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
Widget displayCorrectPage(bool isProfileCompleted){
  if(isProfileCompleted){
    return Center(child: Text("Hello You"));
  }
  return FillProfilePage(); 
}
