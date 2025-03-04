import 'package:app/utils/bloc/theme_provider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SettingsTilesPage extends StatelessWidget {
  const SettingsTilesPage({super.key});
  static const pages=[
  {
    "name":"Account",
"iconDark":"assets/icons/profile_dark.svg",
"icon":"assets/icons/profile.svg",   
"href": "/protected/Options/account"
  }
 
    ,{
  "name":"Saved Opportunities",
  "iconDark":"assets/icons/bookmarkDark.svg",
  "icon":"assets/icons/bookmark.svg",
   "href":"/protected/options/saved"
},
{
  "name":"Settings",
  "iconDark":"assets/icons/settingsDark.svg",
  "icon":"assets/icons/settings.svg",
   "href":"/protected/Options/settings"
},
  {
  "name":"Notifications",
    "iconDark":"assets/icons/notification_dark.svg",
  "icon":"assets/icons/notification.svg",
  "href":"/protected/options/notifications"
  }

    

];

  //TODO:Talk about the routing of this one
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
      leading: IconButton(onPressed:(){
          context.pop();
        } ,icon:Icon( Icons.arrow_back,color: Theme.of(context).secondaryHeaderColor, )),
        title: Text('Options',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).secondaryHeaderColor),),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: BlocBuilder<ThemeProviderBloc,ThemeProviderState>(
        builder: (context,state) {
          return Column(
          
            children: [
          Spacer(),
              ListView.separated(
                shrinkWrap: true,
                 itemCount:pages.length ,
                separatorBuilder: (ctx,idx)=>SizedBox(height: 20.h,),
                itemBuilder: (ctx,idx){
                  return ListTile(
                  onTap: (){
                    context.push(pages[idx]['href']??"/");
                  },
                  
                  leading: SvgPicture.asset(pages[idx][(state is DarkTheme)?'iconDark':'icon']??"assets/settings.svg"),
                    title: Text(pages[idx]['name']??""),
                  titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).secondaryHeaderColor),
                  trailing: Icon(Icons.arrow_forward_ios,color: Theme.of(context).secondaryHeaderColor,),
                  );
                }),

            Spacer(flex: 2,),
            SvgPicture.asset('assets/images/settingsLootie.svg'),
            Spacer(flex: 3,),
            ],
          );
        }
      ),
    );
  }
}
