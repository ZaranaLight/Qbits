import 'package:qbits/qbits.dart';
import 'package:qbits/screens/plant_flow/plant_info/model/plant_info_model.dart';

class PlantInfoProvider extends ChangeNotifier {
  bool loader = false;
  final PlantInfoModel _plantInfo = PlantInfoModel();

  PlantInfoModel get plantInfo => _plantInfo;

  bool _isEditing = false;

  bool get isEditing => _isEditing;

  void toggleEdit() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  void updateField1(String key, dynamic value) {
    switch (key) {
      case 'Station Name':
        _plantInfo.stationName = value;
        break;
      case 'Your City':
        _plantInfo.city = value;
        break;
      case 'Capacity(kW)':
        _plantInfo.capacity = double.tryParse(value) ?? 0;
        break;
      case 'Station Type':
        _plantInfo.stationType = value;
        break;
      case 'Battery Capacity':
        _plantInfo.batteryCapacity = value;
        break;
      case 'Longitude':
        _plantInfo.longitude = value;
        break;
      case 'Latitude':
        _plantInfo.latitude = value;
        break;
      case 'Owner’s Phone':
        _plantInfo.ownerPhone = value;
        break;
      case 'Admin’s Phone':
        _plantInfo.adminPhone = value;
        break;
      case 'Installer’s Phone':
        _plantInfo.installerPhone = value;
        break;
      // Add other cases as needed...
    }
    notifyListeners();
  }

  void updateField2(String key, dynamic value) {
    switch (key) {
      case 'My Profit':
        _plantInfo.stationName = value;
        break;
      case 'Total Energy:':
        _plantInfo.city = value;
        break;
      case 'Average Electric Price:':
        _plantInfo.capacity = double.tryParse(value) ?? 0;
        break;
      case 'Energy Subsidized Price:':
        _plantInfo.stationType = value;
        break;
      case 'On- grid Electric Price:':
        _plantInfo.batteryCapacity = value;
        break;
      case 'Self-use Electric Price:':
        _plantInfo.longitude = value;
        break;
      case 'On-grid Electric Occupy:(%)':
        _plantInfo.latitude = value;
        break;
      case 'Self-use Electric Occupy:(%)':
        _plantInfo.ownerPhone = value;
        break;

      // Add other cases as needed...
    }
    notifyListeners();
  }

  final Map<String, dynamic Function(PlantInfoModel)> fieldAccessors1 = {
    'Station Name': (m) => m.stationName,
    'Your City': (m) => m.city,
    'Capacity(kW)': (m) => m.capacity.toString(),
    'Station Type': (m) => m.stationType,
    'Battery Capacity': (m) => m.batteryCapacity,
    'Longitude': (m) => m.longitude,
    'Latitude': (m) => m.latitude,
    'Owner’s Phone': (m) => m.ownerPhone,
    'Admin’s Phone': (m) => m.adminPhone,
    'Installer’s Phone': (m) => m.installerPhone,
  };

  final Map<String, dynamic Function(PlantInfoModel)> fieldAccessors2 = {
    'My Profit': (m) => m.myProfit,
    'Total Energy': (m) => m.totalEnergy,
    'Average Electric Price:': (m) => m.averageElectricPrice.toString(),
    'Energy Subsidized Price:': (m) => m.energySubsidizedPrice,
    'On- grid Electric Price:': (m) => m.onGridElectricPrice,
    'Self-use Electric Price:': (m) => m.selfUseElectricPrice,
    'On-grid Electric Occupy:(%)': (m) => m.onGridElectricOccupy,
    'Self-use Electric Occupy:(%)': (m) => m.selfUseElectricOccupy,
  };

  final Map<String, dynamic Function(PlantInfoModel)> fieldAccessors3 = {
    'Azimuth': (m) => m.azimuth,
    'Title Angle': (m) => m.tiltAngle,
    'On-grid Date': (m) => m.onGridDate.toString(),
  };
}
