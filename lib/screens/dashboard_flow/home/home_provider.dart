import 'package:qbits/apis/home_apis.dart';
import 'package:qbits/screens/dashboard_flow/home/model/device_library_response_model.dart';
import 'package:qbits/qbits.dart';

class HomeProvider extends ChangeNotifier {
  bool loader = false;
  bool capacityLoader = false;
  bool deviceLoader = false;

  PowerStationResponseModel? powerStationResponseModel;
  DeviceLibraryResponseModel? deviceLibraryResponseModel;

  HomeProvider() {
    init();
  }

  Future<void> init() async {
    await powerStationInformationAPI();
    await getDeviceLibraryAPI();

    notifyListeners();
  }

  Future<void> powerStationInformationAPI() async {
    capacityLoader = true;
    notifyListeners();

    final result = await HomeApis.getPowerAttachInformationAPI();

    if (result != null) {
      powerStationResponseModel = result;
    }

    capacityLoader = false;
    notifyListeners();
  }

  Future<void> getDeviceLibraryAPI() async {
    deviceLoader = true;
    notifyListeners();

    final result = await HomeApis.getDeviceLibraryAPI();
    if (result != null) {
      deviceLibraryResponseModel = result;
    }

    deviceLoader = false;
    notifyListeners();
  }

  /// ✅ Current Production Percentage Calculation
  String get currentProductionPercentage {
    final double power = powerStationResponseModel?.power ?? 0.0;
    final double capacity =
        powerStationResponseModel?.capacity ?? 1.0; // avoid divide-by-zero

    final double percent = (power / capacity) * 100;
    return '${percent.toStringAsFixed(2)}%';
  }
}
