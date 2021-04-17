import 'package:emt/models/user.dart';
import 'package:emt/screens/course/display.dart';
import 'package:emt/service/loggedOutDatabase.dart';
import 'package:emt/shared/loading.dart';
import 'package:flutter/material.dart';

class SelectedCourseScreen extends StatefulWidget {
  final String id;
  SelectedCourseScreen({this.id});
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<SelectedCourseScreen> {
  final LODatabase course = LODatabase();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // initialData: Loading(),
      future: course.selectedCourseData(widget.id),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasData){
            CourseData data = snapshot.data;
            return Display(data: data);
          }else{
            //  No Data
            return Container(
              child: Center(
                  child: Text(
                    'No Data',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
            );
          }
        }else{
          //  Not yet Connected
          return Container(
            child: Center(
              child: Loading()
            ),
          );
        }
      },
    );
  }
}
