class Item {
  final String id;
  final String name;
  final String descriptions;  // Corrected field name
  final String img;  // Corrected field name

  Item({
    required this.id,
    required this.name,
    required this.descriptions,
    required this.img,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      descriptions: json['desciptions'] ?? '',  // Corrected field name
      img: json['img'] ?? '',  // Corrected field name
    );
  }
}
