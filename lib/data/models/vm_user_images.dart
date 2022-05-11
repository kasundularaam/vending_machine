import 'dart:convert';

class VMUserImages {
  final int id;
  final int user;
  final String image1;
  final String image2;
  final String image3;
  VMUserImages({
    required this.id,
    required this.user,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  VMUserImages copyWith({
    int? id,
    int? user,
    String? image1,
    String? image2,
    String? image3,
  }) {
    return VMUserImages(
      id: id ?? this.id,
      user: user ?? this.user,
      image1: image1 ?? this.image1,
      image2: image2 ?? this.image2,
      image3: image3 ?? this.image3,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user,
      'image1': image1,
      'image2': image2,
      'image3': image3,
    };
  }

  factory VMUserImages.fromMap(Map<String, dynamic> map) {
    return VMUserImages(
      id: map['id']?.toInt() ?? 0,
      user: map['user']?.toInt() ?? 0,
      image1: map['image1'] ?? '',
      image2: map['image2'] ?? '',
      image3: map['image3'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VMUserImages.fromJson(String source) =>
      VMUserImages.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VMUserImages(id: $id, user: $user, image1: $image1, image2: $image2, image3: $image3)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VMUserImages &&
        other.id == id &&
        other.user == user &&
        other.image1 == image1 &&
        other.image2 == image2 &&
        other.image3 == image3;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user.hashCode ^
        image1.hashCode ^
        image2.hashCode ^
        image3.hashCode;
  }
}
