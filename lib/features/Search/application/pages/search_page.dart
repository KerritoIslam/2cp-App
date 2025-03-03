import 'package:app/features/Search/application/widgets/search_bar.dart';
import 'package:app/features/autentication/application/bloc/auth_bloc.dart';
import 'package:app/features/autentication/application/bloc/auth_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class Search extends StatelessWidget {
  
  const Search({super.key});

    @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(flex: 1,),
          CoolSearchBar(),
                   LogoutButton(),
                             Spacer(flex: 5,),
          SvgPicture.asset(
            'assets/images/files.svg',
          ),
            Spacer(flex: 2,),
          


        ],
      ),
    ) ;
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
                
                showAdaptiveDialog (context: context, builder:(ctx)=>FDialog(
      direction: Axis.horizontal,
      title: const Text('Are you absolutely sure?'),
      body: const Text('This will log you out of the app and you will have to log in again.'),
      actions: [
        FButton(style: FButtonStyle.outline, label: const Text('Cancel'), onPress: () => Navigator.of(context).pop()),
        FButton(label: const Text('Logout'), onPress: () {
    context.pop();
                      context.read<AuthBloc>().add(AuthLogoutRequested());
    
                    }),  ],
    )
     );
           }, child: Text('Logout'));
  }
}
