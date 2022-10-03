import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graket/model/course_model/course_model.dart';
import 'package:graket/view/screens/course_screens/details_course_page.dart';
import 'package:graket/view_model/controller/home_cubit/home_states.dart';

import '../../../utilites/app_colors.dart';
import '../../../view_model/controller/home_cubit/home_cubit.dart';

class AllCoursesInCategory extends StatelessWidget {
  String categoryName;

  AllCoursesInCategory({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (context, state) {
        var homeCubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(categoryName + " courses"),
            centerTitle: true,
          ),
          body: homeCubit.coursesList.length == 0 ||
                  !homeCubit.coursesList
                      .any((element) => element.category == categoryName)
              ? Center(
                  child: Text(
                    "there's no courses for this category",
                    style: TextStyle(color: blackColor),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: homeCubit.coursesList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return homeCubit.coursesList[index].category == categoryName
                        ? SizedBox(
                            // height: h * .33,
                            width: w * .7,
                            child: GestureDetector(
                              onTap: () {               Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsCoursePage(
                                      course: homeCubit.coursesList[index],
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
                                              homeCubit
                                                  .coursesList[index].imageUrl,
                                              fit: BoxFit.fitWidth,
                                              width: w,
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                return Container(
                                                  color: neutral4Color,
                                                  width: w,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            homeCubit.coursesList[index].title,
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
                                                  const SizedBox(width: 10),
                                                  const Icon(
                                                    Icons.timer_outlined,
                                                    size: 25,
                                                    color: neutral2Color,
                                                  ),
                                                  Text(
                                                    homeCubit.coursesList[index]
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
                ),
        );
      },
    );
  }
}
