// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lottie/lottie.dart';
//
// import 'package:video_player/video_player.dart';
//
// import '../../../view_model/controller/video/video_cubit.dart';
//
// class CustomVideoPlayer extends StatefulWidget {
//   BuildContext x;
//   String videoLink;
//
//   CustomVideoPlayer({Key? key, required this.x, required this.videoLink}) : super(key: key);
//
//   @override
//   _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
// }
//
// class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
//   VideoPlayerController? controller;
//   Duration? duration;
//
//
//   void initState() {
//     super.initState();
//     controller = VideoPlayerController.network(
//         widget.videoLink,
//         videoPlayerOptions: VideoPlayerOptions())
//       ..initialize().then((value) {
//         duration = controller!.value.duration;
//         debugPrint("========>>>>>>>>>> duration" +
//             controller!.value.duration.toString());
//       });
//     controller!.addListener(() {
//       setState(() {});
//
//       duration = controller!.value.duration;
//     });
//   }
//
// /*  void goFullScreen() {
//     document.documentElement!.requestFullscreen();
//   }
//
//   void exitFullScreen() {
//     document.exitFullscreen();
//   }*/
//
// /*  void dispose() {
//     SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
//     super.dispose();
//   }*/
//
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//
//     // SystemChrome.setEnabledSystemUIOverlays([]);
//     return controller!.value.isInitialized
//         ? BlocBuilder<VideoCubit, VideoState>(
//             builder: (context, state) {
//               var cubit = VideoCubit.get(context);
//               return RotatedBox(
//                 quarterTurns: cubit.isFullScreen ? 3 : 4,
//                 child: InkWell(
//                   // onHover: (hover) {
//                   //   value = hover;
//                   // },
//                   onTap: () {
//                     cubit.changeValueState();
//                   },
//                   child: SizedBox(
//                     width: cubit.isFullScreen ? h : w,
//                     child: AspectRatio(
//                       aspectRatio: controller!.value.aspectRatio,
//                       child: GestureDetector(
//                         child: Stack(children: [
//                           VideoPlayer(controller!),
//                           InkWell(
//                               // onTap: () {
//                               //   cubit.changeStateVideo(controller: controller!);
//                               // },
//                               ),
//                           (cubit.value)
//
//                               //video controls
//                               ? Align(
//                                   alignment: Alignment.bottomCenter,
//                                   child: Container(
//                                     // margin: EdgeInsets.symmetric(
//                                     //   vertical: h * .005,
//                                     // ),
//                                     padding: const EdgeInsets.all(1.0),
//                                     width: .9 * w,
//                                     height: .06 * h,
//                                     decoration: BoxDecoration(
//                                         color: const Color.fromRGBO(
//                                             45, 45, 45, 0.65),
//                                         borderRadius:
//                                             BorderRadius.circular(20)),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         //control play video
//                                         SizedBox(
//                                           width: 5,
//                                         ),
//                                         Container(
//                                           //     margin: EdgeInsets.only(top: 4),
//                                           child: InkWell(
//                                               onTap: () {
//                                                 cubit.changeStateVideo(
//                                                     controller: controller!);
//                                               },
//                                               child: !controller!
//                                                       .value.isPlaying
//                                                   ? Icon(
//                                                       Icons.play_arrow_rounded,
//                                                       color: Colors.white,
//                                                       size: 28,
//                                                     )
//                                                   : Icon(
//                                                       Icons.pause_circle,
//                                                       color: Colors.white,
//                                                       size: 28,
//                                                     )),
//                                         ),
//
//                                         //start duration + video slider + end duration
//
//                                         SizedBox(
//                                             child: Row(
//                                           children: [
//                                             //start duration
//                                             Text(
//                                               duration == null
//                                                   ? "00:00"
//                                                   : prettyDuration(controller!
//                                                       .value.position),
//                                               style: TextStyle(
//                                                   fontSize: 10,
//                                                   color: Colors.white),
//                                             ),
//
//                                             //video slider
//                                             SizedBox(
//                                               width: .4 * w,
//                                               child: SliderTheme(
//                                                 data: SliderTheme.of(context)
//                                                     .copyWith(
//                                                         trackHeight: 3,
//                                                         thumbShape:
//                                                             RoundSliderThumbShape(
//                                                                 enabledThumbRadius:
//                                                                     5)),
//                                                 child: Slider(
//                                                     value: controller!.value
//                                                         .position.inMilliseconds
//                                                         .toDouble(),
//                                                     activeColor: Colors.white,
//                                                     inactiveColor: Colors.white
//                                                         .withOpacity(0.20),
//                                                     onChanged: (value) {
//                                                       cubit.durationOfVideo(
//                                                           controller:
//                                                               controller!,
//                                                           value: value);
//                                                       // setState(() {
//                                                       //   controller!.seekTo(
//                                                       //       Duration(
//                                                       //           milliseconds:
//                                                       //           value.toInt()));
//                                                       // });
//                                                     },
//                                                     max: controller!.value
//                                                         .duration.inMilliseconds
//                                                         .toDouble(),
//                                                     min: 0),
//                                               ),
//                                             ),
//
//                                             //end duration
//                                             Text(
//                                               duration == null
//                                                   ? "00:00"
//                                                   : prettyDuration(duration!),
//                                               style: TextStyle(
//                                                   fontSize: 10,
//                                                   color: Colors.white),
//                                             ),
//                                           ],
//                                         )),
//
//                                         //volume + volume slider
//
//                                         // Stack(
//                                         //   children: [
//                                         //     //volume
//                                         //     Icon(
//                                         //       Icons.volume_down_alt,
//                                         //       color: Colors.white,
//                                         //       size: 20,
//                                         //     ),
//                                         //
//                                         //     //volume slider
//                                         //
//                                         //     Container(
//                                         //         width: 50,
//                                         //         height: 4,
//                                         //         margin: EdgeInsets.only(top: 6 ),
//                                         //         child: SliderTheme(
//                                         //           data: SliderTheme.of(context)
//                                         //               .copyWith(
//                                         //             trackHeight: 2 ,
//                                         //             trackShape:
//                                         //                 RoundedRectSliderTrackShape(),
//                                         //             thumbShape: SliderComponentShape
//                                         //                 .noThumb,
//                                         //           ),
//                                         //           child: Slider(
//                                         //               value: cubit.currentVolume,
//                                         //               activeColor:
//                                         //                   Colors.white,
//                                         //               inactiveColor: Colors
//                                         //                   .white
//                                         //                   .withOpacity(0.20),
//                                         //               onChanged: (newvol) {
//                                         //                 //set new volume
//                                         //                 cubit.setVolume(
//                                         //                     controller:
//                                         //                         controller!,
//                                         //                     newValue: newvol);
//                                         //               },
//                                         //               max: 1,
//                                         //               min: 0),
//                                         //         )),
//                                         //   ],
//                                         // ),
//
//                                         //captioning + settings + full screen
//                                         InkWell(
//                                           onTap: () {
//                                             cubit.changeFullScreen();
//                                           },
//                                           child: Icon(
//                                             Icons.fullscreen,
//                                             color: Colors.white,
//                                             size: 20,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               : const SizedBox(),
//                           (cubit.value)
//
//                               //back 10sec + play video + forward 10sec
//                               ? Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         //back 10sec
//                                         InkWell(
//                                           onTap: () {
//                                             cubit.backward(
//                                                 controller: controller!);
//                                           },
//                                           child: Icon(
//                                             Icons.rotate_left,
//                                             color: Colors.white,
//                                             size: 25,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 25,
//                                         ),
//
//                                         //play video
//                                         InkWell(
//                                             onTap: () {
//                                               cubit.changeStateVideo(
//                                                   controller: controller!);
//                                             },
//                                             child: !controller!.value.isPlaying
//                                                 ? Icon(
//                                                     Icons.play_arrow_rounded,
//                                                     color: Colors.white,
//                                                     size: 39,
//                                                   )
//                                                 : Icon(
//                                                     Icons.pause_rounded,
//                                                     color: Colors.white,
//                                                     size: 39,
//                                                   )),
//
//                                         //forward 10sec
//                                         SizedBox(
//                                           width: 20,
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             cubit.forward(
//                                                 controller: controller!);
//                                           },
//                                           child: Icon(
//                                             Icons.rotate_right,
//                                             color: Colors.white,
//                                             size: 25,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 )
//                               : const SizedBox(),
//                           (cubit.value)
//                               ? Align(
//                                   alignment: Alignment.topLeft,
//                                   child: cubit.isFullScreen
//                                       ? SizedBox(
//                                           width: 0,
//                                         )
//                                       : Container(
//                                           width: 30,
//                                           height: 30,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(30),
//                                           ),
//                                           child: (IconButton(
//                                             icon: Icon(
//                                               Icons.arrow_back_ios,
//                                               color: Colors.white,
//                                             ),
//                                             onPressed: () {
//                                               Navigator.of(widget.x).pop();
//                                             },
//                                           )),
//                                         ),
//                                 )
//                               : SizedBox()
//                         ]),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           )
//         : AspectRatio(
//             aspectRatio: 16 / 9,
//             child: Card(child: Lottie.asset("assets/images/loader.json")));
//   }
//
//
//   String prettyDuration(Duration d) {
//     var min = d.inMinutes < 10 ? "0${d.inMinutes}" : d.inMinutes.toString();
//     var sec = d.inSeconds < 10 ? "0${d.inSeconds}" : d.inSeconds.toString();
//     return min + ":" + sec;
//   }
// }



/// future Use