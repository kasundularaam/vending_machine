part of 'pick_image_cubit.dart';

@immutable
abstract class PickImageState {}

class PickImageInitial extends PickImageState {}

class PickImagePicked extends PickImageState {
  final File file;
  PickImagePicked({
    required this.file,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PickImagePicked && other.file == file;
  }

  @override
  int get hashCode => file.hashCode;

  @override
  String toString() => 'PickImagePicked(file: $file)';
}

class PickImageFailed extends PickImageState {
  final String errorMsg;
  PickImageFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PickImageFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'PickImageFailed(errorMsg: $errorMsg)';
}
