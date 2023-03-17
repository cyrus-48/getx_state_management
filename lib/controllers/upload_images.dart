import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class HomeController extends GetxController {
  List<File> images = [].obs as List<File>;

  Future<void> addImages(List<File> newImages) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String assetsPath = directory.path + '/assets';
    if (!Directory(assetsPath).existsSync()) {
      Directory(assetsPath).createSync(recursive: true);
    }
    for (var image in newImages) {
      String imagePath = assetsPath + '/' + basename(image.path);
      await image.copy(imagePath);
      images.add(File(imagePath));
    }
  }

  void removeImage(int index) {
    images[index].deleteSync();
    images.removeAt(index);
  }
}
