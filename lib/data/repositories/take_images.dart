import 'dart:io';
import 'package:image_picker/image_picker.dart';

class TakeImages {
  static Future<File> takeImage({required String fileName}) async {
    try {
      ImagePicker picker = ImagePicker();
      XFile? xImage = await picker.pickImage(
          source: ImageSource.camera,
          preferredCameraDevice: CameraDevice.front);
      if (xImage != null) {
        File image = File(xImage.path);
        // var path = image.path;
        // var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
        // var newPath = path.substring(0, lastSeparator + 1) + fileName;
        // await image.rename(newPath);
        return image;
      } else {
        throw "No image captured";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
