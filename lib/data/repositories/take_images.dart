import 'dart:io';

import 'package:image_picker/image_picker.dart';

class TakeImages {
  static final ImagePicker picker = ImagePicker();
  static Future<File> takeImage() async {
    try {
      XFile? xImage = await picker.pickImage(
          source: ImageSource.camera,
          preferredCameraDevice: CameraDevice.front);
      if (xImage != null) {
        File image = File(xImage.path);
        return image;
      } else {
        throw "No image captured";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
