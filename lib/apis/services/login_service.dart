import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg2_24/apis/api.dart';
import 'package:pas1_mobile_11pplg2_24/apis/models/login_model.dart';

class LoginService {
  static Future<String> signIn(
      String username, String password
  ) async {
    try {
      
      final response = await http
        .post(Uri.parse('$authUrl/login'), 
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        }, 
        body: <String, String>{
          'username': username,
          'password': password,
        }
      );

      // Parse the response
      LoginResponse loginResponse = getLoginResponseFromJson(response.body);

      // Check if the response status is false
      if (!loginResponse.status) {
        throw ApiLoginException(400, loginResponse.message);
      }

      // Return the response
      return loginResponse.token!;
    
    } on Error catch (e) {
      throw ApiLoginException(500, e.toString());
    }
  }
}

class ApiLoginException implements ApiException {
  @override
  String cause;
  int code;

  ApiLoginException(this.code, this.cause);
}
