import 'dart:convert';

class Category {
  final int id;
  final String title;
  final int parent_category_id;
  final String created_at;
  final String updated_at;
  Category({
    required this.id,
    required this.title,
    required this.parent_category_id,
    required this.created_at,
    required this.updated_at,
  });

  Category copyWith({
    int? id,
    String? title,
    int? parent_category_id,
    String? created_at,
    String? updated_at,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      parent_category_id: parent_category_id ?? this.parent_category_id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'parent_category_id': parent_category_id,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      parent_category_id: map['parent_category_id']?.toInt() ?? 0,
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(id: $id, title: $title, parent_category_id: $parent_category_id, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.id == id &&
        other.title == title &&
        other.parent_category_id == parent_category_id &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        parent_category_id.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
