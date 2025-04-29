import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

//TODO: Implement loading indicator
class Loadingindicator extends StatefulWidget {
  const Loadingindicator({super.key});

  @override
  State<Loadingindicator> createState() => _LoadingindicatorState();
}

class _LoadingindicatorState extends State<Loadingindicator> {
  @override
  Widget build(BuildContext context) {
    /*return  CircularProgressIndicator(
      color: Theme.of(context).primaryColor,
      strokeWidth: 2.0, // Adjust the stroke width as needed
    ); */
    return Container(
      width: 60,
      height: 60,
      child: LoadingIndicator(
        indicatorType: Indicator.ballRotateChase,
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColor.withOpacity(0.5),
          Colors.white
        ],
        strokeWidth: 0.5,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
