import 'package:qbits/qbits.dart';

class AdvancedSet {
  String setRtcTime;
  String setMeterComAddress;
  String ctRatioSetting;
  String parallelAddressSetting;
  String totalParallelSetting;
  String pvStartOffline;
  String activePowerRegulation;
  String reactivePowerRegulation;
  String powerFactorRegulation;
  String shadowScanEnable;
  String lvrtEnable;
  String islandProtectionEnable;
  String overloadReset;
  String genSignal;
  String gridSignal;
  String smallLoadSet;
  String genConnectToGridInput;
  String genMaxRunTime;
  String genDownTime;
  String bmsStop;
  String arcSetup;
  String modbusAddress;
  String gfdTurnOff;
  String leakageTurnOff;
  String beep;
  String ctDisable;
  String drm;

  AdvancedSet({
    this.setRtcTime = 'Text',
    this.setMeterComAddress = '0',
    this.ctRatioSetting = '0',
    this.parallelAddressSetting = '0',
    this.totalParallelSetting = '0',
    this.pvStartOffline = 'Disable',
    this.activePowerRegulation = '0',
    this.reactivePowerRegulation = '0',
    this.powerFactorRegulation = '0',
    this.shadowScanEnable = 'Enable',
    this.lvrtEnable = 'Enable',
    this.islandProtectionEnable = 'Enable',
    this.overloadReset = 'Enable',
    this.genSignal = 'Disable',
    this.gridSignal = 'Disable',
    this.smallLoadSet = 'Generator Input',
    this.genConnectToGridInput = 'Disable',
    this.genMaxRunTime = '0.0hour',
    this.genDownTime = '0.0hour',
    this.bmsStop = 'Disable',
    this.arcSetup = 'Disable',
    this.modbusAddress = '0',
    this.gfdTurnOff = 'Disable',
    this.leakageTurnOff = 'Disable',
    this.beep = 'Disable',
    this.ctDisable = 'Disable',
    this.drm = 'Disable',
  });
}

