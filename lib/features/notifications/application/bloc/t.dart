import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';

class Router {
  // doesn;t matter how to get a and b 
  final GoRouterState a;
  final BuildContext b;
  final String? Function(GoRouterState, BuildContext)? redirect;
  Router({
    required this.a,
    required this.b,
    this.redirect,
  });
  pushNamed(String path) {
    bool pathValid = true;
    String truePath = path;
    if (!pathValid) {
      throw Error();
    }
    if (redirect != null) {
      String? retuned_Path = redirect!(a, b);
      if (retuned_Path != null) {
        truePath = retuned_Path;
      }
    }
    //Mimick routing
    print(truePath);
  }
}

//Adder adder = Adder(redirect: (a, b) => null, a: , b: 2);
