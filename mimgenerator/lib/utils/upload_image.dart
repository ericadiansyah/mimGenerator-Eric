import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mimgenerator/utils/bottom_sheet.dart';

openImagePicker(
  BuildContext context,
  Function onImageSelected,
  bool type,
) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DefaultBottomSheet(
          ctx: context,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              // mainAxisSize:FontSize.sMainAxisSize.min,
              children: <Widget>[
                Text(
                  'PILIH FOTO',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    getImage(
                        context, ImageSource.camera, onImageSelected, type);
                  },
                  child: Container(
                    color: Colors.white,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Icon(Icons.camera_alt, color: Colors.black),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Kamera',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getImage(
                        context, ImageSource.gallery, onImageSelected, type);
                  },
                  child: Container(
                    color: Colors.white,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Icon(Icons.image, color: Colors.black),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Galeri',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

getImage(
  BuildContext context,
  ImageSource source,
  Function onImageSelected,
  bool type,
) async {
  final ImagePicker _picker = ImagePicker();
  _picker
      .pickImage(source: source, imageQuality: 20)
      .then((XFile? fileRaw) async {
    File file = File(fileRaw!.path);
    ImageCropper cropper = ImageCropper();
    var filee = await cropper.cropImage(
        sourcePath: file.path,
        aspectRatio: type
            ? CropAspectRatio(ratioX: 1, ratioY: 1)
            : CropAspectRatio(ratioX: 16, ratioY: 9));
    if (filee == null) {
      return;
    }
    onImageSelected(filee);
  });
}
