part of 'register_images_cubit.dart';

@immutable
abstract class RegisterImagesState {}

class RegisterImagesInitial extends RegisterImagesState {}

class RegisterImagesLoading extends RegisterImagesState {}

class RegisterImagesUser extends RegisterImagesState {
  final VMUserImages vmUserImages;
  final VMUser vmUser;
  RegisterImagesUser({
    required this.vmUserImages,
    required this.vmUser,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterImagesUser &&
        other.vmUserImages == vmUserImages &&
        other.vmUser == vmUser;
  }

  @override
  int get hashCode => vmUserImages.hashCode ^ vmUser.hashCode;

  @override
  String toString() =>
      'RegisterImagesUser(vmUserImages: $vmUserImages, vmUser: $vmUser)';
}

class RegisterImagesMachine extends RegisterImagesState {
  final VMUserImages vmUserImages;
  final VMUser vmUser;
  final String deviceId;
  RegisterImagesMachine({
    required this.vmUserImages,
    required this.vmUser,
    required this.deviceId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterImagesMachine &&
        other.vmUserImages == vmUserImages &&
        other.vmUser == vmUser &&
        other.deviceId == deviceId;
  }

  @override
  int get hashCode =>
      vmUserImages.hashCode ^ vmUser.hashCode ^ deviceId.hashCode;

  @override
  String toString() =>
      'RegisterImagesMachine(vmUserImages: $vmUserImages, vmUser: $vmUser, deviceId: $deviceId)';
}

class RegisterImagesFailed extends RegisterImagesState {
  final String errorMsg;
  RegisterImagesFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterImagesFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'RegisterImagesFailed(errorMsg: $errorMsg)';
}
