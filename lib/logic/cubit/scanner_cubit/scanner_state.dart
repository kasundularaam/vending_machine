part of 'scanner_cubit.dart';

@immutable
abstract class ScannerState {}

class ScannerInitial extends ScannerState {}

class ScannerScanning extends ScannerState {}

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

class ScannerFailed extends ScannerState {
  final String errorMsg;
  ScannerFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScannerFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'ScannerFailed(errorMsg: $errorMsg)';
}
