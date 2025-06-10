class PlantInfoModel {
  String stationName;
  String city;
  double capacity;
  String stationType;
  double batteryCapacity;
  double longitude;
  double latitude;
  String ownerPhone;
  String adminPhone;
  String installerPhone;
  String myProfit;
  String totalEnergy;
  String averageElectricPrice;
  String energySubsidizedPrice;
  String onGridElectricPrice;
  String selfUseElectricPrice;
  String onGridElectricOccupy;
  String selfUseElectricOccupy;
  int azimuth;
  int tiltAngle;
  String onGridDate;

  PlantInfoModel({
    this.stationName = '',
    this.city = '',
    this.capacity = 0,
    this.stationType = 'Battery storage system',
    this.batteryCapacity = 0,
    this.longitude = 0,
    this.latitude = 0,
    this.ownerPhone = '',
    this.adminPhone = '',
    this.installerPhone = '',
    this.myProfit = '',
    this.totalEnergy = '',
    this.averageElectricPrice = '',
    this.energySubsidizedPrice = '',
    this.onGridElectricPrice = '',
    this.selfUseElectricPrice = '',
    this.onGridElectricOccupy = '',
    this.selfUseElectricOccupy = '',
    this.azimuth = 0,
    this.tiltAngle = 0,
    this.onGridDate = '',
  });
}
