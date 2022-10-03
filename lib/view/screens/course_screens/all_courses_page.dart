import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graket/model/course_model/course_model.dart';
import 'package:graket/view/screens/course_screens/details_course_page.dart';

import '../../../utilites/app_colors.dart';

class AllCoursesScreen extends StatelessWidget {
  List<Course> coursesList;

  AllCoursesScreen({required this.coursesList});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("All Popular Courses"),
        centerTitle: true,
      ),
      body: coursesList.length == 0
          ? Center(
              child: Text("there's no courses"),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: coursesList.length ,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: h * .33,
                  width: w * .7,
                  child: GestureDetector(
                    onTap: () {               Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsCoursePage(
                            course: coursesList[index],
                          ),
                        ));},
                    child: Card(
                      color: neutral5Color,
                      shadowColor: neutral3Color,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: SizedBox(
                                height: 140,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    coursesList[index].imageUrl,
                                    fit: BoxFit.fitWidth,width: w,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Container(
                                        color: neutral4Color,
                                        width: 200,
                                        child: Center(
                                          child: Image.asset(
                                            "assets/images/download.jpg",
                                            fit: BoxFit.fitWidth,
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coursesList[index].title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      coursesList[index].courseAuthor,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: neutral2Color,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          Icons.person_outline,
                                          size: 25,
                                          color: neutral2Color,
                                        ),
                                        Text(
                                            coursesList[index]
                                                .students
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: neutral2Color,
                                            )),
                                        const SizedBox(width: 10),
                                        const Icon(
                                          Icons.timer_outlined,
                                          size: 25,
                                          color: neutral2Color,
                                        ),
                                        Text(
                                          coursesList[index].totalTime,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: neutral2Color,
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
                );
              },
            ),
    );
  }
}
