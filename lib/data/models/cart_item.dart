import 'dart:convert';

class CartItem {
  final int id;
  final int user;
  final int item;
  final String status;
  final String device;
  final int quantity;
  final String created_at;
  final String updated_at;
  CartItem({
    required this.id,
    required this.user,
    required this.item,
    required this.status,
    required this.device,
    required this.quantity,
    required this.created_at,
    required this.updated_at,
  });

  CartItem copyWith({
    int? id,
    int? user,
    int? item,
    String? status,
    String? device,
    int? quantity,
    String? created_at,
    String? updated_at,
  }) {
    return CartItem(
      id: id ?? this.id,
      user: user ?? this.user,
      item: item ?? this.item,
      status: status ?? this.status,
      device: device ?? this.device,
      quantity: quantity ?? this.quantity,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user,
      'item': item,
      'status': status,
      'device': device,
      'quantity': quantity,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id']?.toInt() ?? 0,
      user: map['user']?.toInt() ?? 0,
      item: map['item']?.toInt() ?? 0,
      status: map['status'] ?? '',
      device: map['device'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartItem(id: $id, user: $user, item: $item, status: $status, device: $device, quantity: $quantity, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItem &&
        other.id == id &&
        other.user == user &&
        other.item == item &&
        other.status == status &&
        other.device == device &&
        other.quantity == quantity &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user.hashCode ^
        item.hashCode ^
        status.hashCode ^
        device.hashCode ^
        quantity.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
