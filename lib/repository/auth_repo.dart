import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvmexample/res/app_url.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';

class AuthRepository {
  final BaseApiResponse _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic responseJson =
          await _apiServices.getPOSTApiResponse(AppUrls.loginUrl, data);
      return responseJson;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic responseJson =
          await _apiServices.getPOSTApiResponse(AppUrls.registerUrl, data);
      return responseJson;
    } catch (e) {
      throw e;
    }
  }
}
