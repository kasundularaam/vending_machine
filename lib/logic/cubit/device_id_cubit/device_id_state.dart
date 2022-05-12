part of 'device_id_cubit.dart';

@immutable
abstract class DeviceIdState {}

class DeviceIdInitial extends DeviceIdState {}

class DeviceIdLoading extends DeviceIdState {}

class DeviceIdSucceed extends DeviceIdState {}

class DeviceIdFailed extends DeviceIdState {
  final String errorMsg;
  DeviceIdFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DeviceIdFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'DeviceIdFailed(errorMsg: $errorMsg)';
}
