import 'package:flutter/material.dart';

//TODO: Implement loading indicator
class Loadingindicator extends StatefulWidget {
  const Loadingindicator({super.key});

  @override
  State<Loadingindicator> createState() => _LoadingindicatorState();
}

class _LoadingindicatorState extends State<Loadingindicator> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
