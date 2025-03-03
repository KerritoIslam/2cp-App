import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsTilesPage extends StatelessWidget {
  const SettingsTilesPage({super.key});
  static const pages=[
  {
  "name":"Profile",
  "path":"assets/icons/profile.svg",  
   "location":"/protected/settings/profile"
}
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(onPressed:(){
          context.pop();
        } ,icon:Icon( Icons.arrow_back,color: Theme.of(context).secondaryHeaderColor, )),
        title: Text('Options',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).secondaryHeaderColor),),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
