import 'package:pas1_mobile_11pplg2_24/models/user_model.dart';
import 'dart:convert';

ProfileResponse getUserResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

class ProfileResponse {
    final bool status;
    final String message;
    final UserModel? data;

    ProfileResponse({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProfileResponse.fromJson(Map<String, dynamic> map) {
        return ProfileResponse(
            status: map['status'],
            message: map['message'],
            data: map['data'] == null ? null : UserModel.fromMap(map['data']),
        );
    }

}