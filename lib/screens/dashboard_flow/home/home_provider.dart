import 'package:map_location_picker/map_location_picker.dart';
import 'package:qbits/apis/home_apis.dart';
import 'package:qbits/common/global_data.dart';
import 'package:qbits/screens/dashboard_flow/home/model/device_library_response_model.dart';
import 'package:qbits/qbits.dart';
import 'package:qbits/service/location_service.dart';

class HomeProvider extends ChangeNotifier {
  bool loader = false;

  PowerStationResponseModel? powerStationResponseModel;
  DeviceLibraryResponseModel? deviceLibraryResponseModel;

  HomeProvider() {
    init();
  }

  Future<void> init({bool showLoader = true}) async {
    if (showLoader) {
      loader = true;
      notifyListeners();
    }
    await Future.wait([
      powerStationInformationAPI(),
      getDeviceLibraryAPI(),
      getCurrentLocation(),
    ]);

    loader = false;
    notifyListeners(); // Single notification when done
  }

  Future<void> getCurrentLocation() async {
    final locationService = GetLocationService();
    Position? position = await locationService.getCurrentLocation();
    GlobalData.longitude = position?.longitude ?? 0.0;
    GlobalData.latitude = position?.latitude ?? 0.0;
  }

  Future<void> powerStationInformationAPI() async {
    final result = await HomeApis.getPowerAttachInformationAPI();
    if (result != null) {
      powerStationResponseModel = result;
    }
  }

  Future<void> getDeviceLibraryAPI() async {
    final result = await HomeApis.getDeviceLibraryAPI();
    if (result != null) {
      deviceLibraryResponseModel = result;
    }
  }

  /// Current Production Percentage Calculation
  String get currentProductionPercentage {
    final double power = powerStationResponseModel?.power ?? 0.0;
    final double capacity = powerStationResponseModel?.capacity ?? 1.0;
    final double percent = (power / capacity) * 100;
    return '${percent.toStringAsFixed(2)}%';
  }
}
