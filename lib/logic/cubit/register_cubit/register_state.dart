part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterToMachine extends RegisterState {
  final VMUser vmUser;
  final String deviceId;
  RegisterToMachine({
    required this.vmUser,
    required this.deviceId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterToMachine &&
        other.vmUser == vmUser &&
        other.deviceId == deviceId;
  }

  @override
  int get hashCode => vmUser.hashCode ^ deviceId.hashCode;

  @override
  String toString() =>
      'RegisterToMachine(vmUser: $vmUser, deviceId: $deviceId)';
}

class RegisterUser extends RegisterState {
  final VMUser vmUser;
  RegisterUser({
    required this.vmUser,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterUser && other.vmUser == vmUser;
  }

  @override
  int get hashCode => vmUser.hashCode;

  @override
  String toString() => 'RegisterUser(vmUser: $vmUser)';
}

class RegisterFailed extends RegisterState {
  final String errorMsg;
  RegisterFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'RegisterFailed(errorMsg: $errorMsg)';
}
