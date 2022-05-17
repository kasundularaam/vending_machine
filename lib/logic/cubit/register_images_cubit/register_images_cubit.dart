import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/http/user_services.dart';
import '../../../data/models/authenticate_res.dart';
import '../../../data/models/new_vm_user_images.dart';
import '../../../data/models/vm_user.dart';
import '../../../data/models/vm_user_images.dart';
import '../../../data/shared/shared_services.dart';

part 'register_images_state.dart';

class RegisterImagesCubit extends Cubit<RegisterImagesState> {
  RegisterImagesCubit() : super(RegisterImagesInitial());

  Future registerImages(
      {required NewVMUserImages newVMUserImages,
      required VMUser vmUser,
      required File image4}) async {
    try {
      emit(RegisterImagesLoading());
      final String userType = await SharedServices.getUserType();
      String deviceId = "123";
      if (userType != "user") {
        deviceId = await SharedServices.getDeviceId();
      }
      final VMUserImages vmUserImages =
          await UserServices.addVMUserImages(newVMUserImages: newVMUserImages);

      final AuthenticateRes authenticateRes =
          await UserServices.authenticate(image: image4, deviceId: deviceId);

      if (authenticateRes.id != "Unknown") {
        int authId = int.parse(authenticateRes.id.split("_")[0]);

        if (vmUserImages.user == authId) {
          if (userType == "user") {
            await SharedServices.addUser(uid: vmUser.id);
            emit(
                RegisterImagesUser(vmUserImages: vmUserImages, vmUser: vmUser));
          } else {
            emit(RegisterImagesMachine(
                vmUserImages: vmUserImages,
                vmUser: vmUser,
                deviceId: deviceId));
          }
        } else {
          emit(RegisterImagesFailed(
              errorMsg: "Authenticate failed please try again."));
        }
      } else {
        emit(RegisterImagesFailed(
            errorMsg: "Authenticate failed please try again."));
      }
    } catch (e) {
      emit(RegisterImagesFailed(errorMsg: e.toString()));
    }
  }
}
