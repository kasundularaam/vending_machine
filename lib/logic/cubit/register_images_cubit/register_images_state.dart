part of 'register_images_cubit.dart';

@immutable
abstract class RegisterImagesState {}

class RegisterImagesInitial extends RegisterImagesState {}

class RegisterImagesLoading extends RegisterImagesState {}

class RegisterImagesSucceed extends RegisterImagesState {
  final VMUserImages vmUserImages;
  RegisterImagesSucceed({
    required this.vmUserImages,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterImagesSucceed && other.vmUserImages == vmUserImages;
  }

  @override
  int get hashCode => vmUserImages.hashCode;

  @override
  String toString() => 'RegisterImagesSucceed(vmUserImages: $vmUserImages)';
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
