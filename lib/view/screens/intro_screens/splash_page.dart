import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graket/utilites/reusable_func.dart';
import 'package:graket/view/screens/app_main_page.dart';
import 'package:graket/view/screens/auth_screens/signin_page.dart';

import 'dart:async';

import '../../../Routes/routing.gr.dart';
import '../../../utilites/app_colors.dart';
import '../../../utilites/app_constants.dart';
import '../../../view_model/api_helper/local/shared_preferences.dart';
import 'onboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

    String cachedUid = CacheHelper.getData(key: uidKey)??"";

    Future.delayed(const Duration(seconds: 3), () {
      navigateAndKill(
          context,
          cachedUid == ""
              ? onBoarding == null
                  ? OnboardPage()
                  : SignInPage()
              : AppMainPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          "GrakeT Academy",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
