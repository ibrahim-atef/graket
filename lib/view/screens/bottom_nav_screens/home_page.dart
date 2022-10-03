import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graket/utilites/reusable_func.dart';
import 'package:graket/view/screens/course_screens/all_courses_page.dart';
import 'package:graket/view_model/controller/home_cubit/home_cubit.dart';
import 'package:graket/view_model/controller/home_cubit/home_states.dart';

import '../../../utilites/app_colors.dart';
 import '../categories_screens/all_courses_in_category.dart';
import '../course_screens/details_course_page.dart';
import '../categories_screens/all_categories_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) {
        var homeCubit = HomeCubit.get(context);

        return RefreshIndicator(
          onRefresh: () async {
            HomeCubit.get(context).getCategories();
            HomeCubit.get(context).getCourses();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('For You',
                        style: TextStyle(
                            fontSize: 20,
                            color: neutral1Color,
                            fontWeight: FontWeight.bold)),
                    InkWell(
                      splashColor: noneColor,
                      focusColor: noneColor,
                      hoverColor: noneColor,
                      highlightColor: noneColor,
                      onTap: () {
                        homeCubit.categoriesList.length != 0
                            ? navigateTo(
                                context,
                                CategoriesScreen(
                                  categoriesList: homeCubit.categoriesList,
                                ))
                            : print("categories ====nullllllllll");
                      },
                      child: const Text("View All > ",
                          style: TextStyle(fontSize: 15, color: ascentColor)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  //height: h * .22,
                  child: homeCubit.categoriesList.length != 0
                      ? GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: homeCubit.categoriesList.length > 4
                              ? 4
                              : homeCubit.categoriesList.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 2.0),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: InkWell(
                                onTap: () {
                                  navigateTo(
                                      context,
                                      AllCoursesInCategory(
                                        categoryName: homeCubit
                                            .categoriesList[index].categoryName,
                                      ));
                                },
                                child: Card(
                                  elevation: 5,
                                  color: neutral5Color,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Card(
                                          color: neutral5Color,
                                          child: SizedBox(
                                            height: 45,
                                            width: 45,
                                            child: Image.network(homeCubit
                                                .categoriesList[index].image),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                homeCubit.categoriesList[index]
                                                    .categoryName,
                                                style: const TextStyle(
                                                    color: neutral1Color,
                                                    fontSize: 14)),
                                            Text(
                                                '${homeCubit.coursesList.where((element) {
                                                  return element.category

                                                      .contains(homeCubit
                                                          .categoriesList[index]
                                                          .categoryName);
                                                }).toList().length}',
                                                style: TextStyle(
                                                    color: neutral2Color,
                                                    fontSize: 11))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : Center(
                          child: Text("There's no categories"),
                        ),
                  // child: Column(
                  //   children: [
                  //     Expanded(
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //             child:,
                  //           ),
                  //           Expanded(
                  //             child: Card(
                  //               color: neutral5Color,
                  //               child: Row(
                  //                 children: [
                  //                   const Padding(
                  //                     padding: EdgeInsets.all(5),
                  //                     child: Card(
                  //                       color: neutral2Color,
                  //                       child: SizedBox(
                  //                         height: 45,
                  //                         width: 45,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         vertical: 10, horizontal: 0),
                  //                     child: Column(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.spaceEvenly,
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         Text("simpleInterests[1]",
                  //                             style: const TextStyle(
                  //                                 color: neutral1Color,
                  //                                 fontSize: 14)),
                  //                         const Text('2000+ Class',
                  //                             style: TextStyle(
                  //                                 color: neutral2Color,
                  //                                 fontSize: 11))
                  //                       ],
                  //                     ),
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //             child: Card(
                  //               color: neutral5Color,
                  //               child: Row(
                  //                 children: [
                  //                   const Padding(
                  //                     padding: EdgeInsets.all(5),
                  //                     child: Card(
                  //                       color: neutral2Color,
                  //                       child: SizedBox(
                  //                         height: 45,
                  //                         width: 45,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         vertical: 10, horizontal: 0),
                  //                     child: Column(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.spaceEvenly,
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         Text("simpleInterests[2]",
                  //                             style: const TextStyle(
                  //                                 color: neutral1Color,
                  //                                 fontSize: 14)),
                  //                         const Text('2000+ Class',
                  //                             style: TextStyle(
                  //                                 color: neutral2Color,
                  //                                 fontSize: 11))
                  //                       ],
                  //                     ),
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //           Expanded(
                  //             child: Card(
                  //               color: neutral5Color,
                  //               child: Row(
                  //                 children: [
                  //                   const Padding(
                  //                     padding: EdgeInsets.all(5),
                  //                     child: Card(
                  //                       color: neutral2Color,
                  //                       child: SizedBox(
                  //                         height: 45,
                  //                         width: 45,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         vertical: 10, horizontal: 0),
                  //                     child: Column(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.spaceEvenly,
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         Text("simpleInterests[3]",
                  //                             style: const TextStyle(
                  //                                 color: neutral1Color,
                  //                                 fontSize: 14)),
                  //                         const Text('2000+ Class',
                  //                             style: TextStyle(
                  //                                 color: neutral2Color,
                  //                                 fontSize: 11))
                  //                       ],
                  //                     ),
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Popular',
                        style: TextStyle(
                            fontSize: 20,
                            color: neutral1Color,
                            fontWeight: FontWeight.bold)),
                    InkWell(
                      splashColor: noneColor,
                      focusColor: noneColor,
                      hoverColor: noneColor,
                      highlightColor: noneColor,
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                        navigateTo(
                            context,
                            AllCoursesScreen(
                                coursesList: homeCubit.coursesList));
                      },
                      child: const Text("View All > ",
                          style: TextStyle(fontSize: 15, color: ascentColor)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: h * .35,
                  child: homeCubit.coursesList.length == 0
                      ? Center(
                          child: Text("there's no courses"),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeCubit.coursesList.length > 5
                              ? 5
                              : homeCubit.coursesList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: h * .3,
                              width: w * .7,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsCoursePage(
                                          course: homeCubit.coursesList[index],
                                        ),
                                      ));
                                },
                                child: Card(
                                  color: neutral5Color,
                                  shadowColor: neutral3Color,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
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

                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                homeCubit.coursesList[index]
                                                    .imageUrl,
                                                fit: BoxFit.cover,
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return Container(
                                                    color: neutral1Color,
                                                    width: 200,
                                                    child: const Center(
                                                      child: SizedBox(),
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
                                              homeCubit
                                                  .coursesList[index].title,
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
                                                  homeCubit.coursesList[index]
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
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    const Icon(
                                                      Icons.person_outline,
                                                      size: 25,
                                                      color: neutral2Color,
                                                    ),
                                                    Text(
                                                        homeCubit
                                                            .coursesList[index]
                                                            .students
                                                            .toString(),
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          color: neutral2Color,
                                                        )),
                                                    const SizedBox(width: 20),
                                                    const Icon(
                                                      Icons.timer_outlined,
                                                      size: 25,
                                                      color: neutral2Color,
                                                    ),
                                                    Text(
                                                      homeCubit
                                                          .coursesList[index]
                                                          .totalTime,
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
                ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
