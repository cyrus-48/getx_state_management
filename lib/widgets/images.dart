import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../controllers/upload_images.dart';
import 'package:get/get.dart';
import 'dart:io';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Uploader'),
      ),
      body: Obx(() => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: controller.images.length,
          itemBuilder: (context, index) => Image.file(controller.images[index]))),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: true);

          if (result != null) {
            List<File> files = result.paths.map((path) => File(path!)).toList();
            controller.addImages(files);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

