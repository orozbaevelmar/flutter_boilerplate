import 'dart:convert';

import 'package:flutter_boilerplate/model/attributes.dart';
import 'package:flutter_boilerplate/model/category.dart';
import 'package:flutter_boilerplate/model/discount.dart';

class Results {
  int? id;
  CategorySingle? category;
  String? image;
  DiscountSingle? discount;
  List<Photos>? images;
  List<Attributes>? attributes;
  double? discountPrice;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;
  String? price;
  bool? isFavorite;
  int? favoriteId;
  Results({
    this.id,
    this.category,
    this.image,
    this.discount,
    this.images,
    this.attributes,
    this.discountPrice,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.price,
    this.isFavorite,
    this.favoriteId,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {};
    map['id'] = id;

    if (map['category']) {
      map['category'] = category?.toMap();
    }
    map['image'] = image;
    map['discount'] = discount?.toMap();
    if (images != null) {
      map['images'] = images!.map((e) => e.toMap()).toList();
    }
    if (attributes != null) {
      map['attributes'] = attributes!.map((e) => e.toMap()).toList();
    }
    map['discount_price'] = discountPrice;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['is_favorite'] = isFavorite;
    map['favorite_id'] = favoriteId;
    return map;
  }

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      id: map['id'],
      category: map['discount'] != null
          ? CategorySingle.fromMap(map['category'])
          : null,
      image: map['image'],
      discount: map['discount'] != null
          ? DiscountSingle.fromMap(map['discount'])
          : null,
      images: map['images'] != null
          ? List<Photos>.from(
              (map['images'] as List<dynamic>).map<Photos?>(
                (x) => Photos.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      attributes: map['attributes'] != null
          ? List<Attributes>.from(
              (map['attributes'] as List<dynamic>).map<Attributes?>(
                (x) => Attributes.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      discountPrice: map['discount_price'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      isFavorite: map['is_favorite'],
      favoriteId: map['favorite_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Results.fromJson(String source) =>
      Results.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Photos {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? image;
  Photos({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'image': image,
    };
  }

  factory Photos.fromMap(Map<String, dynamic> map) {
    return Photos(
      id: map['id'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Photos.fromJson(String source) =>
      Photos.fromMap(json.decode(source) as Map<String, dynamic>);
}
