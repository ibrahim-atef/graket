class Course {
  String courseId;
  String title;
  String description;
  String category;
  String imageUrl;
  String totalTime;
  int students;
  String totalContent;
  String language;
  List<dynamic> skills;
  bool enrollable;
  String createdAt;
  String lastUpdated;
  String courseAuthor;
  bool enrolled;
  bool isSubmitted;
  bool wishlist;

  Course(
      {required this.courseId,
      required this.title,
      required this.description,
      required this.category,
      required this.imageUrl,
      required this.totalTime,
        required this.students,
      required this.totalContent,
      required this.language,
      required this.skills,
      required this.enrollable,
      required this.createdAt,
      required this.lastUpdated,
      required this.courseAuthor,
      required this.enrolled,
      required this.isSubmitted,
      required this.wishlist});

  factory Course.fromJson(json) {
    return Course(
      courseId: json['courseId'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      students: json['students'],
      totalTime: json['totalTime'],
      totalContent: json['totalContent'],
      language: json['language'],
      skills: json['skills'],
      enrollable: json['enrollable'],
      createdAt: json['createdAt'],
      lastUpdated: json['lastUpdated'],
      courseAuthor: json['courseAuthor'],
      enrolled: json['enrolled'],
      isSubmitted: json['isSubmitted'],
      wishlist: json['wishlist'],
    );
  }

  Map<String, dynamic> toJson(Course courses) {
    Map<String, dynamic> data = Map();
    data['courseId'] = courses.courseId;
    data['title'] = courses.title;
    data['description'] = courses.description;
    data['category'] = courses.category;
    data['imageUrl'] = courses.imageUrl;
    data['students'] = courses.students;
    data['totalTime'] = courses.totalTime;
    data['totalContent'] = courses.totalContent;
    data['language'] = courses.language;
    data['skills'] = courses.skills;
    data['enrollable'] = courses.enrollable;
    data['createdAt'] = courses.createdAt;
    data['lastUpdated'] = courses.lastUpdated;
    data['enrolled'] = courses.enrolled;
    data['courseAuthor'] = courses.courseAuthor;
    data['isSubmitted'] = courses.isSubmitted;
    data['wishlist'] = courses.wishlist;
    return data;
  }
}
