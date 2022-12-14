import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimgenerator/controllers/mim_controller.dart';
import 'package:mimgenerator/views/widget/list_mim.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mimC = Get.put(MimController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Obx(
        () => mimC.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : WidgetlistMim(listMim: mimC.listMim),
      ),
    );
  }
}
