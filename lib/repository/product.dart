import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/model/product.dart';
import 'package:flutter_boilerplate/utils/dependency_injection.dart';
import 'package:flutter_boilerplate/utils/failure.dart';
import 'package:flutter_boilerplate/utils/loc_secure_storage.dart';
import 'package:http/http.dart' as http;

class ProductsRepository {
  static Future<Either<Failure, ProductsModel>> getProducts(
      {required String url}) async {
    try {
      var uri = Uri.parse(url);
      var headers = {
        'Authorization':
            'Token ${await getIt<LocaleSecureStorage>().getSecureToken()}'
      };
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        return Right(ProductsModel.fromJson(responseBody));
      } else {
        return Left(Failure(message: 'Failed to parse json response'));
      }
    } catch (e) {
      return Left(Failure(message: 'Something went wrong'));
    }
  }
}
