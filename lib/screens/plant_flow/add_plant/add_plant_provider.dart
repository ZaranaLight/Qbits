import 'package:path/path.dart';
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

  void submitPlant(BuildContext context) {
    // Handle your submit logic here
    context.navigator.pop(); // Close the screen after submission
  }
}
