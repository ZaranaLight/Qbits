class InverterData {
List<PvData> pvArrays;

  InverterData({
    required this.pvArrays,
  });

  factory InverterData.empty() {
    return InverterData(
      pvArrays: List.generate(4, (index) => PvData.empty()),
    );
  }
}

class PvData {
  final double voltage;
  final double current;
  final double power;

  PvData({
    required this.voltage,
    required this.current,
    required this.power,
  });

  factory PvData.empty() {
    return PvData(voltage: 0, current: 0, power: 0);
  }
}

class BatteryData {
  final double voltage;
  final double current;
  final double power;
  final double capacity;
  final String workingStatus;
  final String testStatus;
  final String bmsComStatus;
  final double bmsTemperature;
  final String maxChargingCurrent;
  final String maxDischargingCurrent;

  BatteryData({
    required this.voltage,
    required this.current,
    required this.power,
    required this.capacity,
    required this.workingStatus,
    required this.testStatus,
    required this.bmsComStatus,
    required this.bmsTemperature,
    required this.maxChargingCurrent,
    required this.maxDischargingCurrent,
  });

  factory BatteryData.empty() {
    return BatteryData(
      voltage: 0,
      current: 0,
      power: 0,
      capacity: 0,
      workingStatus: 'N/A',
      testStatus: 'N/A',
      bmsComStatus: 'N/A',
      bmsTemperature: 0,
      maxChargingCurrent: 'N/A',
      maxDischargingCurrent: 'N/A',
    );
  }
}
class GridData {
  final List<PhaseData> phases;
  final double reactivePowerA;
  final double reactivePowerB;
  final double reactivePowerC;
  final double powerFactorA;
  final double powerFactorB;
  final double powerFactorC;
  final double totalPower;
  final String status;
  final double totalProduction;
  final double totalElectric;

  GridData({
    required this.phases,
    required this.reactivePowerA,
    required this.reactivePowerB,
    required this.reactivePowerC,
    required this.powerFactorA,
    required this.powerFactorB,
    required this.powerFactorC,
    required this.totalPower,
    required this.status,
    required this.totalProduction,
    required this.totalElectric,
  });

  factory GridData.empty() {
    return GridData(
      phases: List.generate(3, (index) => PhaseData.empty()),
      reactivePowerA: 0,
      reactivePowerB: 0,
      reactivePowerC: 0,
      powerFactorA: 0,
      powerFactorB: 0,
      powerFactorC: 0,
      totalPower: 0,
      status: 'N/A',
      totalProduction: 0,
      totalElectric: 0,
    );
  }
}

class PhaseData {
  final String phase;
  final double voltage;
  final double current;
  final double frequency;
  final double power;

  PhaseData({
    required this.phase,
    required this.voltage,
    required this.current,
    required this.frequency,
    required this.power,
  });

  factory PhaseData.empty() {
    return PhaseData(
      phase: 'A',
      voltage: 0,
      current: 0,
      frequency: 0,
      power: 0,
    );
  }
}

class MeterData {
  final double power;
  final double totalPower;
  final String status;

  MeterData({
    required this.power,
    required this.totalPower,
    required this.status,
  });

  factory MeterData.empty() {
    return MeterData(
      power: 0,
      totalPower: 0,
      status: 'N/A',
    );
  }
}

class SystemData {
  final DateTime dateTime;
  final double ratedPower;
  final String serialNumber;
  final String stm32Status;
  final String dspmStatus;
  final String dspsStatus;
  final String cpldStatus;
  final int countdownTime;

  SystemData({
    required this.dateTime,
    required this.ratedPower,
    required this.serialNumber,
    required this.stm32Status,
    required this.dspmStatus,
    required this.dspsStatus,
    required this.cpldStatus,
    required this.countdownTime,
  });

  factory SystemData.empty() {
    return SystemData(
      dateTime: DateTime.now(),
      ratedPower: 0,
      serialNumber: 'N/A',
      stm32Status: 'N/A',
      dspmStatus: 'N/A',
      dspsStatus: 'N/A',
      cpldStatus: 'N/A',
      countdownTime: 0,
    );
  }
}

class Alert {
  final DateTime dateTime;
  final double ratedPower;
  final String bms1Status;
  final String bms2Status;
  final String system1Status;
  final String system2Status;
  final String warningCode;

  Alert({
    required this.dateTime,
    required this.ratedPower,
    required this.bms1Status,
    required this.bms2Status,
    required this.system1Status,
    required this.system2Status,
    required this.warningCode,
  });

  factory Alert.empty() {
    return Alert(
      dateTime: DateTime.now(),
      ratedPower: 0,
      bms1Status: 'N/A',
      bms2Status: 'N/A',
      system1Status: 'N/A',
      system2Status: 'N/A',
      warningCode: 'N/A',
    );
  }
}

class EnergyData {
  final double dayKwh;
  final double monthKwh;
  final double yearKwh;
  final double totalKwh;

  EnergyData({
    required this.dayKwh,
    required this.monthKwh,
    required this.yearKwh,
    required this.totalKwh,
  });

  factory EnergyData.empty() {
    return EnergyData(
      dayKwh: 0,
      monthKwh: 0,
      yearKwh: 0,
      totalKwh: 0,
    );
  }
}

class GeneratorData {
  final List<PhaseData> phases;
  final double reactivePowerA;
  final double reactivePowerB;
  final double reactivePowerC;
  final double powerFactorA;
  final double powerFactorB;
  final double powerFactorC;

  GeneratorData({
    required this.phases,
    required this.reactivePowerA,
    required this.reactivePowerB,
    required this.reactivePowerC,
    required this.powerFactorA,
    required this.powerFactorB,
    required this.powerFactorC,
  });

  factory GeneratorData.empty() {
    return GeneratorData(
      phases: List.generate(3, (index) => PhaseData.empty()),
      reactivePowerA: 0,
      reactivePowerB: 0,
      reactivePowerC: 0,
      powerFactorA: 0,
      powerFactorB: 0,
      powerFactorC: 0,
    );
  }
}
// Similar classes for GridData, MeterData, SystemData, Alert, EnergyData, GeneratorData
// (Implementation omitted for brevity but follow the same pattern)