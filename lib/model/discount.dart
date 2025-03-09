import 'dart:convert';

import 'package:flutter_boilerplate/model/result.dart';

class DiscountsModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;
  DiscountsModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'next': next,
      'previous': previous,
      'results': results != null ? results!.map((e) => e.toJson()).toList() : []
    };
  }

  factory DiscountsModel.fromMap(Map<String, dynamic> map) {
    return DiscountsModel(
      count: map['count'],
      next: map['next'],
      previous: map['previous'],
      results: map['results'] != null
          ? List<Results>.from(
              map['results'].map(
                (x) => Results.fromMap(x),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscountsModel.fromJson(String response) {
    return DiscountsModel.fromMap(
        json.decode(response) as Map<String, dynamic>);
  }
}

class DiscountSingle {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? value;
  String? type;
  String? description;
  DiscountSingle({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.value,
    this.type,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name': name,
      'value': value,
      'type': type,
      'description': description,
    };
  }

  factory DiscountSingle.fromMap(Map<String, dynamic> map) {
    return DiscountSingle(
      id: map['id'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      name: map['name'],
      value: map['value'],
      type: map['type'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscountSingle.fromJson(String source) =>
      DiscountSingle.fromMap(json.decode(source) as Map<String, dynamic>);
}
