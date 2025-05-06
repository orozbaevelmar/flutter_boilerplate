import 'dart:convert';

import 'package:flutter_boilerplate/stuffs/model/result.dart';

class ProductsModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;
  ProductsModel({
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

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
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

  factory ProductsModel.fromJson(String response) {
    return ProductsModel.fromMap(json.decode(response) as Map<String, dynamic>);
  }
}
