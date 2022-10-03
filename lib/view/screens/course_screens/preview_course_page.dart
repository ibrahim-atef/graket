//
// // import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
//
// import '../../../utilites/app_colors.dart';
// import '../../../view_model/api_helper/remote/firebase/firebase.dart';
//
// // import 'package:video_player/video_player.dart';
// // import 'package:pod_player/pod_player.dart';
//
// class PreviewCoursePage extends StatefulWidget {
//
//
//   PreviewCoursePage({Key? key,     }) : super(key: key);
//
//   @override
//   State<PreviewCoursePage> createState() => _PreviewCoursePageState();
// }
//
// class _PreviewCoursePageState extends State<PreviewCoursePage> {
//
//
//   // Chewie
//
//   // late VideoPlayerController videoPlayerController;
//   // late ChewieController chewieController;
//
//   // @override
//   // void dispose() {
//   //   videoPlayerController.dispose();
//   //   chewieController.dispose();
//   //   super.dispose();
//   // }
//
//   // Future<void> initializeVideoPlayer() async {
//   //   var myCourse = database.getAllCourses?[widget.id];
//
//   //   videoPlayerController = VideoPlayerController.network(
//   //       myCourse['chapters'][videoId]['video_url']);
//   //   await Future.wait([videoPlayerController.initialize()]);
//   //   chewieController = ChewieController(
//   //     videoPlayerController: videoPlayerController,
//   //     autoPlay: false,
//   //     looping: true,
//   //   );
//   // }
//
//   // @override
//   // void initState() {
//   //   initializeVideoPlayer();
//   //   super.initState();
//   // }
//
//   // Pod
//
//   // late final PodPlayerController controller;
//
//   // @override
//   // void dispose() {
//   //   controller.dispose();
//   //   super.dispose();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//
//     // Chewie
//     // videoPlayerController = VideoPlayerController.network(
//     //     myCourse['chapters'][videoId]['video_url']);
//
//     // Pod
//
//     // controller = PodPlayerController(
//     //     playVideoFrom: PlayVideoFrom.network(
//     //       myCourse['chapters'][videoId]['video_url'],
//     //     ),
//     //     podPlayerConfig:
//     //         const PodPlayerConfig(autoPlay: false, initialVideoQuality: 144))
//     //   ..initialise();
//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         backgroundColor: neutral5Color,
//         centerTitle: true,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: const Icon(Icons.arrow_back_ios),
//             color: neutral1Color),
//         title: const Text(
//           'Course',
//           style: TextStyle(
//               fontSize: 20, color: neutral1Color, fontWeight: FontWeight.w500),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AspectRatio(
//               aspectRatio: 16 / 9,
//
//             ),
//             // AspectRatio(
//             //     aspectRatio: 16 / 9,
//             //     child: Chewie(
//             //       controller: chewieController,
//             //     ),),
//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 15),
//                   Text(
//                    'name' ,
//                     style: const TextStyle(
//                         fontSize: 20,
//                         color: neutral1Color,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 15),
//                   const Text(
//                     'Lessons',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: primaryColor,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   ListView.builder(
//                     // scrollDirection: Axis.vertical,
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: 3,
//                     itemBuilder: ((context, index) {
//                       return ListTile(
//                         onTap: () {
//
//                         },
//                         leading: Text('${index + 1}'),
//                         title: Text(
//                          " myCourse['chapters'][index]['name']",
//                           style: const TextStyle(
//                             fontSize: 14,
//                             color: neutral1Color,
//                           ),
//                         ),
//                         subtitle: Text(
//                           "myCourse['chapters'][index]['describe']",
//                           style: const TextStyle(
//                             fontSize: 12,
//                             color: neutral2Color,
//                           ),
//                         ),
//                         trailing: SizedBox(
//                           height: 30,
//                           width: 30,
//                           child: IconButton(
//                             splashColor: noneColor,
//                             focusColor: noneColor,
//                             hoverColor: noneColor,
//                             highlightColor: noneColor,
//                             padding: const EdgeInsets.all(0),
//                             iconSize: 20,
//                             icon: const Icon(Icons.download,
//                                 size: 20, color: ascentColor),
//                             onPressed: () {
//                               // print('download');
//                             },
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
