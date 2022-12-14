import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimgenerator/models/mim_model.dart';
import 'package:mimgenerator/services/mim_service.dart';
import 'package:mimgenerator/utils/upload_image.dart';

class MimController extends GetxController {
  TextEditingController? titleC = TextEditingController();

  var listMim = <MimModel?>[].obs;
  MimModel? detailMim;
  File? image;

  var isLoading = false.obs;

  Future<void> getMim() async {
    isLoading.value = true;

    try {
      var response = await MimService().getListMim();

      listMim.value = response!;
      isLoading.value = false;
      update();
    } catch (ex) {
      isLoading.value = false;
    }
  }

  Future<void> uploadImage2(BuildContext context) async {
    openImagePicker(
      context,
      (file) {
        update();

        image = file;
        Get.back();
      },
      true,
    );
  }

  @override
  void onInit() {
    getMim();

    super.onInit();
  }

  @override
  void dispose() {
    titleC!.dispose();

    super.dispose();
  }
}
