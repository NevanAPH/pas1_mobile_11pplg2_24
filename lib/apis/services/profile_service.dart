import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg2_24/apis/api.dart';
import 'package:pas1_mobile_11pplg2_24/apis/models/profile_model.dart';
import 'package:pas1_mobile_11pplg2_24/models/user_model.dart';

class ProfileService {
  static Future<UserModel> fetchUser(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$authUrl/get-profile?token=$token')
      );

      // Parse the response
      ProfileResponse userResponse = getUserResponseFromJson(response.body);  // Debugging

      // Check if the response status is false
      if (!userResponse.status) {
        throw ApiProfileException(400, userResponse.message);
      }

      // Return the response
      return userResponse.data!;
      
    } on Error catch (e) {
      throw ApiProfileException(500, e.toString());
    }
  }
}

class ApiProfileException implements ApiException {
  @override
  String cause;
  int code;

  ApiProfileException(this.code, this.cause);
}
