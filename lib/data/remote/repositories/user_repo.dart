import 'package:ecomm_378/data/remote/helper/api_helper.dart';

import '../../../domain/constants/app_urls.dart';

class UserRepo {
  ApiHelper apiHelper;

  UserRepo({required this.apiHelper});

  Future<dynamic> registerUser({
    required String email,
    required String name,
    required String mobNo,
    required String password,
  }) async {
    try {
      return await apiHelper.postApi(
        url: AppUrls.registrationUrl,
        bodyParams: {
          "name": name,
          "email": email,
          "mobile_number": mobNo,
          "password": password,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  ///loginUser
  Future<dynamic> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      return await apiHelper.postApi(
        url: AppUrls.loginUrl,
        bodyParams: {"email": email, "password": password},
      );
    } catch (e) {
      rethrow;
    }
  }
}
