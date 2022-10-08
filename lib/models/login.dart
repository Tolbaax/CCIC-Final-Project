class LoginModel {
  bool? status;
  String? msg;
  Data? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  UserDetails? userDetails;

  Data.fromJson(Map<String, dynamic> json) {
    userDetails = json['userDetails'] != null
        ? UserDetails.fromJson(json['userDetails'])
        : null;
  }
}

class UserDetails {
  int? id;
  String? name;
  String? phone;
  String? status;
  String? email;
  dynamic emailVerifiedAt;
  String? image;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;

  UserDetails({
    this.id,
    this.name,
    this.phone,
    this.status,
    this.email,
    this.emailVerifiedAt,
    this.image,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
  });

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    status = json['status'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    image = json['image'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
