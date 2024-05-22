import 'dart:convert';

class ProfileModel {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? innPassport;
  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.innPassport,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'inn_passport': innPassport,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      phone: map['phone'],
      email: map['email'],
      innPassport: map['inn_passport'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
