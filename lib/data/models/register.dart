import 'dart:convert';

class Register {
  final String name;
  final String email;
  final String logedDevice;
  final String dob;
  final int balance;
  final String password;
  Register({
    required this.name,
    required this.email,
    required this.logedDevice,
    required this.dob,
    required this.balance,
    required this.password,
  });

  Register copyWith({
    String? name,
    String? email,
    String? logedDevice,
    String? dob,
    int? balance,
    String? password,
  }) {
    return Register(
      name: name ?? this.name,
      email: email ?? this.email,
      logedDevice: logedDevice ?? this.logedDevice,
      dob: dob ?? this.dob,
      balance: balance ?? this.balance,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'logedDevice': logedDevice,
      'dob': dob,
      'balance': balance,
      'password': password,
    };
  }

  factory Register.fromMap(Map<String, dynamic> map) {
    return Register(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      logedDevice: map['logedDevice'] ?? '',
      dob: map['dob'] ?? '',
      balance: map['balance']?.toInt() ?? 0,
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Register.fromJson(String source) =>
      Register.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Register(name: $name, email: $email, logedDevice: $logedDevice, dob: $dob, balance: $balance, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Register &&
        other.name == name &&
        other.email == email &&
        other.logedDevice == logedDevice &&
        other.dob == dob &&
        other.balance == balance &&
        other.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        logedDevice.hashCode ^
        dob.hashCode ^
        balance.hashCode ^
        password.hashCode;
  }
}
