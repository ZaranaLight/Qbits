import 'package:qbits/qbits.dart';

class BatterySet {
  String bmsProtocolSetting;
  String batteryMode;
  String batteryCapacity;
  String batteryActivate;
  String equalizingChargeVoltage;
  String equalizingChargeCurrent;
  String floatingChargeVoltage;
  String floatingChargeCurrent;
  String floatingChargeTime;
  String dischargeCutOffVoltage;
  String dischargeMaxCurrent;
  String socProtectionOffGrid;
  String socProtectionSmartLoad;
  String voltageProtectionSmartLoad;

  BatterySet({
    this.bmsProtocolSetting = '0',
    this.batteryMode = '0',
    this.batteryCapacity = '0AH',
    this.batteryActivate = '0KW',
    this.equalizingChargeVoltage = '0.00V',
    this.equalizingChargeCurrent = '0.00A',
    this.floatingChargeVoltage = '0.00V',
    this.floatingChargeCurrent = '0.00A',
    this.floatingChargeTime = '0min',
    this.dischargeCutOffVoltage = '0.00V',
    this.dischargeMaxCurrent = '0.00A',
    this.socProtectionOffGrid = '0%',
    this.socProtectionSmartLoad = '0%',
    this.voltageProtectionSmartLoad = '0V',
  });
}

class BatterySetWidget extends StatelessWidget {
  const BatterySetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RemoteControlProvider>(
      builder: (context, provider, child) {
        return Container(
          color: ColorRes.white,
          child: Column(
            spacing: 11.ph,
            children: [
              AppTextFieldDialog2Widget(
                title: 'BMS_protocol Setting',
                value: provider.batterySetting.bmsProtocolSetting,
                onTap: () {
                  provider.onBmsProtocolSetting(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Battery Mode',
                value: provider.batterySetting.batteryMode,
                onTap: () {
                  provider.onBmsProtocolSetting(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Battery Mode',
                value: provider.batterySetting.batteryMode,
                onTap: () {
                  provider.onBatteryMode(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Battery Capacity',
                value: provider.batterySetting.batteryCapacity,
                onTap: () {
                  provider.onBatteryCapacityMode(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Battery Activate',
                value: provider.batterySetting.batteryActivate,
                onTap: () {
                  provider.onBatteryActivateMode(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Equalizing Charge Voltage',
                value: provider.batterySetting.equalizingChargeVoltage,
                onTap: () {
                  provider.onEqualizingChargeVoltageMode(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Equalizing Charge Current',
                value: provider.batterySetting.equalizingChargeCurrent,
                onTap: () {
                  provider.onEqualizingChargeCurrentMode(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Floating Charge Voltage',
                value: provider.batterySetting.floatingChargeVoltage,
                onTap: () {
                  provider.onFloatingChargeVoltageMode(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Floating Charge Current',
                value: provider.batterySetting.floatingChargeCurrent,
                onTap: () {
                  provider.onFloatingChargeCurrentMode(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Floating Charge Time',
                value: provider.batterySetting.floatingChargeTime,
                onTap: () {
                  provider.onFloatingChargeTimeMode(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Discharge Cut-off Voltage',
                value: provider.batterySetting.dischargeCutOffVoltage,
                onTap: () {
                  provider.onDischargeCutoffVoltageMode(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Discharge Max. Current',
                value: provider.batterySetting.dischargeMaxCurrent,
                onTap: () {
                  provider.onDischargeMaxCurrentMode(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Soc Protection Off-gride',
                value: provider.batterySetting.socProtectionOffGrid,
                onTap: () {
                  provider.onSocProtectionOffGridMode(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Soc Protection Smart Load',
                value: provider.batterySetting.socProtectionSmartLoad,
                onTap: () {
                  provider.onSocProtectionSmartLoadMode(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Voltage Protection Smart Load',
                value: provider.batterySetting.voltageProtectionSmartLoad,
                onTap: () {
                  provider.onVoltageProtectionSmartLoadMode(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
