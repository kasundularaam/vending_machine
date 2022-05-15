import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/http/user_services.dart';
import '../../../data/models/authenticate_res.dart';
import '../../../data/models/vm_user.dart';
import '../../../data/shared/shared_services.dart';

part 'face_id_auth_state.dart';

class FaceIdAuthCubit extends Cubit<FaceIdAuthState> {
  FaceIdAuthCubit() : super(FaceIdAuthInitial());

  Future authenticateUser({required File image}) async {
    try {
      emit(FaceIdAuthLoading());
      final AuthenticateRes authenticateRes =
          await UserServices.authenticate(image: image);

      if (authenticateRes.id != "Unknown") {
        int authId = int.parse(authenticateRes.id.split("_")[0]);

        final VMUser vmUser = await UserServices.getVMUser(uid: authId);

        final String userType = await SharedServices.getUserType();
        if (userType == "user") {
          await SharedServices.addUser(uid: vmUser.id);
          emit(FaceIdAuthForUser(vmUser: vmUser));
        } else {
          final String deviceId = await SharedServices.getDeviceId();
          emit(FaceIdAuthForMachine(vmUser: vmUser, deviceId: deviceId));
        }
      } else {
        emit(FaceIdAuthFailed(
            errorMsg: "Authenticate failed please try again."));
      }
    } catch (e) {
      emit(FaceIdAuthFailed(errorMsg: e.toString()));
    }
  }

  tryAgain() => emit(FaceIdAuthInitial());
}
