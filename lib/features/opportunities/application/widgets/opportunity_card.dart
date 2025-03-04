import 'package:app/features/applications%20status/application/bloc/applications_bloc.dart';
import 'package:app/features/applications%20status/domain/entities/application.dart';
import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forui/widgets/badge.dart';
class opportunityCard extends StatefulWidget {
  
  
  final Opportunity opportunity;
   const opportunityCard({
    Key? key,
  required this.opportunity      
  }) : super(key: key);

  @override
  State<opportunityCard> createState() => _opportunityCardState();
}

class _opportunityCardState extends State<opportunityCard> {
   late bool isSaved;
  late bool isApplied;

  @override
    void initState() {
    isApplied=false;
     isSaved=false; 
      super.initState();
    }
    @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      child: Card(
        
         
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
                    imageUrl: widget.opportunity.company.profilepic,
                    width: 40.w,
                    height: 40.h,
                  ),
      
                                  const SizedBox(width: 12),
                  Text(
                    widget.opportunity.company.name,
                    style: Theme.of(context).textTheme.displayMedium!                ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(isSaved?Icons.bookmark_outlined:Icons.bookmark_outline_sharp,color: Theme.of(context).secondaryHeaderColor,),
                    onPressed: (){
                      
                      context.read<OpportunitiesSavedBloc>().add(
                        SaveOpportunityEvent(
                          widget.opportunity.id
                        )
      
                      );
                      setState(() {
                      isSaved=!isSaved;            
                                          });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                widget.opportunity.title,
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
                      children: widget.opportunity.skills.map((s)=>FBadge(label: Text(s),style: FBadgeStyle.outline,)).toList(),
                    ),
                  ),
                                                  Text('view more')
                    ],
      
                  ),
                
              
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
                    foregroundColor: Theme.of(context).secondaryHeaderColor,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                !isApplied?'Apply':'Applied',
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
      ),
    );
  }
}
