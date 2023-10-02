class jsonmodel {
  int id;
  String category;
  List quotes;

  jsonmodel({required this.id, required this.category, required this.quotes});

  factory jsonmodel.json({required Map data}) {
    return jsonmodel(
        id: data['id'], category: data['category'], quotes: data['quotes']);
  }
}
