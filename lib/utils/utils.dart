import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<String> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      return image?.path ?? '';
    } catch (e) {
      print(e);
      return '';
    }
  }

  static Future<CroppedFile?> cropImage(String path) async {
    final result = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    return result;
  }
}
