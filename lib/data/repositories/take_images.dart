import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class TakeImages {
  static Future<File> takeImage({required String fileName}) async {
    try {
      ImagePicker picker = ImagePicker();
      XFile? xImage = await picker.pickImage(
          source: ImageSource.camera,
          preferredCameraDevice: CameraDevice.front);
      if (xImage != null) {
        File image = File(xImage.path);
        String dir = (await getApplicationDocumentsDirectory()).path;
        String newPath = path.join(dir, '$fileName.jpg');
        File f = await File(image.path).copy(newPath);
        log(f.path);
        return f;
      } else {
        throw "No image captured";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
