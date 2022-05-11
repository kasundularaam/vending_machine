part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucceed extends LoginState {
  final VMUser vmUser;
  LoginSucceed({
    required this.vmUser,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginSucceed && other.vmUser == vmUser;
  }

  @override
  int get hashCode => vmUser.hashCode;

  @override
  String toString() => 'LoginSucceed(vmUser: $vmUser)';
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
