import 'package:g_house/objects/device.object.dart';

class Product {
  final String name;
  final String imageUrl;
  final List<Device> devices;

  Product({required this.name, required this.imageUrl, required this.devices});
}
