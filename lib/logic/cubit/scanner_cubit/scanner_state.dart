part of 'scanner_cubit.dart';

@immutable
abstract class ScannerState {}

class ScannerInitial extends ScannerState {}

class ScannerSucceed extends ScannerState {
  final String deviceId;
  ScannerSucceed({
    required this.deviceId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScannerSucceed && other.deviceId == deviceId;
  }

  @override
  int get hashCode => deviceId.hashCode;

  @override
  String toString() => 'ScannerSucceed(deviceId: $deviceId)';
}
