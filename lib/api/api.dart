import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store/shared_preferences/token_manage.dart';

class Api {
  Future<dynamic> get({required String url}) async {
    // dynamic token = await TokenManage().getToken();
    // print(token);

    http.Response response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Bearer ${await TokenManage().getToken()}'});
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data : ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      required bool withToken}) async {
    Map<String, String>? headers = {};
    if (withToken == true) {
      dynamic token = await TokenManage().getToken();
      print(token);
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    dynamic data = jsonDecode(response.body);
    print('Response Body: $data');
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(jsonDecode(response.body));
      print(response.statusCode);
      return jsonDecode(response.body);
    } else {
      throw data['message'];
    }
  }
}
