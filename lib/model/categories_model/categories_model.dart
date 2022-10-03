class CategoriesModel {
  String categoryName;
  String image;

  int classes;

  CategoriesModel({required this.categoryName, required this.classes, required this.image});

  Map<String, dynamic> toMap() {
    return {
      'categoryName': this.categoryName,
      'classes': this.classes,'image': this.image,
    };
  }

  factory CategoriesModel.fromMap(  map) {
    return CategoriesModel(
      categoryName: map['categoryName']  ,
      image: map['image']  ,
      classes: map['classes']   ,
    );
  }
}
