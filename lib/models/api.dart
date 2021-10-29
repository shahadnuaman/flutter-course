// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'Weather.dart';

class FetchAPi {
  Future<Weather> fetchPost() async {
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=014863a949b54bbabaa61529212910&q=baghdad&days=7&aqi=no&alerts=yes');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);

      debugPrint('Response== $responseData');
      debugPrint('Response== ${responseData.runtimeType}');

      return Weather.fromJson(responseData);
    } else {
      throw Exception('Cant get data');
    }
  }
}
