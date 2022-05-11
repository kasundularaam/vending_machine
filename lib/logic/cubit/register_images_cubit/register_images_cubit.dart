import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vending_machine/data/models/new_vm_user_images.dart';
import 'package:vending_machine/data/repositories/repository.dart';

import '../../../data/models/vm_user_images.dart';

part 'register_images_state.dart';

class RegisterImagesCubit extends Cubit<RegisterImagesState> {
  RegisterImagesCubit() : super(RegisterImagesInitial());

  Future registerImages({required NewVMUserImages newVMUserImages}) async {
    try {
      emit(RegisterImagesLoading());
      final VMUserImages vmUserImages =
          await Repository.addVMUserImages(newVMUserImages: newVMUserImages);
      emit(RegisterImagesSucceed(vmUserImages: vmUserImages));
    } catch (e) {
      emit(RegisterImagesFailed(errorMsg: e.toString()));
    }
  }
}
