import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:graket/utilites/block_observer.dart';
import 'package:graket/view/screens/app_main_page.dart';
import 'package:graket/view/screens/auth_screens/signin_page.dart';
import 'package:graket/view/screens/intro_screens/splash_page.dart';
import 'package:graket/view_model/api_helper/local/shared_preferences.dart';
import 'package:graket/view_model/controller/auth_cubit/auth_cubit.dart';
import 'package:graket/view_model/controller/course_cubit/course_cubit.dart';
import 'package:graket/view_model/controller/home_cubit/home_cubit.dart';
import 'package:graket/view_model/controller/main_cubit/main_cubit.dart';
import 'package:graket/view_model/controller/video/video_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();

  await Firebase.initializeApp();
  Widget? widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  if (onBoarding != null) {
    if (AuthCubit.getLoggedInUser() == null) {
      widget = SignInPage();
    } else {
      widget = AppMainPage();
    }
  } else {
    widget = SplashPage();
  }
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);

  ///to make status app bar transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(MyApp(widget!));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  // final _appRouter = AppRouter();
  final Widget startWidget;

  MyApp(this.startWidget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    //to make app only portraitUp
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()..getUsers()),
        BlocProvider(create: (context) => VideoCubit()),
        BlocProvider(
            create: (context) => MainCubit()
              ..getNotification()
              ..getUserData()),
        BlocProvider(
            create: (context) => CourseCubit()
              ..getMyEnrolledCourses()
              ..getMyFavCourses()),
        BlocProvider(
            create: (context) => HomeCubit()
              ..getCategories()
              ..getCourses()),
      ],
      child: MaterialApp(
        title: 'GrakeT Academy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'ElMessiri',
        ),

//        routerDelegate: AutoRouterDelegate(_appRouter),
        home: startWidget,
        // or you can use
        // routerDelegate:_appDelegate.delegate(),
        //      routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
/*
pass>>>   GrakeT-Academy1111
gmail>>>  academygraket1@gmail.com
MD5: CF:DC:41:EA:A5:3E:80:DD:C4:62:96:18:30:D2:17:3D
SHA1: 59:FA:16:DA:36:EA:E8:AE:7A:E6:FF:80:39:11:E2:F9:1E:89:3C:25
SHA-256: BC:19:A0:6B:C4:CE:61:8B:25:B8:E4:7F:F4:D6:34:8D:09:41:85:F7:66:A9:0F:8A:C3:38:86:78:D1:B2:C8:BF

app Login Acc>>>
pass>>>   GraKeTAcademy111111@
gmail>>>  academygraket1@gmail.com

key store pass>> graket
key store name>> upload



 */
