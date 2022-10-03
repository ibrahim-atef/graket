// import 'package:flutter/material.dart';
//
// import 'course_content.dart';
//
// class CourseDescription extends StatefulWidget {
//   const CourseDescription({Key? key}) : super(key: key);
//
//   @override
//   State<CourseDescription> createState() => _CourseDescriptionState();
// }
//
// class ContentData {
//   final name;
//   final numbOfLec;
//   final duration;
//   final lecList;
//   final selectionName;
//
//   ContentData({
//     this.name,
//     this.numbOfLec,
//     this.duration,
//     this.lecList,
//     this.selectionName,
//   });
// }
//
// class _CourseDescriptionState extends State<CourseDescription> {
//   String selectedTab = 'Description';
//   String selectedContent = 'Null';
//
//   @override
//   Widget build(BuildContext context) {
//
//     List<ContentData> contentDataDetails = [
//       ContentData(
//         name: "01.Introduction",
//         numbOfLec: "3 Lectures",
//         duration: "7 min",
//         lecList: [
//           {
//             'name': 'Setting up individual Camera Rigs',
//             'duration': '00:44',
//           },
//           {
//             'name': 'Setting up VRTXs Tracked Alias',
//             'duration': '03:49',
//           },
//           {
//             'name': 'Setting up VRTXs Tracked Alias',
//             'duration': '02:20',
//           },
//         ],
//         selectionName: 'Intro',
//       ),
//       ContentData(
//         name: "02.Movement In VR",
//         numbOfLec: "3 Lectures",
//         duration: "7 min",
//         lecList: [
//           {
//             'name': 'Setting up individual Camera Rigs',
//             'duration': '00:44',
//           },
//           {
//             'name': 'Setting up VRTXs Tracked Alias',
//             'duration': '03:49',
//           },
//           {
//             'name': 'Setting up VRTXs Tracked Alias',
//             'duration': '02:20',
//           },
//         ],
//         selectionName: "Movement",
//       ),
//       ContentData(
//         name: "03.Distance Grabber",
//         numbOfLec: "3 Lectures",
//         duration: "7 min",
//         lecList: [
//           {
//             'name': 'Setting up individual Camera Rigs',
//             'duration': '00:44',
//           },
//           {
//             'name': 'Setting up VRTXs Tracked Alias',
//             'duration': '02:20',
//           },
//         ],
//         selectionName: "Distance",
//       ),
//       ContentData(
//         name: "04.Snap Zones",
//         numbOfLec: "3 Lectures",
//         duration: "7 min",
//         lecList: [
//
//           {
//             'name': 'Setting up VRTXs Tracked Alias',
//             'duration': '02:20',
//           },
//         ],
//         selectionName: "Snap",
//       ),
//     ];
//
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               // Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.keyboard_arrow_left,
//               color: Colors.white,
//               size: 40,
//             )),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(
//               right: 10.0,
//             ),
//             child: IconButton(
//                 onPressed: () {
//                   // Navigator.pop(context);
//                 },
//                 icon: const Icon(
//                   Icons.favorite_outline_sharp,
//                   color: Colors.white,
//                   size: 35,
//                 )),
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.42,
//             width: double.infinity,
//             color: const Color(0xFF8D989D),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 100,
//                     right: 20,
//                     left: 20,
//                     bottom: 10,
//                   ),
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.68,
//                     child: Row(
//                       children: [
//                         const Text(
//                           '5.0',
//                           style:
//                           TextStyle(fontSize: 15, color: Color(0xffFFC700)),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.005,
//                         ),
//                         const Icon(
//                           Icons.star,
//                           color: Color(0xffFFC700),
//                           size: 15,
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.005,
//                         ),
//                         const Icon(
//                           Icons.star,
//                           color: Color(0xffFFC700),
//                           size: 15,
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.005,
//                         ),
//                         const Icon(
//                           Icons.star,
//                           color: Color(0xffFFC700),
//                           size: 15,
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.005,
//                         ),
//                         const Icon(
//                           Icons.star,
//                           color: Color(0xffFFC700),
//                           size: 15,
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.005,
//                         ),
//                         const Icon(
//                           Icons.star,
//                           color: Color(0xffFFC700),
//                           size: 15,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 0.0,
//                     right: 20,
//                     left: 20,
//                     bottom: 30,
//                   ),
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.68,
//                     child: const Text(
//                       'Development of Virtual Reality & Augmented Reality',
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     right: 20,
//                     left: 20,
//                     bottom: 10,
//                   ),
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.68,
//                     child: Row(
//                       children: [
//                         const Icon(
//                           Icons.refresh,
//                           color: Colors.white,
//                           size: 13,
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.005,
//                         ),
//                         const Text(
//                           'Last update Apr 5, 2022',
//                           style: TextStyle(fontSize: 13, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     right: 20,
//                     left: 20,
//                     bottom: 10,
//                   ),
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.68,
//                     child: Row(
//                       children: [
//                         const Icon(
//                           Icons.book_outlined,
//                           color: Colors.white,
//                           size: 13,
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.005,
//                         ),
//                         const Text(
//                           '23 lectures',
//                           style: TextStyle(fontSize: 13, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     right: 20,
//                     left: 20,
//                     bottom: 10,
//                   ),
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.68,
//                     child: Row(
//                       children: [
//                         const Icon(
//                           Icons.person_outline,
//                           color: Colors.white,
//                           size: 15,
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.005,
//                         ),
//                         const Text(
//                           'Jack smith',
//                           style: TextStyle(fontSize: 13, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 30,
//                     right: 20,
//                     left: 20,
//                     bottom: 10,
//                   ),
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.68,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: const [
//                         Text(
//                           '\$35,00',
//                           style: TextStyle(fontSize: 25, color: Colors.white),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           '\$55,00',
//                           style: TextStyle(
//                               decoration: TextDecoration.lineThrough,
//                               fontSize: 17,
//                               color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Column(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedTab = "Description";
//                       });
//                     },
//                     style: ButtonStyle(
//                       overlayColor:
//                       MaterialStateProperty.all(Colors.transparent),
//                       //replace this with your desired color
//                       splashFactory: NoSplash.splashFactory,
//                       elevation: MaterialStateProperty.all(0),
//                       backgroundColor: MaterialStateProperty.all(Colors.white),
//                       foregroundColor: MaterialStateProperty.all(Colors.black),
//                     ),
//                     child: const Text(
//                       'Description',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                   Container(
//                     height: 3,
//                     width: MediaQuery.of(context).size.width * 0.3,
//                     color: selectedTab == "Description"
//                         ? Colors.black
//                         : Colors.white,
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedTab = "Lesson";
//                       });
//                     },
//                     style: ButtonStyle(
//                       overlayColor:
//                       MaterialStateProperty.all(Colors.transparent),
//                       //replace this with your desired color
//                       splashFactory: NoSplash.splashFactory,
//                       elevation: MaterialStateProperty.all(0),
//                       backgroundColor: MaterialStateProperty.all(Colors.white),
//                       foregroundColor: MaterialStateProperty.all(Colors.black),
//                     ),
//                     child: const Text(
//                       'Lesson',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                   Container(
//                     height: 3,
//                     width: MediaQuery.of(context).size.width * 0.25,
//                     color:
//                     selectedTab == "Lesson" ? Colors.black : Colors.white,
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         selectedTab = "Quiz";
//                       });
//                     },
//                     style: ButtonStyle(
//                       overlayColor:
//                       MaterialStateProperty.all(Colors.transparent),
//                       //replace this with your desired color
//                       splashFactory: NoSplash.splashFactory,
//                       elevation: MaterialStateProperty.all(0),
//                       backgroundColor: MaterialStateProperty.all(Colors.white),
//                       foregroundColor: MaterialStateProperty.all(Colors.black),
//                     ),
//                     child: const Text(
//                       'Quiz',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                   Container(
//                     height: 3,
//                     width: MediaQuery.of(context).size.width * 0.25,
//                     color: selectedTab == "Quiz" ? Colors.black : Colors.white,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.008,
//           ),
//           Expanded(
//             child: selectedTab == 'Description'
//                 ? ListView(
//               padding: EdgeInsets.zero,
//               children: const [
//                 Padding(
//                   padding:
//                   EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
//                   child: Text(
//                     'About Course',
//                     style: TextStyle(
//                         fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                   EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
//                   child: Text(
//                     'Welcome to Udemy\'s first, No Coding Required, VR development course, using VRTK 4. Build once and deploy to both Oculus and Steam VR devices.',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       height: 1.5,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                   EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
//                   child: Text(
//                     'This course, teaches you everything,u need to know to build your very own VR apps and games using the world class Unity Engine.',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       height: 1.5,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                   EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
//                   child: Text(
//                     'This course, teaches you everything,u need to know to build your very own VR apps and games using the world class Unity Engine.',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       height: 1.5,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                   EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
//                   child: Text(
//                     'This course, teaches you everything,u need to know to build your very own VR apps and games using the world class Unity Engine.',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       height: 1.5,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                   EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
//                   child: Text(
//                     'This course, teaches you everything,u need to know to build your very own VR apps and games using the world class Unity Engine.',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       height: 1.5,
//                     ),
//                   ),
//                 ),
//               ],
//             )
//                 : selectedTab == 'Lesson'
//                 ? ListView.separated(
//               padding: EdgeInsets.zero,
//               itemBuilder: (context,index) => Stack(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 15.0, horizontal: 20),
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 10.0, horizontal: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       // border: Border.all(),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                           offset: const Offset(
//                               0, 3), // changes position of shadow
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                           children: [
//                             Flexible(
//                               child: Text(
//                                 "${contentDataDetails[index].name}",
//                                 style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Text("${contentDataDetails[index].numbOfLec}, ${contentDataDetails[index].duration}"),
//                           ],
//                         ),
//                         if (selectedContent == contentDataDetails[index].selectionName)
//                           Padding(
//                             padding:
//                             const EdgeInsets.only(top: 18.0),
//                             child: Column(
//                               children: [
//                                 ListView.separated(
//                                   itemBuilder: (context,index2) => GestureDetector(
//                                     onTap: (){
//
//                                     },
//                                     child: Column(
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             const Icon(Icons
//                                                 .play_circle_outline),
//                                             SizedBox(
//                                               width:
//                                               MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                                   0.01,
//                                             ),
//                                             Flexible(
//                                                 child: Text(
//                                                   "${contentDataDetails[index].lecList[index2]['name']}",
//                                                   style: const TextStyle(
//                                                       fontSize: 18),
//                                                 )),
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               left: 30.0),
//                                           child: Text(
//                                             '${contentDataDetails[index].lecList[index2]['duration']}',
//                                             style: const TextStyle(
//                                                 fontSize: 15,
//                                                 color: Colors.grey),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   separatorBuilder: (context,index2) => SizedBox(
//                                     height: MediaQuery.of(context).size.height*0.01,
//                                   ),
//                                   itemCount: contentDataDetails[index].lecList.length,
//                                   shrinkWrap: true,
//                                   physics: NeverScrollableScrollPhysics(),
//                                   padding: EdgeInsets.zero,
//                                 ),
//                               ],
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height:
//                     MediaQuery.of(context).size.height * 0.06,
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 10.0, horizontal: 20),
//                     decoration: BoxDecoration(
//                       // border: Border.all(),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: InkWell(
//                       onTap: () {
//                         setState(() {
//                           if (selectedContent != contentDataDetails[index].selectionName) {
//                             selectedContent = contentDataDetails[index].selectionName;
//                           } else {
//                             selectedContent = 'null';
//                           }
//                           setState(() {});
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               itemCount: contentDataDetails.length,
//               separatorBuilder: (context,index) => SizedBox(height: MediaQuery.of(context).size.height*0.01,),
//             )
//                 : Container(),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
//             child: SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all(
//                     const EdgeInsets.symmetric(
//                       vertical: 20,
//                     ),
//                   ),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                       )),
//                   overlayColor: MaterialStateProperty.all(Colors.transparent),
//                   splashFactory: NoSplash.splashFactory,
//                   elevation: MaterialStateProperty.all(0),
//                   backgroundColor: MaterialStateProperty.all(Colors.black),
//                   foregroundColor: MaterialStateProperty.all(Colors.white),
//                 ),
//                 child: const Text(
//                   'Buy Course',
//                   style: TextStyle(fontSize: 25),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }