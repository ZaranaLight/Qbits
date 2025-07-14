import 'package:qbits/qbits.dart';

PowerStationResponseModel dashboardPowerStationResponseModelFromJson(
  String str,
) => PowerStationResponseModel.fromJson(json.decode(str));

String dashboardPowerStationResponseModelToJson(
  PowerStationResponseModel data,
) => json.encode(data.toJson());

class PowerStationResponseModel {
  int? plantCount;
  int? normalCount;
  int? standbyCount;
  int? faultCount;
  int? warnCount;
  int? offlineCount;
  int? jiansheCount;
  double? dayPower;
  double? capacity;
  double? totalPower;
  double? power;
  double? monthPower;
  double? yearPower;

  PowerStationResponseModel({
    this.plantCount,
    this.normalCount,
    this.standbyCount,
    this.faultCount,
    this.warnCount,
    this.offlineCount,
    this.jiansheCount,
    this.dayPower,
    this.capacity,
    this.totalPower,
    this.power,
    this.monthPower,
    this.yearPower,
  });

  PowerStationResponseModel.fromJson(Map<String, dynamic> json) {
    plantCount = json['plantCount'];
    normalCount = json['normalCount'];
    standbyCount = json['standbyCount'];
    faultCount = json['faultCount'];
    warnCount = json['warnCount'];
    offlineCount = json['offlineCount'];
    jiansheCount = json['jiansheCount'];
    dayPower = json['dayPower'];
    capacity = json['capacity'];
    totalPower = json['totalPower'];
    power = json['power'];
    monthPower = json['monthPower'];
    yearPower = json['yearPower'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plantCount'] = plantCount;
    data['normalCount'] = normalCount;
    data['standbyCount'] = standbyCount;
    data['faultCount'] = faultCount;
    data['warnCount'] = warnCount;
    data['offlineCount'] = offlineCount;
    data['jiansheCount'] = jiansheCount;
    data['dayPower'] = dayPower;
    data['capacity'] = capacity;
    data['totalPower'] = totalPower;
    data['power'] = power;
    data['monthPower'] = monthPower;
    data['yearPower'] = yearPower;
    return data;
  }
}
