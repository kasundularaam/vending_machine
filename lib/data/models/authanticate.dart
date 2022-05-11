import 'dart:convert';

class Authenticate {
  final int id;
  final int device;
  final String image;
  Authenticate({
    required this.id,
    required this.device,
    required this.image,
  });

  Authenticate copyWith({
    int? id,
    int? device,
    String? image,
  }) {
    return Authenticate(
      id: id ?? this.id,
      device: device ?? this.device,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'device': device,
      'image': image,
    };
  }

  factory Authenticate.fromMap(Map<String, dynamic> map) {
    return Authenticate(
      id: map['id']?.toInt() ?? 0,
      device: map['device']?.toInt() ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Authenticate.fromJson(String source) =>
      Authenticate.fromMap(json.decode(source));

  @override
  String toString() => 'Authenticate(id: $id, device: $device, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Authenticate &&
        other.id == id &&
        other.device == device &&
        other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ device.hashCode ^ image.hashCode;
}
