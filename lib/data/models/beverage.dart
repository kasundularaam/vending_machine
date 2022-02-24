import 'dart:convert';

class Beverage {
  final String name;
  final String image;
  final int price;
  final String description;
  Beverage({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  Beverage copyWith({
    String? name,
    String? image,
    int? price,
    String? description,
  }) {
    return Beverage(
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'description': description,
    };
  }

  factory Beverage.fromMap(Map<String, dynamic> map) {
    return Beverage(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: map['price']?.toInt() ?? 0,
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Beverage.fromJson(String source) =>
      Beverage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Beverage(name: $name, image: $image, price: $price, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Beverage &&
        other.name == name &&
        other.image == image &&
        other.price == price &&
        other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        price.hashCode ^
        description.hashCode;
  }
}
