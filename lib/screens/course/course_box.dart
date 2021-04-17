import 'package:emt/screens/course/selected_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CourseBox extends StatelessWidget {
  final String title;
  final int duration;
  final String desc;
  final int price;
  final String image;
  final Color titleColor;
  final double titleSize;
  final String buttonText;

  final int rating;

  final Color textColor;
  final double textSize;

  final Color descColor;
  final double descSize;
  CourseBox({this.buttonText = 'Enroll',this.rating,this.image = '',this.price = 0,this.descSize = 15,this.descColor = Colors.black87,this.desc = '',this.titleSize = 25,this.titleColor = Colors.black,this.textSize = 13,this.textColor = Colors.black,this.title,this.duration});

  @override
  Widget build(BuildContext context) {
    // return Container(padding: EdgeInsets.all(40),color: Colors.greenAccent,);
    final String errorImage = 'https://i.imgur.com/C7cZeFA.png';
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: NetworkImage(image ?? errorImage),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.6), BlendMode.screen),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: titleSize
                ),
              ),
              SmoothStarRating(
                isReadOnly: true,
                allowHalfRating: true,
                starCount: 5,
                rating: rating/2.0,
                size: 20,
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Text(
              desc,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: descColor,
                fontSize: descSize
              )
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                    child: Text(
                      'Duration : ${duration.toString()} months',
                      style: TextStyle(
                        color: textColor,
                        fontSize: textSize,
                          fontWeight: FontWeight.bold
                      )
                    ),
                  )
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      '\u20B9 ${price.toString()}',
                      style: TextStyle(
                        color: textColor,
                        fontSize: textSize,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
              ),
            ],
          ),
          SizedBox(height: 10,),
          TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SelectedCourseScreen(id: title);
              }));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.redAccent),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                  color: Colors.black
              ),
            ),
          ),
        ],
      ),
    );
  }
}
