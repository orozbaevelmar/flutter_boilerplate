import 'dart:convert';

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

class Results {
  int? id;
  Category? category;
  String? image;
  Discount? discount;
  List<Photos>? images;
  List<Attributes>? attributes;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;
  String? price;
  Results({
    this.id,
    this.category,
    this.image,
    this.discount,
    this.images,
    this.attributes,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.price,
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
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    return map;
  }

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      id: map['id'],
      category: Category.fromMap(map['category']),
      image: map['image'],
      discount: Discount.fromMap(map['discount']),
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
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Results.fromJson(String source) =>
      Results.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Discount {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? value;
  String? type;
  String? description;
  Discount({
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

  factory Discount.fromMap(Map<String, dynamic> map) {
    return Discount(
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

  factory Discount.fromJson(String source) =>
      Discount.fromMap(json.decode(source) as Map<String, dynamic>);
}

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

class Category {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  Category({
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

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
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
