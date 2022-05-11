import 'dart:convert';

class Product {
  final int id;
  final String title;
  final int category;
  final String device;
  final String lockerId;
  final int qty;
  final String price;
  final String created_at;
  final String updated_at;
  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.device,
    required this.lockerId,
    required this.qty,
    required this.price,
    required this.created_at,
    required this.updated_at,
  });

  Product copyWith({
    int? id,
    String? title,
    int? category,
    String? device,
    String? lockerId,
    int? qty,
    String? price,
    String? created_at,
    String? updated_at,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      device: device ?? this.device,
      lockerId: lockerId ?? this.lockerId,
      qty: qty ?? this.qty,
      price: price ?? this.price,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'device': device,
      'lockerId': lockerId,
      'qty': qty,
      'price': price,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      category: map['category']?.toInt() ?? 0,
      device: map['device'] ?? '',
      lockerId: map['lockerId'] ?? '',
      qty: map['qty']?.toInt() ?? 0,
      price: map['price'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, title: $title, category: $category, device: $device, lockerId: $lockerId, qty: $qty, price: $price, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.title == title &&
        other.category == category &&
        other.device == device &&
        other.lockerId == lockerId &&
        other.qty == qty &&
        other.price == price &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        category.hashCode ^
        device.hashCode ^
        lockerId.hashCode ^
        qty.hashCode ^
        price.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
