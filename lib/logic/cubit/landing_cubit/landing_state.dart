part of 'landing_cubit.dart';

@immutable
abstract class LandingState {}

class LandingInitial extends LandingState {}

class LandingLoading extends LandingState {}

class LandingToAuth extends LandingState {}

class LandingToScanner extends LandingState {
  final VMUser vmUser;
  LandingToScanner({
    required this.vmUser,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LandingToScanner && other.vmUser == vmUser;
  }

  @override
  int get hashCode => vmUser.hashCode;

  @override
  String toString() => 'LandingToScanner(vmUser: $vmUser)';
}

class LandingFailed extends LandingState {
  final String errorMsg;
  LandingFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LandingFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'LandingFailed(errorMsg: $errorMsg)';
}
