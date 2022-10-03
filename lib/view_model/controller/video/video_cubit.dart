import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

import '../../../model/course_model/course_section_model.dart';
import '../../../utilites/app_constants.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  static VideoCubit get(context) => BlocProvider.of<VideoCubit>(context);
  var courseSectionsList = <SectionModel>[];

  double currentVolume = 1;
  bool value = false;
  bool isFullScreen = false;


  void changeFullScreen() {
    isFullScreen = !isFullScreen;
    emit(ChangeFullScreenState());
  }


  void changeStateVideo({required VideoPlayerController controller}) {
    controller.value.isPlaying ? controller.pause() : controller.play();
    emit(VideoStateChange());
  }


  changeValueState() {
    value = !value;
    emit(ChangeValueState());
  }


  // this for speed video 10s

  void forward({required VideoPlayerController controller}) {
    controller
        .seekTo(Duration(seconds: controller.value.position.inSeconds + 10));
    emit(ForwardVideo());
  }


  // this for backward video 10s

  void backward({required VideoPlayerController controller}) {
    controller
        .seekTo(Duration(seconds: controller.value.position.inSeconds - 10));
    emit(BackwardVideo());
  }


  // this for duration video
  void durationOfVideo(
      {required VideoPlayerController controller, required double value}) {
    controller.seekTo(Duration(milliseconds: value.toInt()));
    emit(DurationVideo());
  }


  //this for set volume video
  void setVolume(
      {required VideoPlayerController controller, required double newValue}) {
    print(currentVolume);
    print(newValue);
    currentVolume = newValue;
    controller.setVolume(currentVolume);
    emit(VolumeChange());
  }

  // get course sections and content
  getCourseSections({required String courseId}) {
    emit(GetCourseSectionLoadingState());
    FirebaseFirestore.instance.collection(courseCollectionKey).doc(courseId)
        .collection(courseContentCollectionKey).orderBy("sectionNum").snapshots().listen
        ((value) {
      if (value.docs.isNotEmpty) {
        courseSectionsList.clear();
        for (int i = 0; i < value.docs.length; i++) {
          courseSectionsList.add(SectionModel.fromJson(value.docs[i]));
        }
        emit(GetCourseSectionSuccessState(courseSectionsList[0].videos![0]));
      } else {
        emit(GetCourseSectionErrorState("data is empty"));
      }});
    //  .catchError((error) {
    //   print(error);
    //   emit(GetCourseSectionErrorState(error.toString()));
    // });
  }


}
