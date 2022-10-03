import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graket/model/course_model/course_model.dart';
import 'package:graket/utilites/app_constants.dart';
import 'package:graket/view/screens/bottom_nav_screens/home_page.dart';
import 'package:graket/view/screens/bottom_nav_screens/settings_page.dart';
import 'package:graket/view_model/api_helper/local/shared_preferences.dart';

import '../../../view/screens/bottom_nav_screens/favorites_page.dart';
import '../../../view/screens/bottom_nav_screens/home.dart';
import '../../../view/screens/bottom_nav_screens/my_courses_page.dart';
import '../../../view/screens/bottom_nav_screens/notif_screen.dart';
import 'course_states.dart';

class CourseCubit extends Cubit<CourseStates> {
  CourseCubit() : super(CourseInitializedStates());

  static CourseCubit get(context) => BlocProvider.of<CourseCubit>(context);
  String myId = CacheHelper.getData(key: uidKey);
  String myName = CacheHelper.getData(key: uNameKey) ;

  var myEnrolledCoursesList = <Course>[];
  var myFavCoursesList = <Course>[];

  /// handling enrolling course
  enrollCourse(Course course) {
    emit(EnrollCourseLoadingStates());
    course.enrolled = true;
    FirebaseFirestore.instance
        .collection(usersCollectionKey)
        .doc(myId)
        .collection(myEnrolledCoursesCollectionKey)
        .doc(course.courseId)
        .set(course.toJson(course))
        .then((value) {
      FirebaseFirestore.instance
          .collection(enrollStudentsCollectionKey)
          .doc(myId)
          .collection("enrolledCourse")
          .doc(course.courseId)
          .set({"courseId": course.courseId,"studentName":myName});
      emit(EnrollCourseSuccessStates());
    }).catchError((onError) {
      print(onError.toString());
      emit(EnrollCourseErrorStates());
    });
  }

  ///get my enrolled courses

  getMyEnrolledCourses() {
    emit(GetMyEnrolledCoursesLoadingState());
    FirebaseFirestore.instance
        .collection(usersCollectionKey)
        .doc(myId)
        .collection(myEnrolledCoursesCollectionKey)
        .snapshots()
        .listen((event) {
      myEnrolledCoursesList.clear();
      if (event.docs.isNotEmpty) {
        for (int i = 0; i < event.docs.length; i++) {
          myEnrolledCoursesList.add(Course.fromJson(event.docs[i]));
        }
        emit(GetMyEnrolledCoursesSuccessState());
      } else {
        emit(GetMyEnrolledCoursesErrorState());
      }
    });
  }

  /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>add to fav courses
  addToFavCourse(Course course) {
    emit(AddToFavLoadingStates());
    course.enrolled = true;
    FirebaseFirestore.instance
        .collection(usersCollectionKey)
        .doc(myId)
        .collection(favCoursesCollectionKey)
        .doc(course.courseId)
        .set(course.toJson(course))
        .then((value) {
      emit(AddToFavSuccessStates());
    }).catchError((onError) {
      print(onError.toString());
      emit(AddToFavErrorStates());
    });
  }

  ///get my fav courses

  getMyFavCourses() {
    emit(GetMyFavCoursesLoadingState());
    FirebaseFirestore.instance
        .collection(usersCollectionKey)
        .doc(myId)
        .collection(favCoursesCollectionKey)
        .snapshots()
        .listen((event) {
      myFavCoursesList.clear();
      if (event.docs.isNotEmpty) {
        for (int i = 0; i < event.docs.length; i++) {
          myFavCoursesList.add(Course.fromJson(event.docs[i]));
        }
        emit(GetMyFavCoursesSuccessState());
      } else {
        emit(GetMyFavCoursesErrorState());
      }
    });
  }

  ///remove from fav

  removeFromFav(id) {
    emit(RemoveFromFavLoadingState());
    FirebaseFirestore.instance
        .collection(usersCollectionKey)
        .doc(myId)
        .collection(favCoursesCollectionKey)
        .doc(id)
        .delete()
        .then((value) {
      emit(RemoveFromFavSuccessState());
    }).catchError((onError) {
      emit(RemoveFromFavErrorState());
      print("RemoveFromFavErrorState");
    });
  }
}
