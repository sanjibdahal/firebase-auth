import 'package:image_picker/image_picker.dart';

pickImage() async {
  final ImagePicker _picker = ImagePicker();
  XFile? _file = await _picker.pickImage(source: ImageSource.gallery);
  if (_file != null) {
    return await _file.readAsBytes();
  } else {
    print("Not selected.");
  }
}
