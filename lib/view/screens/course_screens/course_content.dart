import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graket/view_model/controller/video/video_cubit.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../widgets/utils_widgets/video_widget.dart';

class CourseContent extends StatefulWidget {
  String courseId;

  CourseContent({Key? key, required this.courseId}) : super(key: key);

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  String selectedTab = 'Description';
  String selectedContent = 'Null';

  VideoPlayerController? controller;
  Duration? duration;
  String vLink = "";

  initVideo(Link) {
    controller = VideoPlayerController.network(Link,
        videoPlayerOptions: VideoPlayerOptions())
      ..initialize().then((value) {
        duration = controller!.value.duration;
        debugPrint("========>>>>>>>>>> duration" +
            controller!.value.duration.toString());
      });
    controller!.addListener(() {
      setState(() {});

      duration = controller!.value.duration;
    });
  }

  void initState() {
    initVideo(vLink);
    super.initState();
  }

  @override
  void dispose() {
    // // Ensure disposing of the VideoPlayerController to free up resources.

    controller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) =>
          VideoCubit()..getCourseSections(courseId: widget.courseId),
      child: BlocConsumer<VideoCubit, VideoState>(
        listener: (context, state) {
          if (state is GetCourseSectionSuccessState) {
            setState(() {
              vLink = state.firstVideoLink;
              initVideo(vLink);
            });
          }
        },
        builder: (context, state) {
          var videoCubit = VideoCubit.get(context);
          return state is GetCourseSectionLoadingState
              ? Center(
                  child: Scaffold(
                      body: Center(
                          child: Lottie.asset(
                              "assets/images/98432-loading.json"))),
                )
              : state is GetCourseSectionErrorState
                  ? Scaffold(appBar: AppBar(backgroundColor: Colors.grey,),
                    body: Center(
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Lottie.asset(
                                "assets/images/106964-shake-a-empty-box.json"),
                            Text("Content not added to this course yet")
                          ],
                        ),
                      ),
                  )
                  : SafeArea(
                      top: videoCubit.isFullScreen ? false : true,
                      child: Scaffold(
                        // extendBodyBehindAppBar: true,
                        //  appBar: AppBar(
                        //    leading: IconButton(
                        //        onPressed: () {
                        //          Navigator.pop(context);
                        //        },
                        //        icon: const Icon(
                        //          Icons.keyboard_arrow_left,
                        //          color: Colors.white,
                        //          size: 40,
                        //        )),
                        //    actions: [
                        //      Padding(
                        //        padding: const EdgeInsets.only(
                        //          right: 10.0,
                        //        ),
                        //        child: IconButton(
                        //            onPressed: () {
                        //              // Navigator.pop(context);
                        //            },
                        //            icon: const Icon(
                        //              Icons.more_vert,
                        //              color: Colors.white,
                        //              size: 35,
                        //            )),
                        //      ),
                        //    ],
                        //  ),
                        body: Column(
                          children: [
                            controller!.value.isInitialized
                                ? BlocBuilder<VideoCubit, VideoState>(
                                    builder: (context, state) {
                                      var cubit = VideoCubit.get(context);
                                      return RotatedBox(
                                        quarterTurns:
                                            cubit.isFullScreen ? 3 : 4,
                                        child: InkWell(
                                          // onHover: (hover) {
                                          //   value = hover;
                                          // },
                                          onTap: () {
                                            cubit.changeValueState();
                                          },
                                          child: SizedBox(
                                            width: cubit.isFullScreen ? h : w,
                                            child: AspectRatio(
                                              aspectRatio:
                                                  controller!.value.aspectRatio,
                                              child: GestureDetector(
                                                child: Stack(children: [
                                                  VideoPlayer(controller!),
                                                  InkWell(
                                                      // onTap: () {
                                                      //   cubit.changeStateVideo(controller: controller!);
                                                      // },
                                                      ),
                                                  (cubit.value)

                                                      //video controls
                                                      ? Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Container(
                                                            // margin: EdgeInsets.symmetric(
                                                            //   vertical: h * .005,
                                                            // ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(1.0),
                                                            width: .9 * w,
                                                            height: .06 * h,
                                                            decoration: BoxDecoration(
                                                                color: const Color
                                                                        .fromRGBO(
                                                                    45,
                                                                    45,
                                                                    45,
                                                                    0.65),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                //control play video
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  //     margin: EdgeInsets.only(top: 4),
                                                                  child: InkWell(
                                                                      onTap: () {
                                                                        cubit.changeStateVideo(
                                                                            controller:
                                                                                controller!);
                                                                      },
                                                                      child: !controller!.value.isPlaying
                                                                          ? Icon(
                                                                              Icons.play_arrow_rounded,
                                                                              color: Colors.white,
                                                                              size: 28,
                                                                            )
                                                                          : Icon(
                                                                              Icons.pause_circle,
                                                                              color: Colors.white,
                                                                              size: 28,
                                                                            )),
                                                                ),

                                                                //start duration + video slider + end duration

                                                                SizedBox(
                                                                    child: Row(
                                                                  children: [
                                                                    //start duration
                                                                    Text(
                                                                      duration ==
                                                                              null
                                                                          ? "00:00"
                                                                          : prettyDuration(controller!
                                                                              .value
                                                                              .position),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          color:
                                                                              Colors.white),
                                                                    ),

                                                                    //video slider
                                                                    SizedBox(
                                                                      width:
                                                                          .4 *
                                                                              w,
                                                                      child:
                                                                          SliderTheme(
                                                                        data: SliderTheme.of(context).copyWith(
                                                                            trackHeight:
                                                                                3,
                                                                            thumbShape:
                                                                                RoundSliderThumbShape(enabledThumbRadius: 5)),
                                                                        child: Slider(
                                                                            value: controller!.value.position.inMilliseconds.toDouble(),
                                                                            activeColor: Colors.white,
                                                                            inactiveColor: Colors.white.withOpacity(0.20),
                                                                            onChanged: (value) {
                                                                              cubit.durationOfVideo(controller: controller!, value: value);
                                                                              // setState(() {
                                                                              //   controller!.seekTo(
                                                                              //       Duration(
                                                                              //           milliseconds:
                                                                              //           value.toInt()));
                                                                              // });
                                                                            },
                                                                            max: controller!.value.duration.inMilliseconds.toDouble(),
                                                                            min: 0),
                                                                      ),
                                                                    ),

                                                                    //end duration
                                                                    Text(
                                                                      duration ==
                                                                              null
                                                                          ? "00:00"
                                                                          : prettyDuration(
                                                                              duration!),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ],
                                                                )),

                                                                //volume + volume slider

                                                                // Stack(
                                                                //   children: [
                                                                //     //volume
                                                                //     Icon(
                                                                //       Icons.volume_down_alt,
                                                                //       color: Colors.white,
                                                                //       size: 20,
                                                                //     ),
                                                                //
                                                                //     //volume slider
                                                                //
                                                                //     Container(
                                                                //         width: 50,
                                                                //         height: 4,
                                                                //         margin: EdgeInsets.only(top: 6 ),
                                                                //         child: SliderTheme(
                                                                //           data: SliderTheme.of(context)
                                                                //               .copyWith(
                                                                //             trackHeight: 2 ,
                                                                //             trackShape:
                                                                //                 RoundedRectSliderTrackShape(),
                                                                //             thumbShape: SliderComponentShape
                                                                //                 .noThumb,
                                                                //           ),
                                                                //           child: Slider(
                                                                //               value: cubit.currentVolume,
                                                                //               activeColor:
                                                                //                   Colors.white,
                                                                //               inactiveColor: Colors
                                                                //                   .white
                                                                //                   .withOpacity(0.20),
                                                                //               onChanged: (newvol) {
                                                                //                 //set new volume
                                                                //                 cubit.setVolume(
                                                                //                     controller:
                                                                //                         controller!,
                                                                //                     newValue: newvol);
                                                                //               },
                                                                //               max: 1,
                                                                //               min: 0),
                                                                //         )),
                                                                //   ],
                                                                // ),

                                                                //captioning + settings + full screen
                                                                InkWell(
                                                                  onTap: () {
                                                                    cubit
                                                                        .changeFullScreen();
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .fullscreen,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 20,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      : const SizedBox(),
                                                  (cubit.value)

                                                      //back 10sec + play video + forward 10sec
                                                      ? Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                //back 10sec
                                                                InkWell(
                                                                  onTap: () {
                                                                    cubit.backward(
                                                                        controller:
                                                                            controller!);
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .rotate_left,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 25,
                                                                ),

                                                                //play video
                                                                InkWell(
                                                                    onTap: () {
                                                                      cubit.changeStateVideo(
                                                                          controller:
                                                                              controller!);
                                                                    },
                                                                    child: !controller!
                                                                            .value
                                                                            .isPlaying
                                                                        ? Icon(
                                                                            Icons.play_arrow_rounded,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                39,
                                                                          )
                                                                        : Icon(
                                                                            Icons.pause_rounded,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                39,
                                                                          )),

                                                                //forward 10sec
                                                                SizedBox(
                                                                  width: 20,
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    cubit.forward(
                                                                        controller:
                                                                            controller!);
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .rotate_right,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      : const SizedBox(),
                                                  (cubit.value)
                                                      ? Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child:
                                                              cubit.isFullScreen
                                                                  ? SizedBox(
                                                                      width: 0,
                                                                    )
                                                                  : Container(
                                                                      width: 30,
                                                                      height:
                                                                          30,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                      ),
                                                                      child:
                                                                          (IconButton(
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .arrow_back_ios,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      )),
                                                                    ),
                                                        )
                                                      : SizedBox()
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Card(
                                        child: Lottie.asset(
                                            "assets/images/loader.json"))),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.03,
                            // ),
                            Expanded(
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) => Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 20),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        // border: Border.all(),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              // CircularPercentIndicator(
                                              //   animation: true,
                                              //   animationDuration: 1200,
                                              //   radius: 20.0,
                                              //   lineWidth: 2.0,
                                              //   percent: 0.78,
                                              //   center: new Text("78%"),
                                              //   progressColor: Colors.blue,
                                              //   circularStrokeCap:
                                              //       CircularStrokeCap.round,
                                              // ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.01,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "${videoCubit.courseSectionsList[index].sectionNum}.${videoCubit.courseSectionsList[index].sectionName}",
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Text(
                                                "${videoCubit.courseSectionsList[index].videos!.length} Lecture ",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          if (selectedContent ==
                                              videoCubit
                                                  .courseSectionsList[index]
                                                  .sectionName)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 18.0),
                                              child: Column(
                                                children: [
                                                  ListView.separated(
                                                    itemBuilder:
                                                        (context, index2) =>
                                                            GestureDetector(
                                                      onTap: () {},
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              controller!
                                                                  .dispose();
                                                              initVideo(videoCubit
                                                                  .courseSectionsList[
                                                                      index]
                                                                  .videos![index2]);
                                                            },
                                                            child: Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons
                                                                      .play_circle_outline,
                                                                  color: Colors
                                                                      .blue,
                                                                ),
                                                                SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.01,
                                                                ),
                                                                Expanded(
                                                                    child: Text(
                                                                  "${videoCubit.courseSectionsList[index].videosTitle![index2]}",
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          18),
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 30.0),
                                                            child: Text(
                                                              ' ',
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    separatorBuilder:
                                                        (context, index2) =>
                                                            SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.01,
                                                    ),
                                                    itemCount: videoCubit
                                                        .courseSectionsList[
                                                            index]
                                                        .videos!
                                                        .length,
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20),
                                      decoration: BoxDecoration(
                                        // border: Border.all(),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (selectedContent !=
                                                videoCubit
                                                    .courseSectionsList[index]
                                                    .sectionName) {
                                              selectedContent = videoCubit
                                                  .courseSectionsList[index]
                                                  .sectionName!;
                                            } else {
                                              selectedContent = 'null';
                                            }
                                            setState(() {});
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                itemCount: videoCubit.courseSectionsList.length,
                                separatorBuilder: (context, index) => SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                            //   child: SizedBox(
                            //     width: double.infinity,
                            //     child: ElevatedButton(
                            //       onPressed: () {},
                            //       style: ButtonStyle(
                            //         padding: MaterialStateProperty.all(
                            //           const EdgeInsets.symmetric(
                            //             vertical: 20,
                            //           ),
                            //         ),
                            //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            //             RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(18.0),
                            //         )),
                            //         overlayColor: MaterialStateProperty.all(Colors.transparent),
                            //         splashFactory: NoSplash.splashFactory,
                            //         elevation: MaterialStateProperty.all(0),
                            //         backgroundColor: MaterialStateProperty.all(Colors.black),
                            //         foregroundColor: MaterialStateProperty.all(Colors.white),
                            //       ),
                            //       child: const Text(
                            //         'Buy Course',
                            //         style: TextStyle(fontSize: 25),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }

  String prettyDuration(Duration d) {
    var min = d.inMinutes < 10 ? "0${d.inMinutes}" : d.inMinutes.toString();
    var sec = d.inSeconds < 10 ? "0${d.inSeconds}" : d.inSeconds.toString();
    return min + ":" + sec;
  }
}
