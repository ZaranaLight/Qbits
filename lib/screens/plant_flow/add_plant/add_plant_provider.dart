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

  List<String> stationTypes = ['Solar System', 'Wind Turbine', 'Hydro Plant'];

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

    if (_plant.longitude.trim().isEmpty) {
      longitudeError = "longitude is required";
    } else {
      longitudeError = "";
    }

    if (_plant.latitude.trim().isEmpty) {
      latitudeError = "latitude is required";
    } else {
      latitudeError = "";
    }

    notifyListeners();
    return stationNameError.isEmpty &&
        cityError.isEmpty &&
        capacityError.isEmpty &&
        longitudeError.isEmpty &&
        latitudeError.isEmpty &&
        batteryError.isEmpty;
  }

  void submitPlant(BuildContext context) {
    if (validation(context)) {
      if (context.mounted) {
        // Handle your submit logic here
        context.navigator.pop(); // Close the screen after submission
      }
    }
  }
}
