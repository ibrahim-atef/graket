
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import '../../utilites/app_colors.dart';
import '../../view_model/controller/main_cubit/main_cubit.dart';
import '../../view_model/controller/main_cubit/main_states.dart';

class AppMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    return BlocConsumer<MainCubit, MainStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = MainCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: primaryColor,
            selectedLabelStyle: TextStyle(color: primaryColor),
            unselectedIconTheme:IconThemeData(color: neutral2Color) ,


            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: const Icon(Icons.home_filled),
              ),
              BottomNavigationBarItem(
                label: 'My Courses',
                icon: const Icon(Icons.play_circle),
              ),
              BottomNavigationBarItem(
                label: 'Favorites',
                icon: const Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: 'Notifications',
                icon: const Icon(Icons.notifications),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
        );
      },
    );
  }
}
