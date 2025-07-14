import 'package:qbits/screens/dashboard_flow/home/model/device_library_response_model.dart';
import 'package:qbits/qbits.dart';

class HomeApis {
  static Future<PowerStationResponseModel?>
  getPowerAttachInformationAPI() async {
    try {
      final response = await ApiService.getApi(
        url: EndPoints.getPowerAttachInformationAPI,
        queryParams: {
          "date": DateTime.now().toYyyyMm,
          "atun": userData?.userName,
          "atpd": userData?.password,
        },
      );

      if (response == null) {
        showCatchToast('No response from server', null);
        return null;
      }

      final model = appResponseFromJson<PowerStationResponseModel>(
        response.body,
        converter: PowerStationResponseModel.fromJson,
      );

      if (model != null && model.code == 0) {
        return model.data;
      } else {
        showCatchToast(model?.msg ?? "Something Went Wrong", null);
        return null;
      }
    } catch (exception, stack) {
      showCatchToast(exception, stack);
      return null;
    }
  }

  static Future<DeviceLibraryResponseModel?> getDeviceLibraryAPI() async {
    try {
      final response = await ApiService.getApi(
        url: EndPoints.getDeviceLibraryAPI,
        addMD5: true,
        isToken: true,
        queryParams: {
          "date": DateTime.now().toYyyyMm,
          "atun": userData?.userName,
          "atpd": userData?.password,
        },
      );

      if (response == null) {
        showCatchToast('No response from server', null);
        return null;
      }

      final model = appResponseFromJson<DeviceLibraryResponseModel>(
        response.body,
        converter: DeviceLibraryResponseModel.fromJson,
      );

      if (model != null && model.code == 0) {
        return model.data;
      } else {
        showCatchToast(model?.msg ?? "Something Went Wrong", null);
        return null;
      }
    } catch (exception, stack) {
      showCatchToast(exception, stack);
      return null;
    }
  }
}
