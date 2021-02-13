// HERE WE USE RIVERPOD TO MANAGE THE STATE OF THE API

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_fetchapi/model/photo_model.dart';
import 'package:riverpod_fetchapi/network/fetch_api.dart';

final photoStateFuture = FutureProvider<List<PhotoModel>>((ref) async {
  return fetchPhotos();
});
