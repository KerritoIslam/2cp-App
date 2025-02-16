import 'package:app/features/opportunities/application/widgets/search_suggetstions_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatelessWidget {
  
  const Search({super.key});

    @override
  Widget build(BuildContext context) {
    final suggestions=[
    'Internships',
    'Problems',
    'Events',
    'Mentorship',
    'Jobs',
          ];

    return Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Search Bar Here'),
          Spacer(),
          RichText(text: TextSpan(text: "Search ",style:Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ) ,children: [
            TextSpan(text: "suggestions",style: TextStyle(color: Theme.of(context).secondaryHeaderColor))
          ])),
         Wrap(
            spacing: 10.w,
           runSpacing:10.h ,
            children: suggestions.map((sug)=>SearchSuggetstionsCard(title: sug)).toList(),
          ) ,
          Spacer(flex: 2,),
          SvgPicture.asset(
            'assets/images/files.svg',
          )
          


        ],
      ),
    ) ;
  }
}