class AdvancedSetWidget extends StatelessWidget {
  const AdvancedSetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RemoteControlProvider>(
      builder: (context, provider, child) {
        return Column(
          spacing: 12.ph,
          children: [
            /// TextFieldDialog for RTC Time
            AppTextFieldDialog2Widget(
              title: 'Set RTC Time',
              value: provider.advancedSet.setRtcTime,
              onTap: () {
                provider.onSetRTCTimeTap(context);
              },
            ),

            /// AppTextFieldDialog2Widget for Meter COM Address
            AppTextFieldDialog2Widget(
              title: 'Set Meter COM Address',
              value: provider.advancedSet.setMeterComAddress,
              onTap: () {
                provider.onSetMeterCOMAddressTap(context);
              },
            ),

            /// AppTextFieldDialog2Widget for CT Ratio Setting
            AppTextFieldDialog2Widget(
              title: 'CT Ratio Setting',
              value: provider.advancedSet.ctRatioSetting,
              onTap: () {
                provider.onCTRatioSettingTap(context);
              },
            ),

            /// AppTextFieldDialog2Widget for Parallel Address Setting
            AppTextFieldDialog2Widget(
              title: 'Parallel Address Setting',
              value: provider.advancedSet.parallelAddressSetting,
              onTap: () {
                provider.onParallelAddressSettingTap(context);
              },
            ),

            /// AppTextFieldDialog2Widget for Total Parallel Setting
            AppTextFieldDialog2Widget(
              title: 'Total number in parallel Setting',
              value: provider.advancedSet.totalParallelSetting,
              onTap: () {
                provider.onTotalParallelSettingTap(context);
              },
            ),

            /// Dropdown for PV Start Offline
            AppDropDownMenuWidget(
              title: 'PV_start-offline',
              context: context,
              value: provider.advancedSet.pvStartOffline,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onPvStartOffline(value!),
            ),

            /// AppTextFieldDialog2Widget for Active Power Regulation
            AppTextFieldDialog2Widget(
              title: 'Active Power Regulation',
              value: provider.advancedSet.activePowerRegulation,
              onTap: () {
                provider.onActivePowerRegulationTap(context);
              },
            ),

            /// AppTextFieldDialog2Widget for Reactive Power Regulation
            AppTextFieldDialog2Widget(
              title: 'Reactive Power Regulation',
              value: provider.advancedSet.reactivePowerRegulation,
              onTap: () {
                provider.onReactivePowerRegulationTap(context);
              },
            ),

            /// AppTextFieldDialog2Widget for Power Factor Regulation
            AppTextFieldDialog2Widget(
              title: 'Power Factor Regulation',
              value: provider.advancedSet.powerFactorRegulation,
              onTap: () {
                provider.onPowerFactorRegulationTap(context);
              },
            ),

            /// Dropdown for Shadow Scan Enable
            AppDropDownMenuWidget(
              title: 'Shadow Scan enable',
              context: context,
              value: provider.advancedSet.shadowScanEnable,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onShadowScanEnable(value!),
            ),

            /// Dropdown for LVRT Enable
            AppDropDownMenuWidget(
              title: 'LVRT Enable',
              context: context,
              value: provider.advancedSet.lvrtEnable,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onLVRTEnable(value!),
            ),

            /// Dropdown for Island Protection Enable
            AppDropDownMenuWidget(
              title: 'Island Protection enable',
              context: context,
              value: provider.advancedSet.islandProtectionEnable,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onIslandProtectionEnable(value!),
            ),

            /// Dropdown for Overload Reset
            AppDropDownMenuWidget(
              title: 'Overload Reset',
              context: context,
              value: provider.advancedSet.overloadReset,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onOverloadReset(value!),
            ),

            /// Dropdown for Gen Signal
            AppDropDownMenuWidget(
              title: 'Gen Signal',
              context: context,
              value: provider.advancedSet.genSignal,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onGenSignal(value!),
            ),

            /// Dropdown for Grid Signal
            AppDropDownMenuWidget(
              title: 'Grid Signal',
              context: context,
              value: provider.advancedSet.gridSignal,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onGridSignal(value!),
            ),

            /// Dropdown for Small Load Set
            AppDropDownMenuWidget(
              title: 'Small Load Set',
              context: context,
              value: provider.advancedSet.smallLoadSet,
              options: ['Generator Input', 'Disable', 'Enable'],
              onChanged: (value) => provider.onSmallLoadSet(value!),
            ),

            /// Dropdown for GEN connect to Grid input
            AppDropDownMenuWidget(
              title: 'GEN connect to Grid input',
              context: context,
              value: provider.advancedSet.genConnectToGridInput,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onGenConnectGridInput(value!),
            ),

            /// AppTextFieldDialog2Widget for Gen Max Run Time
            AppTextFieldDialog2Widget(
              title: 'Gen Max Run Time',
              value: provider.advancedSet.genMaxRunTime,
              onTap: () {
                provider.onGenMaxRunTimeTap(context);
              },
            ),

            /// AppTextFieldDialog2Widget for Gen Down Time
            AppTextFieldDialog2Widget(
              title: 'Gen Down Time',
              value: provider.advancedSet.genDownTime,
              onTap: () {
                provider.onGenDownTimeTap(context);
              },
            ),

            /// Dropdown for BMS Stop
            AppDropDownMenuWidget(
              title: 'BMS Stop',
              context: context,
              value: provider.advancedSet.bmsStop,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onBMSStop(value!),
            ),

            /// Dropdown for ARC Setup
            AppDropDownMenuWidget(
              title: 'ARC Setup',
              context: context,
              value: provider.advancedSet.arcSetup,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onARCSetup(value!),
            ),

            /// AppTextFieldDialog2Widget for Modbus Address
            AppTextFieldDialog2Widget(
              title: 'Modbus Address',
              value: provider.advancedSet.modbusAddress,
              onTap: () {
                provider.onModbusAddressTap(context);
              },
            ),

            /// Dropdown for GFD Turn Off
            AppDropDownMenuWidget(
              title: 'GFD turn off',
              context: context,
              value: provider.advancedSet.gfdTurnOff,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onGFDTurnOff(value!),
            ),

            /// Dropdown for Leakage Turn Off
            AppDropDownMenuWidget(
              title: 'Leakage turn off',
              context: context,
              value: provider.advancedSet.leakageTurnOff,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onLeakageTurnOff(value!),
            ),

            /// Dropdown for Beep
            AppDropDownMenuWidget(
              title: 'Beep',
              context: context,
              value: provider.advancedSet.beep,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onBeepTap(value!),
            ),

            /// Dropdown for CT Disable
            AppDropDownMenuWidget(
              title: 'CT Disable',
              context: context,
              value: provider.advancedSet.ctDisable,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onCtDisable(value!),
            ),

            /// Dropdown for DRM
            AppDropDownMenuWidget(
              title: 'DRM',
              context: context,
              value: provider.advancedSet.drm,
              options: ['Enable', 'Disable'],
              onChanged: (value) => provider.onDRM(value!),
            ),
          ],
        );
      },
    );
  }
}
