import 'package:catweb/network/client/image_loader.dart';
import 'package:dio/dio.dart';

Future<void> main() async {
  final dio = Dio();

  final imageLoader = ImageConcurrency(dio: dio, concurrency: 2);

  imageLoader.create(ImageModel(url: 'first'));
  imageLoader.create(ImageModel(url: 'first'));
  imageLoader.create(ImageModel(url: 'first'));
  imageLoader.create(ImageModel(url: 'first'));

  imageLoader.create(ImageModel(url: 'foo'));
  imageLoader.create(ImageModel(url: 'bar'));

  imageLoader.create(ImageModel(url: 'second'));
  imageLoader.create(ImageModel(url: 'second'));
  final data3 = imageLoader.create(ImageModel(url: 'second'));

  print(data3.handleCount);
  data3.dispose();
  print(data3.handleCount);
  data3.dispose();
  data3.dispose();
  print(data3.handleCount);

  await Future.delayed(const Duration(seconds: 15));
  print('second');
  imageLoader.create(ImageModel(url: 'second'));

  await Future.delayed(const Duration(seconds: 60));
}
