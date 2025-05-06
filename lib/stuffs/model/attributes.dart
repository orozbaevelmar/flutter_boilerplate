import 'dart:convert';

class Attributes {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? value;
  Attributes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name': name,
      'value': value,
    };
  }

  factory Attributes.fromMap(Map<String, dynamic> map) {
    return Attributes(
      id: map['id'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      name: map['name'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Attributes.fromJson(String source) =>
      Attributes.fromMap(json.decode(source) as Map<String, dynamic>);
}
