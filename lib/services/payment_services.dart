import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/constant.dart';

class PaymentServices {
  static Future<http.Response> getData({required String url, Map<String, String>? query}) async {
    final Uri uri = Uri.parse(ApiContest.baseUrl + url);
    final response = await http.get(uri, headers: query);
    return response;
  }

  static Future<http.Response> postData({
    required String url,
    required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    final Uri uri = Uri.parse(ApiContest.baseUrl + url);
    final response = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
      },

    );
    return response;
  }
}
