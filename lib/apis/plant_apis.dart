import 'package:qbits/apis/models/plant_list_response_model.dart';
import 'package:qbits/qbits.dart';

class PlantApis {
  static Future<dynamic> getPlantListAPI({
    String? page,
    String? pageSize,
  }) async {
    try {
      final response = await ApiService.getApi2(
        url: EndPoints.getPlantListAPI,addMD5: true,isPagination: true,isToken: true,
        queryParams: {
          "date": DateTime.now().toYyyyMm,
          "page": "0",
          "pageSize": "20",
        },
      );

      if (response == null) {
        showCatchToast('No response from server', null);
        return null;
      }

      if (response.code == 0 && response.data != null) {
        return PlantListResponseModelClass.fromJson(response.data);
      } else {
        showCatchToast(response.msg, null);
        return null;
      }
    } catch (exception, stack) {
      showCatchToast(exception, stack);
      return null;
    }
  }
}
