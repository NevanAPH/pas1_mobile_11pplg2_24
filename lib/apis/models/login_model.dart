import 'dart:convert';

LoginResponse getLoginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

class LoginResponse {
    final bool status;
    final String message;
    final String? token;

    LoginResponse({
        required this.status,
        required this.message,
        required this.token,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> map) {
        return LoginResponse(
            status: map['status'],
            message: map['message'],
            token: map['token'],
        );
    }
}