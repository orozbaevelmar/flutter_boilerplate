import 'dart:convert';

class CategoryModel {
  int? count;
  String? next;
  String? previous;
  List<CategorySingle>? results;
  CategoryModel({
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

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      count: map['count'],
      next: map['next'],
      previous: map['previous'],
      results: map['results'] != null
          ? List<CategorySingle>.from(
              map['results'].map(
                (x) => CategorySingle.fromMap(x),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String response) {
    return CategoryModel.fromMap(json.decode(response) as Map<String, dynamic>);
  }
}

class CategorySingle {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  CategorySingle({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name': name,
    };
  }

  factory CategorySingle.fromMap(Map<String, dynamic> map) {
    return CategorySingle(
      id: map['id'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategorySingle.fromJson(String source) =>
      CategorySingle.fromMap(json.decode(source) as Map<String, dynamic>);
}
