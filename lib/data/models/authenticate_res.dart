import 'dart:convert';

class AuthenticateRes {
  final String status;
  final String id;
  AuthenticateRes({
    required this.status,
    required this.id,
  });

  AuthenticateRes copyWith({
    String? status,
    String? id,
  }) {
    return AuthenticateRes(
      status: status ?? this.status,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'id': id,
    };
  }

  factory AuthenticateRes.fromMap(Map<String, dynamic> map) {
    return AuthenticateRes(
      status: map['status'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticateRes.fromJson(String source) =>
      AuthenticateRes.fromMap(json.decode(source));

  @override
  String toString() => 'AuthenticateRes(status: $status, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthenticateRes && other.status == status && other.id == id;
  }

  @override
  int get hashCode => status.hashCode ^ id.hashCode;
}
