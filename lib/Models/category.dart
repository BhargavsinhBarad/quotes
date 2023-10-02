import 'dart:typed_data';

class category {
  int? id;
  String name;
  String image;

  category({required this.name, required this.image, required this.id});

  factory category.sql({required Map data}) {
    return category(name: data['name'], image: data['image'], id: data['id']);
  }
}
