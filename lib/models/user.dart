class CustomUser{
  final String uid;
  CustomUser({this.uid});
}

class CourseData{
  final String title;
  final String desc;
  final int price;
//  Duration will be in Months
  final int duration;
  final String image;
  final int rating;
  CourseData({this.rating,this.image,this.title,this.desc,this.price,this.duration});
}