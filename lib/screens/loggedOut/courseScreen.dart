import 'package:emt/screens/course/loading_courses.dart';
import 'package:emt/screens/courseRows.dart';
import 'package:emt/screens/drawer/drawer_selector.dart';
import 'package:emt/service/loggedOutDatabase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final String text = 'Find Your Courses';
  final LODatabase cdb = LODatabase();

  @override
  Widget build(BuildContext context) {
    cdb.courseData();
    return Scaffold(
      drawer: SelectDrawer(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/abb2.jpg')
              )
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)
                    )
                  ),
                  child: SafeArea(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                      child: Center(
                        child: Text(
                          text,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                            wordSpacing: 10
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child:
                        Container()
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(
                          child: Text(
                            'Trending',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FutureBuilder(
                    future: cdb.courseData(),
                    builder: (context,snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        if(snapshot.hasData){
                          // print('Snapshot = ${snapshot.data[0].title}');
                          return Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: CourseRows(data: snapshot.data)
                          );
                        }
                        else{
                          return Container(
                            child: Center(
                              child: Text('Couldn\'t Reach')
                            ),
                          );
                        }
                      }
                      else{
                        return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: LoadingCourses()
                        );
                      }
                    }
                    ),
                SizedBox(height: 20,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
