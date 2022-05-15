part of 'face_id_auth_cubit.dart';

@immutable
abstract class FaceIdAuthState {}

class FaceIdAuthInitial extends FaceIdAuthState {}

class FaceIdAuthLoading extends FaceIdAuthState {}

class FaceIdAuthForUser extends FaceIdAuthState {
  final VMUser vmUser;
  FaceIdAuthForUser({
    required this.vmUser,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FaceIdAuthForUser && other.vmUser == vmUser;
  }

  @override
  int get hashCode => vmUser.hashCode;

  @override
  String toString() => 'FaceIdAuthForUser(vmUser: $vmUser)';
}

class FaceIdAuthForMachine extends FaceIdAuthState {
  final String deviceId;
  final VMUser vmUser;
  FaceIdAuthForMachine({
    required this.deviceId,
    required this.vmUser,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FaceIdAuthForMachine &&
        other.deviceId == deviceId &&
        other.vmUser == vmUser;
  }

  @override
  int get hashCode => deviceId.hashCode ^ vmUser.hashCode;

  @override
  String toString() =>
      'FaceIdAuthForMachine(deviceId: $deviceId, vmUser: $vmUser)';
}

class FaceIdAuthFailed extends FaceIdAuthState {
  final String errorMsg;
  FaceIdAuthFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FaceIdAuthFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'FaceIdAuthFailed(errorMsg: $errorMsg)';
}
