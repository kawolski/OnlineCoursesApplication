import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emt/models/user.dart';

class LODatabase{
  final CollectionReference courses = FirebaseFirestore.instance.collection('Courses');

  Future<List<CourseData>> courseData()async{
    List<CourseData> list = [];
    await courses.get().then((value){
      value.docs.forEach((element) {
        // print(element.data());
        list.add(CourseData(
          title: element.id,
          desc: element.data()['desc'],
          price: element.data()['price'],
          duration: element.data()['duration'],
          image: element.data()['image'],
          rating: element.data()['rating']
        ));
      });
      // return list;
    });
    return list;
  }

  Future<CourseData> selectedCourseData(String id)async{
    CourseData result;
    // DocumentSnapshot result = await courses.doc(id).get();
    // print(result.data());
    await courses.doc(id).get().then((value){
      // print('Selected Course Data...');
      // print(value.id);
      result = CourseData(
        title: value.id,
        rating: value.data()['rating'],
        price: value.data()['price'],
        image: value.data()['image'],
        duration: value.data()['duration'],
        desc: value.data()['desc'],
      );
      // print('Data Recorded');
      // print(value.data());
    });
    print(result.title);
    print('Sending...');
    return result;
  }

}