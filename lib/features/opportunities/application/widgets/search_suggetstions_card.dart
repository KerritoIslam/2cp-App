import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchSuggetstionsCard extends StatelessWidget {
  final String title;
  const SearchSuggetstionsCard({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        
        width: 186.w,
        height: 59.h,
        padding: EdgeInsets.all(15),
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19.r),
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.2),
              offset: Offset(1, 1),
              
            )
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),

            Icon(Icons.search,color: Theme.of(context).secondaryHeaderColor.withOpacity(0.4),),
                                ],
        ),
      );
     }
}
