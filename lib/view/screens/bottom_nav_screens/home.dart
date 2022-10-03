import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graket/model/course_model/course_model.dart';
import 'package:graket/utilites/reusable_func.dart';
import 'package:graket/view/screens/bottom_nav_screens/home_page.dart';

import '../../../utilites/app_colors.dart';
import '../../../utilites/app_constants.dart';
 import '../course_screens/course_content.dart';
import '../course_screens/preview_course_page.dart';
import '../search_page.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var database;

  Future dsds() async {
    String id =
        FirebaseFirestore.instance.collection(courseCollectionKey).doc().id;
    Course course = Course(
        courseId: id,
        title: "Complete Web & Mobile Designer in 2022: UI/UX, Figma, +more",
        description:
            "Become a Designer in 2022! Master Mobile and Web Design, User Interface + User Experience (UI/UX Design), HTML, and CSS",
        category: "UI/UX",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHn-oooeBrdY25HuvrDaSnQkKY2qEee_XziQ&usqp=CAU",
        totalTime: "22",
        totalContent: "34",
        students: 1,
        language: "en",
        enrollable: true,
        createdAt: DateTime.now().toString(),
        lastUpdated: "00/00/0000",
        courseAuthor: "emile sdzss",
        enrolled: false,
        isSubmitted: false,
        wishlist: false,
        skills: ["design", "ux", "figma"]);
    return FirebaseFirestore.instance
        .collection(courseCollectionKey)
        .doc(id)
        .set(course.toJson(course));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutral5Color,
      appBar: AppBar(
        backgroundColor: neutral5Color,
        // centerTitle: true,
        // leading: IconButton(
        //     onPressed: () async {
        //       setState(() {
        //         dsds();
        //       });
        //     },
        //     icon: const Icon(Icons.menu),
        //     color: neutral1Color),
        title: InkWell(
          onTap: () {
          },
          child: const Text(
            'Home',
            style: TextStyle(
                fontSize: 20,
                color: neutral1Color,
                fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(context, SearchScreen());
              },
              icon: const Icon(Icons.search),
              color: neutral1Color),
        ],
      ),
      body: HomePage(),
    );
  }
}
