import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graket/model/categories_model/categories_model.dart';
import 'package:graket/view_model/controller/home_cubit/home_cubit.dart';
import 'package:graket/view_model/controller/home_cubit/home_states.dart';

import '../../../utilites/app_colors.dart';
import '../../../utilites/reusable_func.dart';
import 'all_courses_in_category.dart';

class CategoriesScreen extends StatelessWidget {
  List<CategoriesModel> categoriesList;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        builder: (context, state) {
          var homeCubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("All Categories"),
              centerTitle: true,
            ),
            body: categoriesList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GridView.builder(
                      itemCount: categoriesList.length,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: InkWell(
                          onTap: () {
                            navigateTo(
                                context,
                                AllCoursesInCategory(
                                  categoryName:
                                      categoriesList[index].categoryName,
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
                                      child: Image.network(
                                          categoriesList[index].image),
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
                                      Text(categoriesList[index].categoryName,
                                          style: const TextStyle(
                                              color: neutral1Color,
                                              fontSize: 14)),
                                      Text(
                                          '${homeCubit.coursesList.where((element) {
                                                return element.category.contains(
                                                    homeCubit
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
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 2.0),
                    ),
                  ),
          );
        },
        listener: (context, state) {});
  }

  CategoriesScreen({required this.categoriesList});
}
