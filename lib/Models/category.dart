import 'dart:typed_data';

class category {
  int? id;
  String name;
  Uint8List image;

  category({required this.name, required this.image, this.id});

  factory category.sql({required Map data}) {
    return category(name: data['name'], image: data['image'], id: data['id']);
  }
}
