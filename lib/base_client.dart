import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_rest_api/model/Farmer.dart';

class BaseClient {
  var client = http.Client();
  // final baseUrl = 'https://jsonplaceholder.typicode.com/';
  final baseUrl =
      'https://f697-2c0f-eb68-223-a700-928e-ba7f-e834-6dee.eu.ngrok.io/api/';

  Future<List<Farmer>> get(String api) async {
    final url = Uri.parse(baseUrl + api);
    var headers = {'Content-Type': 'application/json'};

    final response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      var json = response.body;
      return farmerFromJson(json);
    } else {
      debugPrint('Error occurred while making request');
      return [];
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    final url = Uri.parse(baseUrl + api);
    var payload = json.encode(object);
    var headers = {'Content-Type': 'application/json'};
    var response = await client.post(
      url,
      headers: headers,
      body: payload,
    );

    var responseCode = response.statusCode.toString();
    if (response.statusCode == 201) {
      return response.body;
    } else {
      debugPrint("Error Making request $responseCode");
      return responseCode;
    }
  }

  Future<dynamic> put(String api, dynamic object) async {
    final url = Uri.parse(baseUrl + api);
    var payload = json.encode(object);
    var headers = {'Content-Type': 'application/json'};
    var response = await client.put(
      url,
      headers: headers,
      body: payload,
    );

    var responseCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      debugPrint("Successfully udated");
      return response.body;
    } else {
      debugPrint("Error Making request $responseCode");
    }
  }

  Future<dynamic> del(String api) async {
    final url = Uri.parse(baseUrl + api);
    var headers = {'Content-Type': 'application/json'};
    var response = await client.delete(
      url,
      headers: headers,
    );

    var responseCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      debugPrint("Deleted successfully");
      return response.body;
    } else {
      debugPrint("Error Making request $responseCode");
    }
  }
}
