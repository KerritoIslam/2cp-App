import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/application/widgets/opportunity_card.dart';
import 'package:app/features/opportunities/application/widgets/opportunity_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
 enum OppType{
  Internships,
  Problems,
none,
 }
class OpporutnitiesPage extends StatefulWidget {
  const OpporutnitiesPage({super.key});
  @override
  State<OpporutnitiesPage> createState() => _OpporutnitiesPageState();
}
class _OpporutnitiesPageState extends State<OpporutnitiesPage> {
  late bool isProfileCompleted;
  late OppType  selectedType; 
  @override
    void initState() {
        //TODO check if user profile is completed
     isProfileCompleted=true;
    context.read<OpportunitiesBloc>().add(LoadOpportunitiesEvent());
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
        mainAxisSize: MainAxisSize.max,
      
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
     SvgPicture.asset('assets/images/fillInfo.svg') ,
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
    return Opportunites();
  }
  return FillProfilePage(); 
}

class Opportunites extends StatefulWidget {
   const Opportunites({
    super.key,
  });

  @override
  State<Opportunites> createState() => _OpportunitesState();
}

class _OpportunitesState extends State<Opportunites> {
  
  late OppType selectedType;
 @override
   void initState() {
    selectedType=OppType.none;

     // TODO: implement initState
     super.initState();
   } 
  @override
  Widget build(BuildContext context) {
     final List<Map<String,dynamic>> Types=[
  {
    "name":"Internships",
    "imagePath":"assets/icons/internship.svg",
     "onTap":()=>setState(() {
        print(selectedType.name);
          selectedType=(selectedType!=OppType.Internships)?OppType.Internships:OppType.none;
          }) 
  },
  {
    "name":"Problems",
    "imagePath":"assets/icons/problem.svg",
     "onTap":()=> setState(() {
            selectedType=(selectedType!=OppType.Problems)?OppType.Problems:
        OppType.none;
        }) },

    
  ];

    return  Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:  Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                
            RichText(text: TextSpan(text: 'Opportunites ',style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w800,color: Theme.of(context).primaryColor
            ),children: [TextSpan(text: "type",style: TextStyle(color: Theme.of(context).secondaryHeaderColor))]),)
              ,
            SizedBox(
                          height: 169.h,
              width: MediaQuery.sizeOf(context).width*2,
              child:Align(
 alignment: Alignment.center,
                    child: ListView.separated(itemBuilder:(ctx,idx)=>OpportunityType(name: Types[idx]['name'] as String, imagePath: Types[idx]['imagePath'] as String, onTap: Types[idx]['onTap'], isSelected: Types[idx]['name']==selectedType.name,) , separatorBuilder: (ctx,idx)=>SizedBox(width: 17.w,), itemCount:Types.length,scrollDirection: Axis.horizontal,

                    )), 

                  
            ),
            RichText(text: TextSpan(text: 'Opportunites ',style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w800,color: Theme.of(context).primaryColor
            ),children: [TextSpan(text: "For you",style: TextStyle(color: Theme.of(context).secondaryHeaderColor))]),),
                 
        
          ],
          

                      ),

        ),
             BlocBuilder<OpportunitiesBloc, OpportunitiesBlocState>(
      builder: (context, state) {
        if (state is OpportunitiesBlocInitial) {
          return const SliverToBoxAdapter(child: Text('initState'));
        } else if (state is OpportuntitiesLoadInProgress) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is OpportuntitiesLoadSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, idx) => opportunityCard(
                opportunity: state.opportunities[idx],
              ),
              childCount: state.opportunities.length,
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: Text('Unknown error'));
        }
      },
    ),


        ]),
       
    );  
  }
}
