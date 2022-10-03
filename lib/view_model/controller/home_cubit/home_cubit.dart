import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graket/model/course_model/course_model.dart';
import 'package:graket/utilites/app_constants.dart';
import 'package:graket/view_model/controller/home_cubit/home_states.dart';

import '../../../model/categories_model/categories_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitializedStates());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  CollectionReference categoriesCollection =
      FirebaseFirestore.instance.collection(categoriesCollectionKey);
  CollectionReference coursesCollection =
      FirebaseFirestore.instance.collection(courseCollectionKey);
  var categoriesList = <CategoriesModel>[];
  var coursesList = <Course>[];

  getCategories() {
    emit(GetCategoriesLoadingState());
    categoriesCollection.snapshots().listen((event) {
      categoriesList.clear();
      if (event.docs.isNotEmpty) {
        for (int i = 0; i < event.docs.length; i++) {
          categoriesList.add(CategoriesModel.fromMap(event.docs[i]));
        }
        emit(GetCategoriesSuccessState());
      } else {
        emit(GetCategoriesErrorState());
      }
    });
  }

  getCourses() {
    emit(GetCoursesLoadingState());
    coursesCollection.snapshots().listen((event) {
      coursesList.clear();
      if (event.docs.isNotEmpty) {
        for (int i = 0; i < event.docs.length; i++) {
          coursesList.add(Course.fromJson(event.docs[i]));
        }
        emit(GetCoursesSuccessState());
      } else {
        emit(GetCoursesErrorState());
      }
    });
  }

  /// search functionality

  List<Course> searchList = [];

  bool isSearching = false;

  TextEditingController search = TextEditingController();

  void addSearchToList(
    String searchName,
  ) {
    if (search.text.isEmpty) {
      isSearching = false;
      searchList.clear();
    } else {
      isSearching = true;
    }
    searchName = searchName.toLowerCase();
    // searchList = productList.where((search) {
    //   var searchTitle = search.title.toLowerCase();
    //   var searchPrice = search.price.toString().toLowerCase();
    //
    //   return searchTitle.contains(searchName) ||
    //       searchPrice.toString().contains(searchName);
    // }).toList();

    searchList = coursesList.where((search) {
      return search.title.toLowerCase().contains(searchName);
    }).toList();
    emit(AddSearchToListState());
  }

  void clearSearch() {
    search.clear();
    addSearchToList("");
    searchList.clear();
    emit(ClearSearchState());
  }
}
