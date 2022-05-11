import 'dart:convert';

class NewVMUser {
  final String name;
  final String email;
  final String logedDevice;
  final String dob;
  final String balance;
  final String password;
  NewVMUser({
    required this.name,
    required this.email,
    required this.logedDevice,
    required this.dob,
    required this.balance,
    required this.password,
  });

  NewVMUser copyWith({
    String? name,
    String? email,
    String? logedDevice,
    String? dob,
    String? balance,
    String? password,
  }) {
    return NewVMUser(
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

  factory NewVMUser.fromMap(Map<String, dynamic> map) {
    return NewVMUser(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      logedDevice: map['logedDevice'] ?? '',
      dob: map['dob'] ?? '',
      balance: map['balance'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewVMUser.fromJson(String source) =>
      NewVMUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewVMUser(name: $name, email: $email, logedDevice: $logedDevice, dob: $dob, balance: $balance, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewVMUser &&
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
