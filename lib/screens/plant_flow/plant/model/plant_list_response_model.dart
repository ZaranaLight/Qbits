
class PlanListResponseModel {
  PlantInfo? plantInfo;
  double? monthPower;
  double? yearPower;
  double? powerRate;
  double? kpi;
  String? date;
  bool? watch;
  String? time;

  PlanListResponseModel({
    this.plantInfo,
    this.monthPower,
    this.yearPower,
    this.powerRate,
    this.kpi,
    this.date,
    this.watch,
    this.time,
  });

  PlanListResponseModel.fromJson(Map<String, dynamic> json) {
    plantInfo =
        json['plantInfo'] != null
            ? PlantInfo.fromJson(json['plantInfo'])
            : null;
    monthPower = json['monthPower'];
    yearPower = json['yearPower'];
    powerRate = json['powerRate'];
    kpi = json['kpi'];
    date = json['date'];
    watch = json['watch'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (plantInfo != null) {
      data['plantInfo'] = plantInfo!.toJson();
    }
    data['monthPower'] = monthPower;
    data['yearPower'] = yearPower;
    data['powerRate'] = powerRate;
    data['kpi'] = kpi;
    data['date'] = date;
    data['watch'] = watch;
    data['time'] = time;
    return data;
  }
}

class PlantInfo {
  int? id;
  String? plantNo;
  String? plantName;
  String? isRoom;
  String? isEnviroment;
  String? isBlackflow;
  double? elecSubsidyPrice;
  double? internetPowerPrice;
  double? ownPowerPrice;
  double? internetPowerOccupy;
  double? ownPowerOccupy;
  String? remark2;
  String? remark3;
  String? remark4;
  String? remark5;
  String? remark6;
  String? remark1;
  String? plantUser;
  double? acpower;
  double? eday;
  double? etot;
  int? plantstate;
  int? planttype;
  String? recordTime;
  double? capacity;
  double? capacitybattery;
  String? country;
  String? province;
  String? city;
  String? district;

  PlantInfo({
    this.id,
    this.plantNo,
    this.plantName,
    this.isRoom,
    this.isEnviroment,
    this.isBlackflow,
    this.elecSubsidyPrice,
    this.internetPowerPrice,
    this.ownPowerPrice,
    this.internetPowerOccupy,
    this.ownPowerOccupy,
    this.remark2,
    this.remark3,
    this.remark4,
    this.remark5,
    this.remark6,
    this.remark1,
    this.plantUser,
    this.acpower,
    this.eday,
    this.etot,
    this.plantstate,
    this.planttype,
    this.recordTime,
    this.capacity,
    this.capacitybattery,
    this.country,
    this.province,
    this.city,
    this.district,
  });

  PlantInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plantNo = json['plantNo'];
    plantName = json['plantName'];
    isRoom = json['isRoom'];
    isEnviroment = json['isEnviroment'];
    isBlackflow = json['isBlackflow'];
    elecSubsidyPrice = json['elecSubsidyPrice'];
    internetPowerPrice = json['internetPowerPrice'];
    ownPowerPrice = json['ownPowerPrice'];
    internetPowerOccupy = json['internetPowerOccupy'];
    ownPowerOccupy = json['ownPowerOccupy'];
    remark2 = json['remark2'];
    remark3 = json['remark3'];
    remark4 = json['remark4'];
    remark5 = json['remark5'];
    remark6 = json['remark6'];
    remark1 = json['remark1'];
    plantUser = json['plantUser'];
    acpower = json['acpower'];
    eday = json['eday'];
    etot = json['etot'];
    plantstate = json['plantstate'];
    planttype = json['planttype'];
    recordTime = json['recordTime'];
    capacity = json['capacity'];
    capacitybattery = json['capacitybattery'];
    country = json['country'];
    province = json['province'];
    city = json['city'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['plantNo'] = plantNo;
    data['plantName'] = plantName;
    data['isRoom'] = isRoom;
    data['isEnviroment'] = isEnviroment;
    data['isBlackflow'] = isBlackflow;
    data['elecSubsidyPrice'] = elecSubsidyPrice;
    data['internetPowerPrice'] = internetPowerPrice;
    data['ownPowerPrice'] = ownPowerPrice;
    data['internetPowerOccupy'] = internetPowerOccupy;
    data['ownPowerOccupy'] = ownPowerOccupy;
    data['remark2'] = remark2;
    data['remark3'] = remark3;
    data['remark4'] = remark4;
    data['remark5'] = remark5;
    data['remark6'] = remark6;
    data['remark1'] = remark1;
    data['plantUser'] = plantUser;
    data['acpower'] = acpower;
    data['eday'] = eday;
    data['etot'] = etot;
    data['plantstate'] = plantstate;
    data['planttype'] = planttype;
    data['recordTime'] = recordTime;
    data['capacity'] = capacity;
    data['capacitybattery'] = capacitybattery;
    data['country'] = country;
    data['province'] = province;
    data['city'] = city;
    data['district'] = district;
    return data;
  }
}
