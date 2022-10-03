// // **************************************************************************
// // AutoRouteGenerator
// // **************************************************************************
//
// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// // **************************************************************************
// // AutoRouteGenerator
// // **************************************************************************
// //
// // ignore_for_file: type=lint
//
// // ignore_for_file: no_leading_underscores_for_library_prefixes
// import 'package:auto_route/auto_route.dart' as _i13;
// import 'package:auto_route/empty_router_widgets.dart' as _i7;
// import 'package:flutter/material.dart' as _i14;
// import '../view/screens/app_main_page.dart' as _i6;
// import '../view/screens/bottom_nav_screens/favorites_page.dart' as _i9;
// import '../view/screens/bottom_nav_screens/home.dart' as _i8;
// import '../view/screens/bottom_nav_screens/my_courses_page.dart' as _i10;
// import '../view/screens/bottom_nav_screens/notif_screen.dart'as _i11;
// import '../view/screens/bottom_nav_screens/settings_page.dart' as _i12;
// import '../view/screens/intro_screens/starting_page.dart' as _i1;
// import '../view/screens/auth_screens/email_signup_page.dart' as _i4;
// import '../view/screens/intro_screens/onboard_page.dart' as _i2;
// import '../view/screens/auth_screens/signin_page.dart' as _i3;
// import '../view/screens/intro_screens/splash_page.dart' as _i5;
//
// class AppRouter extends _i13.RootStackRouter {
//   AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
//       : super(navigatorKey);
//
//   @override
//   final Map<String, _i13.PageFactory> pagesMap = {
//     AppStartingRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: _i1.AppStartingPage(),
//       );
//     },
//     OnboardRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i2.OnboardPage(),
//       );
//     },
//     SignInRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i3.SignInPage(),
//       );
//     },
//     EmailSignUpRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i4.EmailSignUpPage(),
//       );
//     },
//     SplashRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i5.SplashPage(),
//       );
//     },
//     AppMainRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: _i6.AppMainPage(),
//       );
//     },
//     HomeRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i7.EmptyRouterPage(),
//       );
//     },
//     FavoritesPageRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i7.EmptyRouterPage(),
//       );
//     },
//     MyCoursesPageRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i7.EmptyRouterPage(),
//       );
//     },
//     NotificationsPageRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i7.EmptyRouterPage(),
//       );
//     },
//     SettingsPageRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i7.EmptyRouterPage(),
//       );
//     },
//     Home.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i8.Home(),
//       );
//     },
//     FavoritesRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i9.FavoritesPage(),
//       );
//     },
//     MyCoursesRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i10.MyCoursesPage(),
//       );
//     },
//     NotificationsRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i11.NotificationsPage(),
//       );
//     },
//     SettingsRoute.name: (routeData) {
//       return _i13.MaterialPageX<dynamic>(
//         routeData: routeData,
//         child: const _i12.SettingsPage(),
//       );
//     },
//   };
//
//   @override
//   List<_i13.RouteConfig> get routes => [
//         _i13.RouteConfig(
//           AppStartingRoute.name,
//           path: '/',
//         ),
//         _i13.RouteConfig(
//           OnboardRoute.name,
//           path: '/onboard-page',
//         ),
//         _i13.RouteConfig(
//           SignInRoute.name,
//           path: '/sign-in-page',
//         ),
//         _i13.RouteConfig(
//           EmailSignUpRoute.name,
//           path: '/email-sign-up-page',
//         ),
//         _i13.RouteConfig(
//           SplashRoute.name,
//           path: '/splash-page',
//         ),
//         _i13.RouteConfig(
//           AppMainRoute.name,
//           path: '/',
//           children: [
//             _i13.RouteConfig(
//               HomeRoute.name,
//               path: 'home',
//               parent: AppMainRoute.name,
//               children: [
//                 _i13.RouteConfig(
//                   Home.name,
//                   path: '',
//                   parent: HomeRoute.name,
//                 )
//               ],
//             ),
//             _i13.RouteConfig(
//               FavoritesPageRoute.name,
//               path: 'favorites_page',
//               parent: AppMainRoute.name,
//               children: [
//                 _i13.RouteConfig(
//                   FavoritesRoute.name,
//                   path: '',
//                   parent: FavoritesPageRoute.name,
//                 )
//               ],
//             ),
//             _i13.RouteConfig(
//               MyCoursesPageRoute.name,
//               path: 'my_courses_page',
//               parent: AppMainRoute.name,
//               children: [
//                 _i13.RouteConfig(
//                   MyCoursesRoute.name,
//                   path: '',
//                   parent: MyCoursesPageRoute.name,
//                 )
//               ],
//             ),
//             _i13.RouteConfig(
//               NotificationsPageRoute.name,
//               path: 'notifications_page',
//               parent: AppMainRoute.name,
//               children: [
//                 _i13.RouteConfig(
//                   NotificationsRoute.name,
//                   path: '',
//                   parent: NotificationsPageRoute.name,
//                 )
//               ],
//             ),
//             _i13.RouteConfig(
//               SettingsPageRoute.name,
//               path: 'settings_page',
//               parent: AppMainRoute.name,
//               children: [
//                 _i13.RouteConfig(
//                   SettingsRoute.name,
//                   path: '',
//                   parent: SettingsPageRoute.name,
//                 )
//               ],
//             ),
//           ],
//         ),
//       ];
// }
//
// /// generated route for
// /// [_i1.AppStartingPage]
// class AppStartingRoute extends _i13.PageRouteInfo<void> {
//   const AppStartingRoute()
//       : super(
//           AppStartingRoute.name,
//           path: '/',
//         );
//
//   static const String name = 'AppStartingRoute';
// }
//
// /// generated route for
// /// [_i2.OnboardPage]
// class OnboardRoute extends _i13.PageRouteInfo<void> {
//   const OnboardRoute()
//       : super(
//           OnboardRoute.name,
//           path: '/onboard-page',
//         );
//
//   static const String name = 'OnboardRoute';
// }
//
// /// generated route for
// /// [_i3.SignInPage]
// class SignInRoute extends _i13.PageRouteInfo<void> {
//   const SignInRoute()
//       : super(
//           SignInRoute.name,
//           path: '/sign-in-page',
//         );
//
//   static const String name = 'SignInRoute';
// }
//
// /// generated route for
// /// [_i4.EmailSignUpPage]
// class EmailSignUpRoute extends _i13.PageRouteInfo<void> {
//   const EmailSignUpRoute()
//       : super(
//           EmailSignUpRoute.name,
//           path: '/email-sign-up-page',
//         );
//
//   static const String name = 'EmailSignUpRoute';
// }
//
// /// generated route for
// /// [_i5.SplashPage]
// class SplashRoute extends _i13.PageRouteInfo<void> {
//   const SplashRoute()
//       : super(
//           SplashRoute.name,
//           path: '/splash-page',
//         );
//
//   static const String name = 'SplashRoute';
// }
//
// /// generated route for
// /// [_i6.AppMainPage]
// class AppMainRoute extends _i13.PageRouteInfo<void> {
//   const AppMainRoute({List<_i13.PageRouteInfo>? children})
//       : super(
//           AppMainRoute.name,
//           path: '/',
//           initialChildren: children,
//         );
//
//   static const String name = 'AppMainRoute';
// }
//
// /// generated route for
// /// [_i7.EmptyRouterPage]
// class HomeRoute extends _i13.PageRouteInfo<void> {
//   const HomeRoute({List<_i13.PageRouteInfo>? children})
//       : super(
//           HomeRoute.name,
//           path: 'home',
//           initialChildren: children,
//         );
//
//   static const String name = 'HomeRoute';
// }
//
// /// generated route for
// /// [_i7.EmptyRouterPage]
// class FavoritesPageRoute extends _i13.PageRouteInfo<void> {
//   const FavoritesPageRoute({List<_i13.PageRouteInfo>? children})
//       : super(
//           FavoritesPageRoute.name,
//           path: 'favorites_page',
//           initialChildren: children,
//         );
//
//   static const String name = 'FavoritesPageRoute';
// }
//
// /// generated route for
// /// [_i7.EmptyRouterPage]
// class MyCoursesPageRoute extends _i13.PageRouteInfo<void> {
//   const MyCoursesPageRoute({List<_i13.PageRouteInfo>? children})
//       : super(
//           MyCoursesPageRoute.name,
//           path: 'my_courses_page',
//           initialChildren: children,
//         );
//
//   static const String name = 'MyCoursesPageRoute';
// }
//
// /// generated route for
// /// [_i7.EmptyRouterPage]
// class NotificationsPageRoute extends _i13.PageRouteInfo<void> {
//   const NotificationsPageRoute({List<_i13.PageRouteInfo>? children})
//       : super(
//           NotificationsPageRoute.name,
//           path: 'notifications_page',
//           initialChildren: children,
//         );
//
//   static const String name = 'NotificationsPageRoute';
// }
//
// /// generated route for
// /// [_i7.EmptyRouterPage]
// class SettingsPageRoute extends _i13.PageRouteInfo<void> {
//   const SettingsPageRoute({List<_i13.PageRouteInfo>? children})
//       : super(
//           SettingsPageRoute.name,
//           path: 'settings_page',
//           initialChildren: children,
//         );
//
//   static const String name = 'SettingsPageRoute';
// }
//
// /// generated route for
// /// [_i8.Home]
// class Home extends _i13.PageRouteInfo<void> {
//   const Home()
//       : super(
//           Home.name,
//           path: '',
//         );
//
//   static const String name = 'Home';
// }
//
// /// generated route for
// /// [_i9.FavoritesPage]
// class FavoritesRoute extends _i13.PageRouteInfo<void> {
//   const FavoritesRoute()
//       : super(
//           FavoritesRoute.name,
//           path: '',
//         );
//
//   static const String name = 'FavoritesRoute';
// }
//
// /// generated route for
// /// [_i10.MyCoursesPage]
// class MyCoursesRoute extends _i13.PageRouteInfo<void> {
//   const MyCoursesRoute()
//       : super(
//           MyCoursesRoute.name,
//           path: '',
//         );
//
//   static const String name = 'MyCoursesRoute';
// }
//
// /// generated route for
// /// [_i11.NotificationsPage]
// class NotificationsRoute extends _i13.PageRouteInfo<void> {
//   const NotificationsRoute()
//       : super(
//           NotificationsRoute.name,
//           path: '',
//         );
//
//   static const String name = 'NotificationsRoute';
// }
//
// /// generated route for
// /// [_i12.SettingsPage]
// class SettingsRoute extends _i13.PageRouteInfo<void> {
//   const SettingsRoute()
//       : super(
//           SettingsRoute.name,
//           path: '',
//         );
//
//   static const String name = 'SettingsRoute';
// }
