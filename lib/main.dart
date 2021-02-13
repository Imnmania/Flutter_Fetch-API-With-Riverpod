import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_fetchapi/model/photo_model.dart';
import 'package:riverpod_fetchapi/state/state_manager.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // AsyncValue<List<PhotoModel>> photos = watch(photoStateFuture);
    final photos = watch(photoStateFuture);

    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar Title'),
      ),
      body: photos.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) => Center(
          child: Text("Error"),
        ),
        data: (photos) {
          return ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(photos[index].thumbnailUrl),
                ),
                title: Text(photos[index].title),
              );
            },
          );
        },
      ),
    );
  }
}
