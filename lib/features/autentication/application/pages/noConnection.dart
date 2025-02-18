import 'package:app/features/opportunities/application/widgets/app_name.dart';
import 'package:flutter/material.dart';

class Noconnection extends StatelessWidget {
  const Noconnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title:AppLogo() ,
        centerTitle: true,
      )    ) ;
  }
}
