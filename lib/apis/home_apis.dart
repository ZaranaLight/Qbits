import 'package:qbits/apis/models/device_library_response_model.dart';
import 'package:qbits/qbits.dart';

class HomeApis {
 static Future<PowerStationResponseModel?> getPowerAttachInformationAPI() async {
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

      if (response.code == 0 && response.data != null) {
        return PowerStationResponseModel.fromJson(response.data);
      } else {
        showCatchToast(response.msg, null);
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
        addMD5: true,isToken: true,
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

      if (response.code == 0 && response.data != null) {
        return DeviceLibraryResponseModel.fromJson(response.data);

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
