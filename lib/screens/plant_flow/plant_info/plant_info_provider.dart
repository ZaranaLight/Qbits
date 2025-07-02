import 'package:intl/intl.dart';
import 'package:qbits/qbits.dart';

class PlantInfoProvider extends ChangeNotifier {
  DateTime? selectedDate;

  bool loader = false;

  bool _isEditing = false;

  bool get isEditing => _isEditing;

  void toggleEdit() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  /// Plant Info Part 1
  final PlantInfoPart1Class _plantInfoPart1Class = PlantInfoPart1Class();

  PlantInfoPart1Class get plantInfoPart1Class => _plantInfoPart1Class;

  /// Plant Info Part 2
  final PlantInfoPart2Class _plantInfoPart2Class = PlantInfoPart2Class();

  PlantInfoPart2Class get plantInfoPart2Class => _plantInfoPart2Class;

  /// Plant Info Part 3
  final PlantInfoPart3Class _plantInfoPart3Class = PlantInfoPart3Class();

  PlantInfoPart3Class get plantInfoPart3Class => _plantInfoPart3Class;

  void onStationNameTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Station Name",
      initialValue: _plantInfoPart1Class.stationName,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart1Class.stationName = result;
    }
    notifyListeners();
  }

  void onYourCityTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Your City",
      initialValue: _plantInfoPart1Class.yourCity,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart1Class.yourCity = result;
    }
    notifyListeners();
  }

  void onCapacityTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Capacity(kW)",
      initialValue: _plantInfoPart1Class.capacity,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart1Class.capacity = result;
    }
    notifyListeners();
  }

  void updateStationType(String value) {
    _plantInfoPart1Class.stationType = value;
    notifyListeners();
  }

  void onStationTypeTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Station Type",
      initialValue: _plantInfoPart1Class.stationType,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart1Class.stationType = result;
    }
    notifyListeners();
  }

  void onBatteryCapacityTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Battery Capacity",
      initialValue: _plantInfoPart1Class.batteryCapacity,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart1Class.batteryCapacity = result;
    }
    notifyListeners();
  }

  void onLongitudeTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Longitude:",
      initialValue: _plantInfoPart1Class.longitude,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart1Class.longitude = result;
    }
    notifyListeners();
  }

  void onLatitudeTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Longitude:",
      initialValue: _plantInfoPart1Class.latitude,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart1Class.latitude = result;
    }
    notifyListeners();
  }

  void onOwnerPhoneTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Owner’s Phone:",
      initialValue: _plantInfoPart1Class.ownerPhone,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart1Class.ownerPhone = result;
    }
    notifyListeners();
  }

  void onAdminPhoneTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Admin’s Phone:",
      initialValue: _plantInfoPart1Class.adminPhone,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart1Class.adminPhone = result;
    }
    notifyListeners();
  }

  void onInstallerPhoneTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Admin’s Phone:",
      initialValue: _plantInfoPart1Class.installerPhone,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart1Class.installerPhone = result;
    }
    notifyListeners();
  }

  /// Plant Info Part 2
  void onMyProfitTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter My Profit",
      initialValue: _plantInfoPart2Class.myProfit,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart2Class.myProfit = result;
    }
    notifyListeners();
  }

  void onTotalEnergyTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Total Energy",
      initialValue: _plantInfoPart2Class.totalEnergy,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart2Class.totalEnergy = result;
    }
    notifyListeners();
  }

  void onAverageElectricPriceTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Average Electric Price",
      initialValue: _plantInfoPart2Class.averageElectricityPrice,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart2Class.averageElectricityPrice = result;
    }
    notifyListeners();
  }

  void onEnergySubsidizedPriceTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Energy Subsidized Price:",
      initialValue: _plantInfoPart2Class.energySubsidizedPrice,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart2Class.energySubsidizedPrice = result;
    }
    notifyListeners();
  }

  void onOnGridElectricPriceTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter On- grid Electric Price:",
      initialValue: _plantInfoPart2Class.onGridElectricPrice,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart2Class.onGridElectricPrice = result;
    }
    notifyListeners();
  }

  void onSelfUseElectricPriceTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Self-use Electric Price:",
      initialValue: _plantInfoPart2Class.selfUseElectricPrice,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart2Class.selfUseElectricPrice = result;
    }
    notifyListeners();
  }

  void onGridElectricOccupyTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter On-grid Electric Occupy:(%)",
      initialValue: _plantInfoPart2Class.onGridElectricOccupy,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart2Class.onGridElectricOccupy = result;
    }
    notifyListeners();
  }

  void onSelfUseElectricOccupyTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Self-use Electric Occupy:(%)",
      initialValue: _plantInfoPart2Class.selfUseElectricOccupy,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart2Class.selfUseElectricOccupy = result;
    }
    notifyListeners();
  }

  /// Plant Info Part 3
  void onAzimuthTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Azimuth",
      initialValue: _plantInfoPart3Class.azimuth,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart3Class.azimuth = result;
    }
    notifyListeners();
  }

  void onTitleAngleTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Title Angle",
      initialValue: _plantInfoPart3Class.titleAngle,
    );
    if (result != null && result.isNotEmpty) {
      _plantInfoPart3Class.titleAngle = result;
    }
    notifyListeners();
  }

  Future<void> onOnGridDateTap(BuildContext context) async {
    final now = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      updateDate(picked);
    }
  }

  void updateDate(DateTime date) {
    _plantInfoPart3Class.onGridDate = DateFormat("dd MMMM yyyy").format(date);
    notifyListeners();
  }
}
