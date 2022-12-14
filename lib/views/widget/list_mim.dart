// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:mimgenerator/controllers/mim_controller.dart';
import 'package:mimgenerator/models/mim_model.dart';
import 'package:mimgenerator/views/detail_mim.dart';
import 'package:mimgenerator/views/widget/custom_network_img.dart';

class WidgetlistMim extends StatelessWidget {
  var listMim = <MimModel?>[].obs;

  WidgetlistMim({
    Key? key,
    required this.listMim,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mimC = Get.find<MimController>();

    return listMim.isEmpty
        ? Container(
            alignment: Alignment.center,
            child: Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_V0sqL0iu1s.json',
                height: 200),
          )
        : Obx(
            () => RefreshIndicator(
              onRefresh: () => mimC.getMim(),
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // childAspectRatio: (Get.width / 2) / (Get.height / 2.5),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 16,
                ),
                itemCount: mimC.listMim.length,
                itemBuilder: (context, index) {
                  MimModel data = mimC.listMim[index]!;

                  return InkWell(
                    onTap: () {
                      mimC.detailMim = data;
                      Get.toNamed(DetailMimPage.routeName);
                    },
                    child: customNetworkImage(
                      data.url,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          );
  }
}
