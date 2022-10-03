import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  String title;
  String body;
  String image;

  Timestamp date;

  NotificationModel(
      {required this.date,
      required this.body,
      required this.image,
      required this.title});

  Map<String, dynamic> toMap() {
    return {
      'categoryName': this.title,
      'classes': this.body,
      'image': this.image,
      'date': this.date,
    };
  }

  factory NotificationModel.fromMap(map) {
    return NotificationModel(
      title: map['title'],
      image: map['image'],
      body: map['body'],
      date: map['date'],
    );
  }
}
