import 'dart:convert';

class ProfileModel {
  int? id;
  String? firstName;
  String? lastName;
  String? avatar;
  String? phone;
  String? email;
  String? innPassport;
  int? notificationsCount;
  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
    this.phone,
    this.email,
    this.innPassport,
    this.notificationsCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
      'phone': phone,
      'email': email,
      'inn_passport': innPassport,
      'notifications_count': notificationsCount
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      avatar: map['avatar'],
      phone: map['phone'],
      email: map['email'],
      innPassport: map['inn_passport'],
      notificationsCount: map['notifications_count'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
