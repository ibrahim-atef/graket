import 'package:cloud_firestore/cloud_firestore.dart';

class SectionModel{

  Timestamp? dateCreated;
  String? sectionName;
  int? sectionNum;
  List? videos;
  List? videosTitle;

  SectionModel({this.dateCreated, this.sectionName, this.sectionNum, this.videosTitle,this.videos});

  SectionModel.fromJson( json) {
    dateCreated = json['dateCreated'];
    sectionName = json['sectionName'];
    sectionNum = json['sectionNum'];
    videos = json['videos'];
    videosTitle = json['videosTitle'];
  }

  Map<String, dynamic> toMap() {
    return {
      'dateCreated': dateCreated,
      'sectionName': sectionName,
      'sectionNum': sectionNum,
      'videos': videos,
      'videosTitle': videosTitle,
    };
  }}