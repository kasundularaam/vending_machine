import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:meta/meta.dart';

import '../../../data/http/product_services.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(ScannerInitial());

  Future scanQRcode() async {
    try {
      emit(ScannerScanning());
      String deviceId = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      final bool deviceOk = await ProductServices.deviceOk(deviceId: deviceId);
      if (deviceOk) {
        emit(ScannerSucceed(deviceId: deviceId));
      }
    } on PlatformException {
      emit(ScannerFailed(errorMsg: "Failed to get platform version."));
    } catch (e) {
      emit(ScannerFailed(errorMsg: e.toString()));
    }
  }
}
