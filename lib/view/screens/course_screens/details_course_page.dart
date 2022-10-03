import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graket/utilites/reusable_func.dart';
import 'package:graket/view/screens/course_screens/preview_course_page.dart';
import 'package:graket/view/widgets/details_course_widgets/check_out.dart';
import 'package:graket/view_model/controller/course_cubit/course_cubit.dart';
import 'package:graket/view_model/controller/course_cubit/course_states.dart';
import '../../../model/course_model/course_model.dart';
import '../../../utilites/app_colors.dart';
 import '../../widgets/utils_widgets/alert_dialog.dart';
import 'course_content.dart';
import 'course_description.dart';

class DetailsCoursePage extends StatelessWidget {
  Course course;

  DetailsCoursePage({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = MediaQuery.of(context).size.width;

    return BlocConsumer<CourseCubit, CourseStates>(listener: (context, state) {
      if (state is EnrollCourseSuccessStates) {
        ShowAlertDialog.showDoneDialog(context, "congratulations",
            "course enrolled successfully\nwait for admin Acceptance", null);
      } else if (state is EnrollCourseErrorStates) {
        ShowAlertDialog()
            .showErrorDialog(context, "Error", "Error happen while enrolling");
      }
    }, builder: (context, state) {
      var courseCubit = CourseCubit.get(context);

      return Scaffold(
        backgroundColor: neutral5Color,
        appBar: AppBar(
          backgroundColor: neutral5Color,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: neutral1Color),
          title: const Text(
            "Details",
            style: TextStyle(
                fontSize: 20,
                color: neutral1Color,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 75),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  child: Container(
                    width: size.width,
                    color: neutral3Color,
                    child: Image.network(
                      course.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 80,
                            decoration: const BoxDecoration(
                              color: neutral1Color,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Center(
                                child: Text('Original',
                                    style: TextStyle(
                                        fontSize: 15, color: neutral5Color))),
                          ),
                          Row(
                            children: [
                              IconButton(
                                padding: const EdgeInsets.all(0),
                                color: courseCubit.myFavCoursesList.any(
                                        (element) =>
                                            element.courseId == course.courseId)
                                    ? errorColor
                                    : noneColor,
                                highlightColor: noneColor,
                                hoverColor: noneColor,
                                focusColor: noneColor,
                                splashColor: noneColor,
                                disabledColor: noneColor,
                                onPressed: () {
                                  courseCubit.myFavCoursesList.any((element) =>
                                          element.courseId == course.courseId)
                                      ? courseCubit
                                          .removeFromFav(course.courseId)
                                      : courseCubit.addToFavCourse(course);
                                },
                                icon: Icon(
                                    courseCubit.myFavCoursesList.any(
                                            (element) =>
                                                element.courseId ==
                                                course.courseId)
                                        ? Icons.favorite_outlined
                                        : Icons.favorite_border,
                                    color: courseCubit.myFavCoursesList.any(
                                            (element) =>
                                                element.courseId ==
                                                course.courseId)
                                        ? errorColor
                                        : neutral1Color),
                              ),
                              // IconButton(
                              //   padding: const EdgeInsets.all(0),
                              //   color: noneColor,
                              //   highlightColor: noneColor,
                              //   hoverColor: noneColor,
                              //   focusColor: noneColor,
                              //   splashColor: noneColor,
                              //   disabledColor: noneColor,
                              //   onPressed: () {},
                              //   icon: const Icon(Icons.bookmark_outline,
                              //       color: neutral1Color),
                              // ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(course.title,
                          style: const TextStyle(
                              fontSize: 25,
                              color: neutral1Color,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 15),
                      Text(course.courseAuthor,
                          style: const TextStyle(
                              fontSize: 15, color: neutral3Color)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingBarIndicator(
                            rating: 1.0,
                            itemBuilder: (context, index) =>
                                const Icon(Icons.star, color: ascentColor),
                            itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),
                          Text('1/5',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: neutral1Color,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text('About This Class',
                          style: TextStyle(
                              fontSize: 15,
                              color: primaryColor,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      Text(course.description,
                          style: const TextStyle(
                              fontSize: 15, color: neutral3Color)),
                      const SizedBox(height: 30),
                      const Text('Schedule',
                          style: TextStyle(
                              fontSize: 15,
                              color: primaryColor,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const ImageIcon(
                              AssetImage('assets/icons/schedule.png'),
                              color: neutral3Color),
                          const SizedBox(width: 5),
                          Text('schedule',
                              style: const TextStyle(
                                  fontSize: 15, color: neutral3Color)),
                        ],
                      ),
                      const SizedBox(height: 30),
                      course.skills.length == 0
                          ? SizedBox()
                          : Text(
                              'Skills',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                      const SizedBox(height: 10),
                      course.skills.length == 0
                          ? SizedBox()
                          : SizedBox(
                              height: 30,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: course.skills.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: const BoxDecoration(
                                      color: neutral1Color,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        course.skills[index].toString(),
                                        style: const TextStyle(
                                            fontSize: 15, color: neutral5Color),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                      const SizedBox(height: 30),
                      const Text('Instructors',
                          style: TextStyle(
                              fontSize: 15,
                              color: primaryColor,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 0,
                            margin: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              onTap: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              leading: const CircleAvatar(
                                backgroundColor: neutral2Color,
                              ),
                              title: Text(course.courseAuthor,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: neutral1Color,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text('creator',
                                  style: const TextStyle(
                                      fontSize: 15, color: neutral2Color)),
                              trailing: const ImageIcon(
                                  AssetImage('assets/icons/right.png'),
                                  color: neutral2Color),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      // const Text('In this course',
                      //     style: TextStyle(
                      //         fontSize: 15,
                      //         color: primaryColor,
                      //         fontWeight: FontWeight.w600)),
                      // const SizedBox(height: 10),
                      // TimelineTheme(
                      //   data: TimelineThemeData(
                      //     lineColor: neutral3Color,
                      //     gutterSpacing: 10,
                      //     itemGap: 10,
                      //     lineGap: 0,
                      //     strokeWidth: 2.5,
                      //   ),
                      //   child: Timeline(
                      //     padding: const EdgeInsets.all(0),
                      //     anchor: IndicatorPosition.center,
                      //     altOffset: const Offset(20, -20),
                      //     indicatorSize: 25,
                      //     events: [],
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     shrinkWrap: true,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: primaryColor),
                  onPressed: () async {
                    if (courseCubit.myEnrolledCoursesList.any((element) {
                      return element.courseId == course.courseId &&
                          element.isSubmitted;
                    })) {
                      (course.courseId != null || course.courseId.isNotEmpty)
                          ? navigateTo(
                              context,
                              CourseContent(
                                courseId: course.courseId,
                              ))
                          : null;
                    } else if (courseCubit.myEnrolledCoursesList.any((element) {
                      return element.courseId == course.courseId &&
                          element.enrolled;
                    })) {
                      ShowAlertDialog.showDoneDialog(
                          context,
                          "enrolled",
                          "course already enrolled \nwait for admin Acceptance",
                          null);
                    } else {
                      await courseCubit.enrollCourse(course);
                    }
                  },
                  child: courseCubit.myEnrolledCoursesList.any((element) {
                    return element.courseId == course.courseId &&
                        element.isSubmitted;
                  })
                      ? Container(
                          alignment: Alignment.center,
                          width: size.width - 40,
                          height: 50,
                          child: Center(
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: profile4Color1,
                            ),
                          ))
                      : Container(
                          alignment: Alignment.center,
                          width: size.width - 40,
                          height: 50,
                          child: state is EnrollCourseLoadingStates
                              ? Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: LinearProgressIndicator(
                                    color: neutral3Color,
                                  ),
                                )
                              : courseCubit.myEnrolledCoursesList
                                      .any((element) {
                                  return element.courseId == course.courseId &&
                                      element.enrolled;
                                })
                                  ? const Center(
                                      child: Text("enrolled ✔"),
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Enroll',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "0\$",
                                                style: const TextStyle(
                                                  color: neutral4Color,
                                                  fontSize: 14,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "  free",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                        ),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }
}
