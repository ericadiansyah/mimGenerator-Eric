import 'package:get/get.dart';
import 'package:mimgenerator/views/detail_mim.dart';
import 'package:mimgenerator/views/home.dart';

class Routes {
  static final pages = [
    GetPage(
      name: HomePage.routeName,
      page: () => HomePage(),
    ),
    GetPage(
      name: DetailMimPage.routeName,
      page: () => DetailMimPage(),
    ),
  ];
}
