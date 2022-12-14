import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimgenerator/controllers/mim_controller.dart';
import 'package:mimgenerator/views/widget/custom_network_img.dart';

class DetailMimPage extends StatelessWidget {
  static const routeName = '/detail-mim-page';
  const DetailMimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mimC = Get.find<MimController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Mim Generator'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            height: Get.height / 2,
            width: double.infinity,
            child: Stack(
              children: [
                customNetworkImage(
                  mimC.detailMim!.url!,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: Get.height / 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 16, top: 12, bottom: 12),
                child: ElevatedButton(
                  onPressed: () {
                    mimC.uploadImage2(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.image),
                      SizedBox(width: 5),
                      Text('Add logo',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                      elevation: 0,
                      shape: StadiumBorder(
                          side: BorderSide(width: 1, color: Colors.blue))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16, top: 12, bottom: 12),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.title),
                      SizedBox(width: 5),
                      Text('Add Text',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                      elevation: 0,
                      shape: StadiumBorder(
                          side: BorderSide(width: 1, color: Colors.blue))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
