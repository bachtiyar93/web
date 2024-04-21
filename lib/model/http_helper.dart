import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Connect {
  ///This Function for CRUD
  Future<http.Response> getAPI({required String uri, headers}) async {
    if(kDebugMode){
      log(uri);
      log(jsonEncode(headers));
    }

    final http.Response response =
    await http.get(Uri.parse(uri), headers: headers);
    if(kDebugMode) {
      log(response.statusCode.toString());
      log(response.body);
    }
    return response;
  }

  Future<http.Response> postAPI(
      {required String uri, required postParams, headers}) async {
    if(kDebugMode){
      log(uri);
      log(jsonEncode(headers));
      log(jsonEncode(postParams));
    }

    final http.Response response =
    await http.post(Uri.parse(uri), body: postParams, headers: headers);
    if(kDebugMode) {
      log(response.statusCode.toString());
      log(response.body);
    }
    return response;
  }

  Future<http.Response> putAPI(
      {required String uri, required postParams, headers}) async {
    if(kDebugMode) {
      log(uri);
      log(jsonEncode(headers));
      log(jsonEncode(postParams));
    }
    final response =
    await http.put(Uri.parse(uri), body: postParams, headers: headers);
    if(kDebugMode) {
      log(response.statusCode.toString());
      log(response.body);
    }
    return response;
  }
}