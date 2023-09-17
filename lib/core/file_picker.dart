import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firechat/core/extensions.dart';

pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    File? pickedFile = await result.asFile;
    if (pickedFile != null) {
      // Use the pickedFile as needed
      return pickedFile;
    }
  }
}
