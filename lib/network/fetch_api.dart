import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:riverpod_fetchapi/model/photo_model.dart';
import 'package:http/http.dart' as http;

List<PhotoModel> parsePhotos(String responseBody) {
  var l = json.decode(responseBody) as List<dynamic>;
  List<PhotoModel> photos =
      l.map((model) => PhotoModel.fromJson(model)).toList();
  return photos;
}

Future<List<PhotoModel>> fetchPhotos() async {
  final response = await http
      .get('https://jsonplaceholder.typicode.com/photos')
      .timeout(Duration(seconds: 10));

  if (response.statusCode == 200) {
    print(response.body);
    return compute(parsePhotos, response.body);
  } else {
    throw Exception('Cannot get photos');
  }
}
