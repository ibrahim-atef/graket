part of 'video_cubit.dart';

@immutable
abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoStateChange extends VideoState {}

class ChangeFullScreenState extends VideoState {}

class ChangeValueState extends VideoState {}

class ForwardVideo extends VideoState {}

class BackwardVideo extends VideoState {}

class DurationVideo extends VideoState {}

class VolumeChange extends VideoState {}

class GetCourseSectionLoadingState extends VideoState {}

class GetCourseSectionSuccessState extends VideoState {
  final String firstVideoLink;

  GetCourseSectionSuccessState(this.firstVideoLink);
}

class GetCourseSectionErrorState extends VideoState {
  final String error;

  GetCourseSectionErrorState(this.error);
}
