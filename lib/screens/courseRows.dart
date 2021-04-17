import 'package:emt/models/user.dart';
import 'package:emt/screens/course/course_box.dart';
import 'package:flutter/material.dart';

class CourseRows extends StatefulWidget {
  final List<CourseData> data;
  CourseRows({this.data});
  @override
  _CourseRowsState createState() => _CourseRowsState();
}

class _CourseRowsState extends State<CourseRows> {
  @override
  Widget build(BuildContext context) {
    int length = widget.data.length;
    List<Widget> list = [];
    for(int i=0; i < length;i++){
      list.add(SizedBox(height: 20));
      list.add(CourseBox(
        title: widget.data[i].title,
        duration: widget.data[i].duration,
        desc: widget.data[i].desc,
        price: widget.data[i].price,
        image: widget.data[i].image,
        rating: widget.data[i].rating,
        buttonText: 'View'
      ));
    }
    return Column(
      children: list
    );
  }
}
