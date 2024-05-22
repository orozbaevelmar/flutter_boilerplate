import 'dart:convert';

import 'package:flutter_boilerplate/model/profile.dart';
import 'package:flutter_boilerplate/utils/dependency_injection.dart';
import 'package:flutter_boilerplate/utils/loc_secure_storage.dart';
import 'package:flutter_boilerplate/utils/m_strings.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ProfileRepository {
  Future<dynamic> getUser() async {
    final response = await http
        .get(Uri.parse("${MString.BASE_URL}/auth/profile/"), headers: {
      'Authorization': 'token ${getIt<LocaleSecureStorage>().getSecureToken()}'
    });
    String responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(json.decode(responseBody));
    }
    return false;
  }

  Future<void> saveUser(ProfileModel profileModel, XFile? image) async {
    var request = http.MultipartRequest(
      'PATCH',
      Uri.parse("${MString.BASE_URL}/auth/profile/"),
    );
    if (image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          image.path,
        ),
      );
    }

    request.headers['Authorization'] =
        'token ${getIt<LocaleSecureStorage>().getSecureToken()}';
    request.headers['Content-Type'] = 'application/json';
    request.fields['data'] = jsonEncode(profileModel.toJson());

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

    // final response =
    //     await http.patch(Uri.parse("${MString.BASE_URL}/accounts/profile/"),
    //         headers: {
    //           'Authorization':
    //               'token ${getIt<SharedPreferencesService>().getToken()}',
    //           'Content-Type': 'application/json'
    //         },
    //         body: jsonEncode(profileModel.toJson()));
    // String responseBody = utf8.decode(response.bodyBytes);
    // print('---res2:$responseBody');
    // if (response.statusCode == 200) {
    //   return true;
    // }
    // return false;
    await http.Response.fromStream(await request.send());
    return;
  }
}
