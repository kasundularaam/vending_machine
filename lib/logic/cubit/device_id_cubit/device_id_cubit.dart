import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/shared/shared_services.dart';

part 'device_id_state.dart';

class DeviceIdCubit extends Cubit<DeviceIdState> {
  DeviceIdCubit() : super(DeviceIdInitial());

  Future setDeviceId({required String id}) async {
    try {
      emit(DeviceIdLoading());
      if (id.trim().isNotEmpty) {
        await SharedServices.setDeviceId(id: id);
        await SharedServices.addMachine();
      } else {
        emit(DeviceIdFailed(errorMsg: "Device id can not be blank."));
      }
    } catch (e) {
      emit(DeviceIdFailed(errorMsg: e.toString()));
    }
  }
}
