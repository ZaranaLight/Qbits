import 'package:qbits/apis/home_apis.dart';
import 'package:qbits/apis/models/device_library_response_model.dart';
import 'package:qbits/qbits.dart';

class HomeProvider extends ChangeNotifier {
  bool loader = false;

  PowerStationResponseModel? powerStationResponseModel;
  DeviceLibraryResponseModel? deviceLibraryResponseModel;

  HomeProvider() {
    init();
  }

  void init() {
    powerStationInformationAPI();
    getDeviceLibraryAPI();
    notifyListeners();
  }

  Future<void> powerStationInformationAPI() async {
    loader = true;
    notifyListeners();

    final result = await HomeApis.getPowerAttachInformationAPI();

    if (result != null) {
      powerStationResponseModel = result;
    }

    loader = false;
    notifyListeners();
  }

  Future<void> getDeviceLibraryAPI() async {
    loader = true;
    notifyListeners();

    final result = await HomeApis.getDeviceLibraryAPI();
    if (result != null) {
      deviceLibraryResponseModel = result;
    }

    loader = false;
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
