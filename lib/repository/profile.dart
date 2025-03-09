import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/constants/constants.dart';
import 'package:flutter_boilerplate/model/profile.dart';
import 'package:flutter_boilerplate/utils/dependency_injection.dart';
import 'package:flutter_boilerplate/utils/loc_secure_storage.dart';
import 'package:http/http.dart' as http;

class ProfileRepository {
  Future<dynamic> getUser() async {
    try {
      final response = await http
          .get(Uri.parse("${MString.BASE_URL}/auth/profile/"), headers: {
        'Authorization':
            'Token ${await getIt<LocaleSecureStorage>().getSecureToken()}'
      });

      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        return ProfileModel.fromJson(responseBody);
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<Either<String, ProfileModel>> saveUser(
      ProfileModel profileModel) async {
    try {
      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse("${MString.BASE_URL}/auth/profile/"),
      );
      /* if (image != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'avatar',
            image.path,
          ),
        );
      } */

      request.headers['Authorization'] =
          'Token ${await getIt<LocaleSecureStorage>().getSecureToken()}';
      request.headers['Content-Type'] = 'application/json';
      //request.fields['data'] = jsonEncode(profileModel.toJson());

      if (profileModel.firstName != null) {
        request.fields['first_name'] = profileModel.firstName!;
      }
      if (profileModel.lastName != null) {
        request.fields['last_name'] = profileModel.lastName!;
      }
      if (profileModel.phone != null) {
        request.fields['phone'] = profileModel.phone!;
      }
      if (profileModel.email != null) {
        request.fields['email'] = profileModel.email!;
      }
      if (profileModel.innPassport != null) {
        request.fields['inn_passport'] = profileModel.innPassport!;
      }

      final response = await http.Response.fromStream(await request.send());
      String responseBody = utf8.decode(response.bodyBytes);
      if (response.statusCode == 200) {
        return Right(ProfileModel.fromJson(responseBody));
      } else if (json.decode(responseBody)['phone'] != null) {
        return Left('${json.decode(responseBody)['phone'][0]}');
      } else if (json.decode(responseBody)['email'] != null) {
        return Left('${json.decode(responseBody)['email'][0]}');
      } else if (json.decode(responseBody)['inn_passport'] != null) {
        return Left('${json.decode(responseBody)['inn_passport'][0]}');
      } else {
        return const Left('In fields has error');
      }
    } catch (e) {
      return const Left('Somthing went wrong');
    }
  }

  Future<Either<String, ProfileModel>> changeImage(String? imagePath) async {
    try {
      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse("${MString.BASE_URL}/auth/profile/"),
      );
      if (imagePath != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'avatar',
            imagePath,
          ),
        );
      }

      request.headers['Authorization'] =
          'Token ${await getIt<LocaleSecureStorage>().getSecureToken()}';
      request.headers['Content-Type'] = 'application/json';
      //request.fields['data'] = jsonEncode(profileModel.toJson());

      final response = await http.Response.fromStream(await request.send());
      String responseBody = utf8.decode(response.bodyBytes);
      print('StatusCode===${response.statusCode}');
      print('ResponseBody===${responseBody}');
      if (response.statusCode == 200) {
        return Right(ProfileModel.fromJson(responseBody));
      } else if (json.decode(responseBody)['phone'] != null) {
        return Left('${json.decode(responseBody)['phone'][0]}');
      } else if (json.decode(responseBody)['email'] != null) {
        return Left('${json.decode(responseBody)['email'][0]}');
      } else if (json.decode(responseBody)['inn_passport'] != null) {
        return Left('${json.decode(responseBody)['inn_passport'][0]}');
      } else {
        return const Left('In fields has error');
      }
    } catch (e) {
      return const Left('Somthing went wrong');
    }
  }
}
