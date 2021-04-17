import 'package:emt/models/user.dart';
import 'package:emt/shared/choicd_button.dart';
import 'package:emt/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Display extends StatefulWidget {
  final CourseData data;
  Display({this.data});
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  final String errorImage = 'https://i.imgur.com/C7cZeFA.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                // color: Colors.white.withOpacity(0.7),
                image: DecorationImage(
                    image: NetworkImage(widget.data.image ?? errorImage),
                    colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7),BlendMode.screen),
                    fit: BoxFit.cover
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      // color: Colors.purpleAccent.withOpacity(0.5),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            alignment: Alignment.bottomLeft,
                            icon: Icon(Icons.arrow_back_ios_rounded),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                          // Expanded(child: Container(),),
                          Container(
                            alignment: Alignment.centerRight,
                            // color: Colors.red,
                            child: SmoothStarRating(
                              starCount: 5,
                              isReadOnly: true,
                              allowHalfRating: true,
                              size: 20,
                              rating: widget.data.rating/2.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.lightGreenAccent.withOpacity(0.5),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            widget.data.title,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Duration : ${widget.data.duration.toString()} months',
                          style: paragraph
                        ),
                        Text(
                            'Price : \u20B9 ${widget.data.price.toString()}',
                            style: subHead
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black38,),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 5,right: 5,top: 20,bottom: 5),
                color: Colors.white,
                child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: subHead,
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: Text(
                          widget.data.desc,
                          style: paragraph,
                        ),
                      ),
                      SizedBox(height:10),
                      ChoiceButton(
                        noUserChoice: 'Sign In/Up',
                        userChoice: 'Enroll',
                        noUserFunction: (){
                          //  Take user to Sign In/Up Screen
                        },
                        userFunction: (){
                          //  Start Enrollment Process
                        },
                      )
                    ],
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
