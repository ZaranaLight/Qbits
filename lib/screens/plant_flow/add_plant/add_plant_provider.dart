import 'package:qbits/apis/plant_apis.dart';
import 'package:qbits/common/global_data.dart';
import 'package:qbits/qbits.dart';

class PlantModel {
  String stationName;
  String city;
  String capacity;
  String stationType;
  String battery;
  String longitude;
  String latitude;

  PlantModel({
    this.stationName = '',
    this.city = '',
    this.capacity = '',
    this.stationType = 'Solar System',
    this.battery = '',
    this.longitude = '',
    this.latitude = '',
  });
}

class AddPlantProvider extends ChangeNotifier {
  final PlantModel _plant = PlantModel();

  PlantModel get plant => _plant;

  List<String> stationTypes = [
    "Solar System",
    "Battery Storage System",
    "Solar System (with output-limition)",
  ];

  int selectedStationTypeIndex = 0;
  int createdPlantID = -1;

  String selectedStationType = 'Solar System';

  void updatePlantStationNameTap(String value) {
    _plant.stationName = value;
    notifyListeners();
  }

  void updatePlantCityNameTap(String value) {
    _plant.city = value;
    notifyListeners();
  }

  void updatePlantCapacityKWTap(String value) {
    _plant.capacity = value;
    notifyListeners();
  }

  void updatePlantBatteryTap(String value) {
    _plant.battery = value;
    notifyListeners();
  }

  void updatePlantLatitude(String value) {
    _plant.latitude = value;
    notifyListeners();
  }

  void updatePlantLongitude(String value) {
    _plant.longitude = value;
    notifyListeners();
  }

  void setStationType(String value) {
    selectedStationType = value;
    selectedStationTypeIndex = stationTypes.indexOf(value);
    notifyListeners();
  }

  String stationNameError = "";
  String cityError = "";
  String capacityError = "";
  String stationTypeError = "";
  String batteryError = "";
  String longitudeError = "";
  String latitudeError = "";

  bool validation(BuildContext context) {
    if (_plant.stationName.trim().isEmpty) {
      stationNameError = "station name is required";
    } else {
      stationNameError = "";
    }

    if (_plant.city.trim().isEmpty) {
      cityError = "city is required";
    } else {
      cityError = "";
    }

    if (_plant.capacity.trim().isEmpty) {
      capacityError = "capacity is required";
    } else {
      capacityError = "";
    }

    if (_plant.battery.trim().isEmpty) {
      batteryError = "battery is required";
    } else {
      batteryError = "";
    }

    notifyListeners();
    return stationNameError.isEmpty &&
        cityError.isEmpty &&
        capacityError.isEmpty &&
        batteryError.isEmpty;
  }

  // void submitPlant(BuildContext context) {
  //   if (validation(context)) {
  //     if (context.mounted) {
  //       // Handle your submit logic here
  //       context.navigator.pop(); // Close the screen after submission
  //     }
  //   }
  // }

  bool loader = false;

  Future<void> submitPlant(BuildContext context) async {

    if (context.mounted) {
      if (validation(context)) {
        loader = true;

        notifyListeners();
        await Future.delayed(1.seconds);

        final result = await PlantApis.addPlantAPI(
          latitude: GlobalData.longitude.toString(),
          longitude: GlobalData.latitude.toString(),
          plantName: plant.stationName,
          batteryCapacity: plant.battery,
          capacity: plant.capacity,
          city: plant.city,
          stationType: selectedStationTypeIndex,
        );
        if (result != null) {
          if (context.mounted) {
            showSuccessToast(context.l10n?.plantCreatedSuccessfully ?? "");
            context.navigator.pop();
            createdPlantID = result;
          }
        }
        loader = false;
        notifyListeners();
      }
    }
  }
}
