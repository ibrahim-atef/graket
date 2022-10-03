import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graket/view_model/controller/main_cubit/main_cubit.dart';
import 'package:graket/view_model/controller/main_cubit/main_states.dart';
import 'package:intl/intl.dart';

import '../../../utilites/app_colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          // IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.search,
          //       color: Colors.black,
          //     ))
        ],
        title: Text(
          "Notification",
          style: TextStyle(color: Colors.black),
        ),
        // leading: IconButton(
        //     onPressed: () {}, icon: Icon(Icons.menu, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Lastest",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
              BlocConsumer<MainCubit, MainStates>(
                listener: (BuildContext context, Object? state) {},
                builder: (BuildContext context, state) {
                  var mainCubit = MainCubit.get(context);
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: state is GetNotificationLoadingState
                        ? Center(
                            child: SizedBox(
                              width: 50,
                              child: LinearProgressIndicator(
                                color: primaryColor,
                              ),
                            ),
                          )
                        : mainCubit.notificationList.length != 0
                            ? ListView.builder(
                                //  physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: mainCubit.notificationList.length,
                                itemBuilder: (context, index) {
                                  return notifCard(
                                      mainCubit.notificationList[index].image,
                                      mainCubit.notificationList[index].title,
                                      mainCubit.notificationList[index].body,
                                      mainCubit.notificationList[index].date);
                                },
                              )
                            : Center(
                                child: Text("You don't have favourite courses"),
                              ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget notifCard(imageUrl, title, body, date) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        elevation: 3.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 20,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Container(
                      color: neutral4Color,
                      child: Center(
                        child: Image.asset(
                          "assets/images/download.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14)),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text("$body",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            //overflow: TextOverflow.ellipsis,
                            fontSize: 12)),
                  ),
                  Row(
                    children: [
                      // Icon(
                      //   Icons.date_range,
                      //   color: Colors.grey,
                      //   size: 15,
                      // ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("${DateFormat.jm().format(date.toDate())}",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 12)),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.more_vert)
            ],
          ),
        ),
      );
}
