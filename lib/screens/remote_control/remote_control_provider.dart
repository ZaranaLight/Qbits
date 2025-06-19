import 'package:qbits/qbits.dart';

class RemoteControlProvider extends ChangeNotifier {
  RemoteControlProvider();

  int? _expandedIndex;

  int? get expandedIndex => _expandedIndex;

  void toggleExpanded(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = null; // collapse if already expanded
    } else {
      _expandedIndex = index; // expand this one
    }
    notifyListeners();
  }

  ///Basic Inverter Info
  final List<String> remoteControlTitle = [
    "System Set",
    "Mode",
    "Battery Set",
    "Grid Set",
    "Advanced Set",
  ];

  final List<Widget> remoteControlContent = [
    SystemSetWidget(),
    ModeWidget(),
    BatterySetWidget(),
    GridSetWidget(),
    AdvancedSetWidget(),
  ];

  ///=========================System Set==========================
  final SystemSettings _settings = SystemSettings();

  SystemSettings get settings => _settings;

  // Update switch on/off enable
  void updateOnOffEnable(String value) {
    _settings.switchOnOffEnable = value;
    notifyListeners();
  }

  // Update run mode
  void updateRunMode(String value) {
    _settings.runMode = value;
    notifyListeners();
  }

  // Update work mode
  void updateWorkMode(String value) {
    _settings.workMode = value;
    notifyListeners();
  }

  void onRefluxUplinkPower(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Reflux Uplink  Power",
      initialValue: _settings.refluxUplinkPower,
    );
    if (result != null && result.isNotEmpty) {
      _settings.refluxUplinkPower = result;
    }
    notifyListeners();
  }

  void onMaxSellPower(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Max Sell Power",
      initialValue: _settings.maxSellPower,
    );
    if (result != null && result.isNotEmpty) {
      _settings.maxSellPower = result;
    }
    notifyListeners();
  }

  void onGridPeakShavePower(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Grid Peak-shave Power",
      initialValue: _settings.gridPeakShavePower,
    );
    if (result != null && result.isNotEmpty) {
      _settings.gridPeakShavePower = result;
    }
    notifyListeners();
  }

  // Update solar sell
  void updateSolarSell(String value) {
    _settings.solarSell = value;
    notifyListeners();
  }

  final Map<String, String> weekDayMap = {
    '0': 'Sunday',
    '1': 'Monday',
    '2': 'Tuesday',
    '3': 'Wednesday',
    '4': 'Thursday',
    '5': 'Friday',
    '6': 'Saturday',
  };

  List<int> getSelectedDayIndexes(List<String> selectedValues) {
    return selectedValues
        .map((e) => int.tryParse(e) ?? -1)
        .where((e) => e >= 0)
        .toList();
  }

  String getWeekDaysDisplay(List<String> selectedIndexes) {
    return selectedIndexes
        .map((index) => weekDayMap[index] ?? index)
        .join(', ');
  }

  // Update week sell
  void updateWeekSell(List<String> value) {
    settings.weekSell = value;
    notifyListeners();
  }

  // Update energy mode
  void updateEnergyMode(String value) {
    _settings.energyMode = value;
    notifyListeners();
  }

  // Update offline mode
  void updateOfflineMode(String value) {
    _settings.offlineMode = value;
    notifyListeners();
  }

  // Update grid peak shave
  void updateGridPeakShave(String value) {
    _settings.gridPeakShave = value;
    notifyListeners();
  }

  ///=========================Mode==========================
  ModeSettings modeSettings = ModeSettings();

  void updatePointOfTime(String val) {
    modeSettings.pointOfTime = val;
    notifyListeners();
  }

  void updateMode1(String val) {
    modeSettings.mode1 = val;
    notifyListeners();
  }

  void updateStartTime1(String val) {
    modeSettings.startTime1 = val;
    notifyListeners();
  }

  void updateEndTime1(String val) {
    modeSettings.endTime1 = val;
    notifyListeners();
  }

  void updatePowerSet1(String val) {
    modeSettings.powerSet1 = val;
    notifyListeners();
  }

  void updateSocSet1(String val) {
    modeSettings.socSet1 = val;
    notifyListeners();
  }

  void updateVoltageSet1(String val) {
    modeSettings.voltageSet1 = val;
    notifyListeners();
  }

  ///=========================Battery Set==========================

  final BatterySet _batterySetting = BatterySet();

  BatterySet get batterySetting => _batterySetting;

  void onBmsProtocolSetting(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter BMS_protocol Setting",
      initialValue: _batterySetting.bmsProtocolSetting,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.bmsProtocolSetting = result;
    }
    notifyListeners();
  }

  void onBatteryMode(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Battery Mode",
      initialValue: _batterySetting.batteryMode,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.batteryMode = result;
    }
    notifyListeners();
  }

  void onBatteryCapacityMode(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Battery Capacity",
      initialValue: _batterySetting.batteryCapacity,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.batteryCapacity = result;
    }
    notifyListeners();
  }

  void onBatteryActivateMode(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Battery Activate",
      initialValue: _batterySetting.batteryActivate,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.batteryActivate = result;
    }
    notifyListeners();
  }

  void onEqualizingChargeVoltageMode(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Equalizing Charge Voltage",
      initialValue: _batterySetting.equalizingChargeVoltage,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.equalizingChargeVoltage = result;
    }
    notifyListeners();
  }

  void onEqualizingChargeCurrentMode(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Equalizing Charge Current",
      initialValue: _batterySetting.equalizingChargeCurrent,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.equalizingChargeCurrent = result;
    }
    notifyListeners();
  }

  void onFloatingChargeVoltageMode(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Floating Charge Voltage",
      initialValue: _batterySetting.floatingChargeVoltage,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.floatingChargeVoltage = result;
    }
    notifyListeners();
  }

  void onFloatingChargeCurrentMode(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Floating Charge Current",
      initialValue: _batterySetting.floatingChargeCurrent,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.floatingChargeCurrent = result;
    }
    notifyListeners();
  }

  void onFloatingChargeTimeMode(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Floating Charge Time",
      initialValue: _batterySetting.floatingChargeTime,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.floatingChargeTime = result;
    }
    notifyListeners();
  }

  void onDischargeCutoffVoltageMode(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Discharge Cut-off Voltage",
      initialValue: _batterySetting.dischargeCutOffVoltage,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.dischargeCutOffVoltage = result;
    }
    notifyListeners();
  }

  void onDischargeMaxCurrentMode(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Discharge Max. Current",
      initialValue: _batterySetting.dischargeMaxCurrent,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.dischargeMaxCurrent = result;
    }
    notifyListeners();
  }

  void onSocProtectionOffGridMode(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Soc Protection Off-gride",
      initialValue: _batterySetting.socProtectionOffGrid,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.socProtectionOffGrid = result;
    }
    notifyListeners();
  }

  void onSocProtectionSmartLoadMode(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Soc Protection Smart Load",
      initialValue: _batterySetting.socProtectionSmartLoad,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.socProtectionSmartLoad = result;
    }
    notifyListeners();
  }

  void onVoltageProtectionSmartLoadMode(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Voltage Protection Smart Load",
      initialValue: _batterySetting.voltageProtectionSmartLoad,
    );
    if (result != null && result.isNotEmpty) {
      _batterySetting.voltageProtectionSmartLoad = result;
    }
    notifyListeners();
  }

  ///=========================Grid Set==========================

  final GridSet _gridSet = GridSet();

  GridSet get gridSet => _gridSet;

  void onGridStandard(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Grid Standard",
      initialValue: _gridSet.gridStandard,
    );
    if (result != null && result.isNotEmpty) {
      _gridSet.gridStandard = result;
    }
    notifyListeners();
  }

  void onFrequencySetting(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Grid Frequency Setting",
      initialValue: _gridSet.gridFrequencySetting,
    );
    if (result != null && result.isNotEmpty) {
      _gridSet.gridFrequencySetting = result;
    }
    notifyListeners();
  }

  void onGridVoltageUpperLimit(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Grid Voltage Upper limit",
      initialValue: _gridSet.gridVoltageUpperLimit,
    );
    if (result != null && result.isNotEmpty) {
      _gridSet.gridVoltageUpperLimit = result;
    }
    notifyListeners();
  }

  void onGridVoltageLowerLimit(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Grid Voltage Lower limit",
      initialValue: _gridSet.gridVoltageLowerLimit,
    );
    if (result != null && result.isNotEmpty) {
      _gridSet.gridVoltageLowerLimit = result;
    }
    notifyListeners();
  }

  void onGridFrequencyUpperLimit(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Grid Frequency Upper limit",
      initialValue: _gridSet.gridFrequencyUpperLimit,
    );
    if (result != null && result.isNotEmpty) {
      _gridSet.gridFrequencyUpperLimit = result;
    }
    notifyListeners();
  }

  void onGridFrequencyLowerLimit(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Grid Frequency Lower limit",
      initialValue: _gridSet.gridFrequencyLowerLimit,
    );
    if (result != null && result.isNotEmpty) {
      _gridSet.gridFrequencyLowerLimit = result;
    }
    notifyListeners();
  }

  void onReconnectDelay(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Reconnect Delay",
      initialValue: _gridSet.reconnectDelay,
    );
    if (result != null && result.isNotEmpty) {
      _gridSet.reconnectDelay = result;
    }
    notifyListeners();
  }

  void onGridVoltage(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Grid Voltage",
      initialValue: _gridSet.gridVoltage,
    );
    if (result != null && result.isNotEmpty) {
      _gridSet.gridVoltage = result;
    }
    notifyListeners();
  }

  ///=========================Advanced Set==========================
  final AdvancedSet _advancedSet = AdvancedSet();

  AdvancedSet get advancedSet => _advancedSet;

  ///Pv Start Offline
  void onPvStartOffline(String value) {
    _advancedSet.pvStartOffline = value;
    notifyListeners();
  }

  ///Shadow Scan Enable
  void onShadowScanEnable(String value) {
    _advancedSet.shadowScanEnable = value;
    notifyListeners();
  }

  ///LVRT Enable
  void onLVRTEnable(String value) {
    _advancedSet.lvrtEnable = value;
    notifyListeners();
  }

  ///Island Protection enable
  void onIslandProtectionEnable(String value) {
    _advancedSet.islandProtectionEnable = value;
    notifyListeners();
  }

  ///Overload Reset
  void onOverloadReset(String value) {
    _advancedSet.overloadReset = value;
    notifyListeners();
  }

  ///Gen Signal
  void onGenSignal(String value) {
    _advancedSet.genSignal = value;
    notifyListeners();
  }

  ///Grid Signal
  void onGridSignal(String value) {
    _advancedSet.gridSignal = value;
    notifyListeners();
  }

  ///Small Load Set
  void onSmallLoadSet(String value) {
    _advancedSet.smallLoadSet = value;
    notifyListeners();
  }

  ///GEN connect to Grid input
  void onGenConnectGridInput(String value) {
    _advancedSet.genConnectToGridInput = value;
    notifyListeners();
  }

  ///BMS Stop
  void onBMSStop(String value) {
    _advancedSet.bmsStop = value;
    notifyListeners();
  }

  ///ARC Setup
  void onARCSetup(String value) {
    _advancedSet.arcSetup = value;
    notifyListeners();
  }

  ///GFD turn off
  void onGFDTurnOff(String value) {
    _advancedSet.gfdTurnOff = value;
    notifyListeners();
  }

  ///Leakage turn off
  void onLeakageTurnOff(String value) {
    _advancedSet.leakageTurnOff = value;
    notifyListeners();
  }

  ///Beep
  void onBeepTap(String value) {
    _advancedSet.beep = value;
    notifyListeners();
  }

  ///CT Disable
  void onCtDisable(String value) {
    _advancedSet.ctDisable = value;
    notifyListeners();
  }

  ///DRM
  void onDRM(String value) {
    _advancedSet.drm = value;
    notifyListeners();
  }

  void onSetRTCTimeTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Set RTC Time",
      initialValue: _advancedSet.setRtcTime,
    );
    if (result != null && result.isNotEmpty) {
      _advancedSet.setRtcTime = result;
    }
    notifyListeners();
  }

  void onSetMeterCOMAddressTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Set Meter COM Address",
      initialValue: _advancedSet.setMeterComAddress,
    );
    if (result != null && result.isNotEmpty) {
      _advancedSet.setMeterComAddress = result;
    }
    notifyListeners();
  }

  void onCTRatioSettingTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter CT Ratio Setting",
      initialValue: _advancedSet.ctRatioSetting,
    );
    if (result != null && result.isNotEmpty) {
      _advancedSet.ctRatioSetting = result;
    }
    notifyListeners();
  }

  void onParallelAddressSettingTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Parallel Address Setting",
      initialValue: _advancedSet.parallelAddressSetting,
    );
    if (result != null && result.isNotEmpty) {
      _advancedSet.parallelAddressSetting = result;
    }
    notifyListeners();
  }

  void onTotalParallelSettingTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Parallel Address Setting",
      initialValue: _advancedSet.totalParallelSetting,
    );
    if (result != null && result.isNotEmpty) {
      _advancedSet.totalParallelSetting = result;
    }
    notifyListeners();
  }

  void onActivePowerRegulationTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Active Power Regulation",
      initialValue: _advancedSet.activePowerRegulation,
    );
    if (result != null && result.isNotEmpty) {
      _advancedSet.activePowerRegulation = result;
    }
    notifyListeners();
  }

  void onReactivePowerRegulationTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Reactive Power Regulation",
      initialValue: _advancedSet.reactivePowerRegulation,
    );
    if (result != null && result.isNotEmpty) {
      _advancedSet.reactivePowerRegulation = result;
    }
    notifyListeners();
  }

  void onPowerFactorRegulationTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Power Factor Regulation",
      initialValue: _advancedSet.powerFactorRegulation,
    );
    if (result != null && result.isNotEmpty) {
      _advancedSet.powerFactorRegulation = result;
    }
    notifyListeners();
  }

  void onGenMaxRunTimeTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Gen Max Run Time",
      initialValue: _advancedSet.genMaxRunTime,
    );
    if (result != null && result.isNotEmpty) {
      _advancedSet.genMaxRunTime = result;
    }
    notifyListeners();
  }

  void onGenDownTimeTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Gen Down Time",
      initialValue: _advancedSet.genDownTime,
    );
    if (result != null && result.isNotEmpty) {
      _advancedSet.genDownTime = result;
    }
    notifyListeners();
  }

  void onModbusAddressTap(BuildContext context) async {
    final result = await openTextFieldDialog(
      context,
      header: "Enter Modbus Address",
      initialValue: _advancedSet.modbusAddress,
    );
    if (result != null && result.isNotEmpty) {
      _advancedSet.modbusAddress = result;
    }
    notifyListeners();
  }
}
