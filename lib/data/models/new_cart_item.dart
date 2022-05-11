import 'dart:convert';

class NewCartItem {
  final int user;
  final int item;
  final String status;
  final String device;
  final int quantity;
  NewCartItem({
    required this.user,
    required this.item,
    required this.status,
    required this.device,
    required this.quantity,
  });

  NewCartItem copyWith({
    int? user,
    int? item,
    String? status,
    String? device,
    int? quantity,
  }) {
    return NewCartItem(
      user: user ?? this.user,
      item: item ?? this.item,
      status: status ?? this.status,
      device: device ?? this.device,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'item': item,
      'status': status,
      'device': device,
      'quantity': quantity,
    };
  }

  factory NewCartItem.fromMap(Map<String, dynamic> map) {
    return NewCartItem(
      user: map['user']?.toInt() ?? 0,
      item: map['item']?.toInt() ?? 0,
      status: map['status'] ?? '',
      device: map['device'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewCartItem.fromJson(String source) =>
      NewCartItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewCartItem(user: $user, item: $item, status: $status, device: $device, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewCartItem &&
        other.user == user &&
        other.item == item &&
        other.status == status &&
        other.device == device &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        item.hashCode ^
        status.hashCode ^
        device.hashCode ^
        quantity.hashCode;
  }
}
