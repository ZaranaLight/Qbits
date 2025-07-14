class DeviceLibraryResponseModel {
  int? count;
  int? online;
  int? offline;
  int? alarm;
  int? plant;
  int? unPlant;
  int? dayLive;
  int? monthLive;
  int? yearLive;

  DeviceLibraryResponseModel({
    this.count,
    this.online,
    this.offline,
    this.alarm,
    this.plant,
    this.unPlant,
    this.dayLive,
    this.monthLive,
    this.yearLive,
  });

  DeviceLibraryResponseModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    online = json['online'];
    offline = json['offline'];
    alarm = json['alarm'];
    plant = json['plant'];
    unPlant = json['unplant'];
    dayLive = json['dayLive'];
    monthLive = json['monthLive'];
    yearLive = json['yearLive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['online'] = online;
    data['offline'] = offline;
    data['alarm'] = alarm;
    data['plant'] = plant;
    data['unplant'] = unPlant;
    data['dayLive'] = dayLive;
    data['monthLive'] = monthLive;
    data['yearLive'] = yearLive;
    return data;
  }
}
