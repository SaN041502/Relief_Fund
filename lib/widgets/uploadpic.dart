import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:relief_fund/widgets/colors.dart';

class Uploadpic extends StatefulWidget {
  const Uploadpic({super.key});

  @override
  State<Uploadpic> createState() => _UploadpicState();
}

class _UploadpicState extends State<Uploadpic> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: imageFileList!.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.file(
                  File(imageFileList![index].path),
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
            onPressed: selectImages,
            icon: Icon(Icons.add, color: AppColors.backgroundColor),
            label: Text(
              'Upload Image',
              style: TextStyle(color: AppColors.backgroundColor),
            ),
          ),
        ),
      ],
    );
  }
}
