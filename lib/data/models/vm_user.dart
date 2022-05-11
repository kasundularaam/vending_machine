import 'dart:convert';

class VMUser {
  final int id;
  final String name;
  final String email;
  final String logedDevice;
  final String dob;
  final String balance;
  final String password;
  final String created_at;
  final String updated_at;
  VMUser({
    required this.id,
    required this.name,
    required this.email,
    required this.logedDevice,
    required this.dob,
    required this.balance,
    required this.password,
    required this.created_at,
    required this.updated_at,
  });

  VMUser copyWith({
    int? id,
    String? name,
    String? email,
    String? logedDevice,
    String? dob,
    String? balance,
    String? password,
    String? created_at,
    String? updated_at,
  }) {
    return VMUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      logedDevice: logedDevice ?? this.logedDevice,
      dob: dob ?? this.dob,
      balance: balance ?? this.balance,
      password: password ?? this.password,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'logedDevice': logedDevice,
      'dob': dob,
      'balance': balance,
      'password': password,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory VMUser.fromMap(Map<String, dynamic> map) {
    return VMUser(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      logedDevice: map['logedDevice'] ?? '',
      dob: map['dob'] ?? '',
      balance: map['balance'] ?? '',
      password: map['password'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VMUser.fromJson(String source) => VMUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VMUser(id: $id, name: $name, email: $email, logedDevice: $logedDevice, dob: $dob, balance: $balance, password: $password, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VMUser &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.logedDevice == logedDevice &&
        other.dob == dob &&
        other.balance == balance &&
        other.password == password &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        logedDevice.hashCode ^
        dob.hashCode ^
        balance.hashCode ^
        password.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
