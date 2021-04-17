import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingCourses extends StatelessWidget {
  final Color color;
  final Color boxColor;
  LoadingCourses({this.boxColor = Colors.white10,this.color = Colors.white70});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 60),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Center(
            child: SpinKitThreeBounce(
              color: color,
              size: 20,
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 60),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Center(
            child: SpinKitThreeBounce(
              color: color,
              size: 20,
            ),
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}
