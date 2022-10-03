import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graket/view_model/controller/home_cubit/home_cubit.dart';
import 'package:graket/view_model/controller/home_cubit/home_states.dart';

import '../../model/course_model/course_model.dart';
import '../../utilites/app_colors.dart';
import 'course_screens/details_course_page.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {    double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
    return BlocConsumer<HomeCubit, HomeStates>(
        builder: (context, state) {
          var homeCubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 5,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    homeCubit.clearSearch();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                ),
              ],
              title: TextFormField(controller: homeCubit.search,
                onFieldSubmitted: (searchName) {
                  homeCubit.addSearchToList(searchName);
                },
                onChanged: (searchName) {
                  print(searchName);
                  homeCubit.addSearchToList(searchName);
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white60,
                  hintText: 'search',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
              ),
            ),
            body: Center(  child: homeCubit.searchList.length == 0
                ? Center(
              child: Text(" search "),
            )
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
              //  physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:  homeCubit.searchList.length,
              itemBuilder: (context, index) {
                  return    SizedBox(

                    width: w * .7,
                    child: GestureDetector(
                      onTap: () {               Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsCoursePage(
                              course:  homeCubit.searchList[index],
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
                                      homeCubit.searchList[index].imageUrl,
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
                                    homeCubit.searchList[index].title,
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
                                        homeCubit.searchList[index].courseAuthor,
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
                                              homeCubit.searchList[index]
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
                                            homeCubit.searchList[index].totalTime,
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
                  ) ;
              },
            ),
                ),),
          );
        },
        listener: (context, state) {});
  }
}
