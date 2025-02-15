import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forui/widgets/badge.dart';
class opportunityCard extends StatelessWidget {
  
  final Opportunity opportunity;
  const opportunityCard({
    Key? key,
  required this.opportunity      
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
       
      elevation:1 ,
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
      
      margin: const EdgeInsets.all(16),
      shadowColor: Theme.of(context).shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: opportunity.company.profilepic,
                  width: 40.w,
                  height: 40.h,
                ),

                                const SizedBox(width: 12),
                Text(
                  opportunity.company.name,
                  style: Theme.of(context).textTheme.displayMedium!                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.bookmark_outline),
                  onPressed: (){},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              opportunity.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                                  
                SizedBox(
                  width:250.w,
                  child: Wrap(
                    runSpacing: 8.h,
                    spacing:8.w ,
                    children: opportunity.skills.map((s)=>FBadge(label: Text(s),style: FBadgeStyle.secondary,)).toList(),
                  ),
                ),
                                                Text('view more')
                  ],

                ),
              
            
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9DE1B6),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),   
        ],
        ),
      ),
    );
  }
}
