import 'dart:io';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class TakeImages {
  static Future<File> takeImage({required String fileName}) async {
    try {
      ImagePicker picker = ImagePicker();
      XFile? xImage = await picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
      );
      if (xImage != null) {
        File image = File(xImage.path);
        String dir = (await getApplicationDocumentsDirectory()).path;
        String newPath = path.join(dir, '$fileName.jpeg');
        File newImage = await File(image.path).copy(newPath);
        File rotatedImg =
            await FlutterExifRotation.rotateImage(path: newImage.path);
        return rotatedImg;
      } else {
        throw "No image captured";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
