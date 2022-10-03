import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graket/model/notification_model/notification_model.dart';
import 'package:graket/model/users_model/users_model.dart';
import 'package:graket/view/screens/bottom_nav_screens/home_page.dart';

import '../../../utilites/app_constants.dart';
import '../../../view/screens/bottom_nav_screens/favorites_page.dart';
import '../../../view/screens/bottom_nav_screens/home.dart';
import '../../../view/screens/bottom_nav_screens/my_courses_page.dart';
import '../../../view/screens/bottom_nav_screens/notif_screen.dart';
import '../../../view/screens/bottom_nav_screens/settings_page.dart';
import '../../api_helper/local/shared_preferences.dart';
import 'main_states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitializedStates());

  static MainCubit get(context) => BlocProvider.of<MainCubit>(context);
  var notificationList = <NotificationModel>[];
  int currentIndex = 0;
  String cachedUid = CacheHelper.getData(key: uidKey);
  UserModel user = UserModel();
  List<Widget> screens = [
    Home(),
    MyCoursesPage(),
    FavoritesPage(),
    NotificationsPage(),
    SettingsPage()
  ];

  void changeBottomNav(int index) {
    // if (index == 2) {
    //   emit(DonateFoodState());
    // } else {
    currentIndex = index;
    emit(ChangeBottomNavState());
    // }
  }

  ///get notification
  ///
  ///
  getNotification() {
    emit(GetNotificationLoadingState());
    FirebaseFirestore.instance
        .collection(notificationCollectionKey)
        .snapshots()
        .listen((event) {
      notificationList.clear();
      if (event.docs.isNotEmpty) {
        for (int i = 0; i < event.docs.length; i++) {
          notificationList.add(NotificationModel.fromMap(event.docs[i]));
        }
        emit(GetNotificationSuccessState());
      } else {
        emit(GetNotificationErrorState());
      }
    });
  }

  ///get user Date
  ///
  getUserData() {
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance
        .collection(usersCollectionKey)
        .doc(cachedUid)
        .snapshots()
        .listen((event) {
      if (event.exists) {
        user = UserModel.fromJson(event);
        CacheHelper.saveData(key: uNameKey, value: user.name);
        emit(GetUserDataSuccessState());
      } else {
        emit(GetUserDataErrorState());
      }
    });
  }
}
