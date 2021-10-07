import 'dart:convert';

import 'package:MJN/models/login_response.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class MjnAPI {

  static final String securityKey = 'moJoENEt2021sECuriTYkEy';
  static var client = http.Client();

  static Future<LoginResponse> fetchLoginData(
      Map<String, String> params) async {
    var response = await client
        .post(
      LOGIN_URL, body: json.encode(params), headers: { 'content-type': 'application/json',
      "security_key": securityKey},);
    if (response.statusCode == 200) {
      var json = response.body;
      var login = loginResponseFromJson(json);
      return login;
    } else {
      return null;
    }
  }
}

