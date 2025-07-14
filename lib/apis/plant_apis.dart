import 'package:qbits/qbits.dart';

class PlantApis {
  static Future<AppResponse<PlanListResponseModel>?> getPlantListAPI({
    String? page,
    String? pageSize,
  }) async {
    try {
      final response = await ApiService.getApi(
        url: EndPoints.getPlantListAPI,
        addMD5: true,
        isToken: true,
        queryParams: {
          "date": DateTime.now().toYyyyMm,
          "page": page,
          "pageSize": pageSize,
        },
      );

      if (response == null) {
        showCatchToast('No response from server', null);
        return null;
      }

      final model = appResponseFromJson<PlanListResponseModel>(
        response.body,
        converter: PlanListResponseModel.fromJson,
      );

      if (model != null && model.code == 0) {
        return model;
      } else {
        showCatchToast(model?.msg ?? "Something Went Wrong", null);
        return null;
      }
    } catch (exception, stack) {
      showCatchToast(exception, stack);
      return null;
    }
  }

  static Future<dynamic> addPlantAPI({
    String? plantName,
    String? city,
    String? longitude,
    String? latitude,
    String? stationType,
    String? capacity,
    String? batteryCapacity,
  }) async {
    try {
      final response = await ApiService.getApi(
        url: EndPoints.addPlantAPI,

        queryParams: {
          "userName": userData?.userName,
          "password": userData?.password,
          "plantName": plantName,
          "city": city,
          "longitude": longitude,
          "latitude": latitude,
          "stationtype": stationType,
          "capacity": capacity,
          "batterycapacity": batteryCapacity,
        },
      );

      if (response == null) {
        showCatchToast('No response from server', null);
        return null;
      }

      print("Res: ${response.body}");
      // if (response.code == 0 && response.d != null) {
      //   return response.list
      //       ?.map((e) => PlanListResponseModel.fromJson(e))
      //       .toList();
      // } else {
      //   showCatchToast(response.msg, null);
      //   return null;
      // }
    } catch (exception, stack) {
      showCatchToast(exception, stack);
      return null;
    }
  }
}
