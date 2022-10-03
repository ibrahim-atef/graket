import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graket/view/screens/search_page.dart';
import 'package:graket/view_model/controller/course_cubit/course_states.dart';

import '../../../utilites/app_colors.dart';
import '../../../utilites/reusable_func.dart';
 import '../../../view_model/controller/course_cubit/course_cubit.dart';
import '../course_screens/details_course_page.dart';
import '../course_screens/preview_course_page.dart';

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral5Color,
        // centerTitle: true,
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.menu),
        //     color: neutral1Color),
        title: const Text(
          'My Courses',
          style: TextStyle(
              fontSize: 20, color: neutral1Color, fontWeight: FontWeight.w500),
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
      body: BlocConsumer<CourseCubit, CourseStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var courseCubit = CourseCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(10),
            child: state is GetMyEnrolledCoursesLoadingState
                ? Center(
                    child: SizedBox(
                      width: 50,
                      child: LinearProgressIndicator(
                        color: primaryColor,
                      ),
                    ),
                  )
                : courseCubit.myEnrolledCoursesList
                            .any((element) => element.isSubmitted) &&
                        courseCubit.myEnrolledCoursesList.length != 0
                    ? ListView.builder(
                        //  physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: courseCubit.myEnrolledCoursesList.length,
                        itemBuilder: (context, index) {
                          return courseCubit
                                  .myEnrolledCoursesList[index].isSubmitted
                              ? SizedBox(

                                  width: w * .7,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailsCoursePage(
                                              course: courseCubit
                                                  .myEnrolledCoursesList[index],
                                            ),
                                          ));
                                    },
                                    child: Card(
                                      color: neutral5Color,
                                      shadowColor: neutral3Color,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: SizedBox(
                                                height: 140,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    courseCubit
                                                        .myEnrolledCoursesList[
                                                            index]
                                                        .imageUrl,
                                                    fit: BoxFit.fitWidth,
                                                    width: w,
                                                    errorBuilder:
                                                        (BuildContext context,
                                                            Object exception,
                                                            StackTrace?
                                                                stackTrace) {
                                                      return Container(
                                                        color: neutral4Color,
                                                        width: 200,
                                                        child: Center(
                                                          child: Image.asset(
                                                            "assets/images/download.jpg",
                                                            fit:
                                                                BoxFit.fitWidth,
                                                            width: w,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  courseCubit
                                                      .myEnrolledCoursesList[
                                                          index]
                                                      .title,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      courseCubit
                                                          .myEnrolledCoursesList[
                                                              index]
                                                          .courseAuthor,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: neutral2Color,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        const Icon(
                                                          Icons.person_outline,
                                                          size: 25,
                                                          color: neutral2Color,
                                                        ),
                                                        Text(
                                                            courseCubit
                                                                .myEnrolledCoursesList[
                                                                    index]
                                                                .students
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  neutral2Color,
                                                            )),
                                                        const SizedBox(
                                                            width: 10),
                                                        const Icon(
                                                          Icons.timer_outlined,
                                                          size: 25,
                                                          color: neutral2Color,
                                                        ),
                                                        Text(
                                                          courseCubit
                                                              .myEnrolledCoursesList[
                                                                  index]
                                                              .totalTime,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                neutral2Color,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),

                                                // RichText(
                                                //   textAlign: TextAlign.end,
                                                //   text: TextSpan(
                                                //     children: [
                                                //       TextSpan(
                                                //         text: '${myCourse['mainprice']}\$',
                                                //         style: const TextStyle(
                                                //           fontSize: 14,
                                                //           color: neutral1Color,
                                                //           decoration:
                                                //               TextDecoration.lineThrough,
                                                //         ),
                                                //       ),
                                                //       TextSpan(
                                                //         text: ' ${myCourse['price']}\$',
                                                //         style: const TextStyle(
                                                //             color: neutral1Color,
                                                //             fontSize: 15,
                                                //             fontWeight: FontWeight.bold),
                                                //       ),
                                                //     ],
                                                //   ),
                                                // ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox();
                        },
                      )
                    : Center(
                        child: Text("You don't have enrolled courses"),
                      ),
          );
        },
      ),
    );
  }
}
