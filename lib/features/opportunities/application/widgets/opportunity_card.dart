import 'package:app/features/opportunities/application/bloc/opportunities_bloc_bloc.dart';
import 'package:app/features/opportunities/application/widgets/attachmentField.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';
import 'package:app/shared/widgets/action_button.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forui/forui.dart';
import 'package:forui/widgets/badge.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
class opportunityCard extends StatefulWidget {
  
  
  final Opportunity opportunity;
  final bool saved;
   const opportunityCard({
    Key? key,
  required this.opportunity,  this.saved    =false  
  }) : super(key: key);

  @override
  State<opportunityCard> createState() => _opportunityCardState();
}

class _opportunityCardState extends State<opportunityCard> {
   late bool isSaved;
  late bool isApplied;

  @override
  //TODO:optimize this somehow
    void initState() {
    isApplied=false;
    if (widget.saved){
     isSaved=true;
    }
    else{

     isSaved=false; 
    }
      super.initState();
    }
    @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      child: Card(
        
         
        elevation:1 ,
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.85),
        
        
        margin: EdgeInsets.all(16.r),
        shadowColor: Theme.of(context).shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
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
                      if (!isSaved){
 context.read<OpportunitiesSavedBloc>().add(
                        SaveOpportunityEvent(
                          widget.opportunity.id
                        )
      
                      );

                      }
                      else{
                      context.read<OpportunitiesSavedBloc>().add(
                      RemoveSavedOpportunityEvent(widget.opportunity.id)
                      );
                      }
                      
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
                    showModalBottomSheet(
 
                      context: context, builder: (ctx)=>SizedBox(
 height: MediaQuery.sizeOf(context).height*0.85,
                          child: FullScreenDialog(
                          jobTitle: widget.opportunity.title,
                        )));
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
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    )
                    
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

class FullScreenDialog extends StatefulWidget {
  final String jobTitle;
  const FullScreenDialog({

    super.key, required this.jobTitle,
  });

  @override
  State<FullScreenDialog> createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> {
  late TextEditingController _proposalController;
  @override
    void initState() {
      super.initState();
      _proposalController=TextEditingController();
    }
  @override
    void dispose() {
    _proposalController.dispose();
    super.dispose();
    }
  @override

  Widget build(BuildContext context) {
    // Get the height of the keyboard

    return Dialog.fullscreen(
      
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'You want to apply for ${widget.jobTitle}?',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Write a few sentences to highlight your skills and what makes you stand out.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              SizedBox(height: 24.h),
              TextField(
                controller: _proposalController,
                maxLines: 5,
                cursorColor: Theme.of(context).secondaryHeaderColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  focusColor: Theme.of(context).secondaryHeaderColor,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              AttachmentField(
              ), 
                          SizedBox(height: 24.h), 
              ActionButton(
                onPressed: () {
                  context.pop();
                  toastification.show(
                    type: ToastificationType.success,
                title:Text(  "Application Sumbited succefully" ,style: TextStyle(color: Colors.white,),),
                    backgroundColor: Theme.of(context).primaryColor,
                    autoCloseDuration: const Duration(milliseconds: 2300),
                  );
                  

                },
                text: "Apply Now",
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
