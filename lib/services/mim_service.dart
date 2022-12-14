import 'package:get/get.dart';
import 'package:mimgenerator/models/mim_model.dart';

class MimService extends GetConnect {
  Future<List<MimModel?>?> getListMim() async {
    try {
      Response? json = await get("https://api.imgflip.com/get_memes");
      List<MimModel?>? response = [];
      if (json.statusCode == 200) {
        var rawData = json.body['data']['memes'];

        rawData.forEach((element) {
          response.add(MimModel.fromJson(element));
        });
      }

      return response;
    } catch (e) {
      throw (e);
    }
  }
}
