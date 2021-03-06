part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginAdmin extends LoginState {}

class LoginUser extends LoginState {
  final VMUser vmUser;
  LoginUser({
    required this.vmUser,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginUser && other.vmUser == vmUser;
  }

  @override
  int get hashCode => vmUser.hashCode;

  @override
  String toString() => 'LoginUser(vmUser: $vmUser)';
}

class LoginToMachine extends LoginState {
  final VMUser vmUser;
  final String deviceId;
  LoginToMachine({
    required this.vmUser,
    required this.deviceId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginToMachine &&
        other.vmUser == vmUser &&
        other.deviceId == deviceId;
  }

  @override
  int get hashCode => vmUser.hashCode ^ deviceId.hashCode;

  @override
  String toString() => 'LoginToMachine(vmUser: $vmUser, deviceId: $deviceId)';
}

class LoginFailed extends LoginState {
  final String errorMsg;
  LoginFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'LoginFailed(errorMsg: $errorMsg)';
}
