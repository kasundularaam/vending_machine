import 'dart:io';

class NewVMUserImages {
  final int user;
  final File image1;
  final File image2;
  final File image3;
  NewVMUserImages({
    required this.user,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  NewVMUserImages copyWith({
    int? user,
    File? image1,
    File? image2,
    File? image3,
  }) {
    return NewVMUserImages(
      user: user ?? this.user,
      image1: image1 ?? this.image1,
      image2: image2 ?? this.image2,
      image3: image3 ?? this.image3,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'image1': image1,
      'image2': image2,
      'image3': image3,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewVMUserImages &&
        other.user == user &&
        other.image1 == image1 &&
        other.image2 == image2 &&
        other.image3 == image3;
  }

  @override
  int get hashCode {
    return user.hashCode ^ image1.hashCode ^ image2.hashCode ^ image3.hashCode;
  }
}
