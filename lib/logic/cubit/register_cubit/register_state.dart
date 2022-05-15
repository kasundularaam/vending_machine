part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSucceed extends RegisterState {
  final VMUser vmUser;
  RegisterSucceed({
    required this.vmUser,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterSucceed && other.vmUser == vmUser;
  }

  @override
  int get hashCode => vmUser.hashCode;

  @override
  String toString() => 'RegisterSucceed(vmUser: $vmUser)';
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
