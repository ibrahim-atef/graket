class UserModel {
  String? name;
  String? email;
  String? uId;
  String? phone;
  String? image;
  String? ip;

  UserModel({this.name, this.email, this.uId, this.image,this.phone,this.ip});

  UserModel.fromJson( json) {
    name = json['name'];
    email = json['email'];
    uId = json['uId'];
    phone = json['phone'];
    image = json['image'];
    ip = json['ip'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'phone': phone,
      'image': image,
      'ip': ip,
    };
  }
}
