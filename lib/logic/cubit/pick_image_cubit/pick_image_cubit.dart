import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vending_machine/data/repositories/take_images.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit() : super(PickImageInitial());

  Future<void> pickImage() async {
    try {
      File file = await TakeImages.takeImage();
      emit(PickImagePicked(file: file));
    } catch (e) {
      emit(PickImageFailed(errorMsg: e.toString()));
    }
  }
}
