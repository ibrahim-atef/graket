// import 'package:flutter/cupertino.dart';
// import 'package:graket/view/screens/intro_screens/onboard_page.dart';
// import 'package:graket/view/screens/intro_screens/splash_page.dart';
// import 'package:graket/view/screens/intro_screens/welcome_page.dart';
//
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../view_model/api_helper/remote/firebase/firebase.dart';
// import '../../../view_model/api_helper/remote/repo/auth_repo/authentication.dart';
//
//
//
//
// class AppStartingPage extends StatelessWidget {
//   String isFirstOpen = "";
//   String isLoggedIn = "";
//   initShared() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     isFirstOpen = sharedPreferences.getString('isFirstOpen') ?? 'false';
//     isLoggedIn = sharedPreferences.getString('isLoggedIn') ?? 'false';
//   }
//
//   Database database = Database();
//   @override
//   Widget build(BuildContext context) {
//     initShared();
//     if (EmailAuthentication().user?.uid != null) {
//       isLoggedIn = 'true';
//       isFirstOpen = 'true';
//       // print(EmailAuthentication().user.uid);
//     } else {
//       isLoggedIn = 'false';
//     }
//     return isFirstOpen != 'true' ? const OnboardPage() : SplashPage();
//   }
// }
