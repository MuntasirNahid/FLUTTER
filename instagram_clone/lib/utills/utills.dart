import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(
    source: source,
  );

  if (_file != null) {
    //we are using this approach because File approach is not available for web portion
    return await _file.readAsBytes();
  }
  print('No Image Selected');
}
