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
            _buildAdvancedSetTile(
              title: 'Set RTC Time',
              value: provider.advancedSet.setRtcTime,
              onTap: () {
                provider.onSetRTCTimeTap(context);
              },
            ),
            _buildAdvancedSetTile(
              title: 'Set Meter COM Address',
              value: provider.advancedSet.setMeterComAddress,
              onTap: () {
                provider.onSetMeterCOMAddressTap(context);
              },
            ),
            _buildAdvancedSetTile(
              title: 'CT Ratio Setting',
              value: provider.advancedSet.ctRatioSetting,
              onTap: () {
                provider.onCTRatioSettingTap(context);
              },
            ),
            _buildAdvancedSetTile(
              title: 'Parallel Address Setting',
              value: provider.advancedSet.parallelAddressSetting,
              onTap: () {
                provider.onParallelAddressSettingTap(context);
              },
            ),
            _buildAdvancedSetTile(
              title: 'Total number in parallel Setting',
              value: provider.advancedSet.totalParallelSetting,
              onTap: () {
                provider.onTotalParallelSettingTap(context);
              },
            ),

            _buildDropdownTile(
              context,
              'PV_start-offline',
              provider.advancedSet.pvStartOffline,
              ['Enable', 'Disable'],
              (val) => provider.onPvStartOffline(val!),
            ),
            _buildAdvancedSetTile(
              title: 'Active Power Regulation',
              value: provider.advancedSet.activePowerRegulation,
              onTap: () {
                provider.onActivePowerRegulationTap(context);
              },
            ),
            _buildAdvancedSetTile(
              title: 'Reactive Power Regulation',
              value: provider.advancedSet.reactivePowerRegulation,
              onTap: () {
                provider.onReactivePowerRegulationTap(context);
              },
            ),
            _buildAdvancedSetTile(
              title: 'Power Factor Regulation',
              value: provider.advancedSet.powerFactorRegulation,
              onTap: () {
                provider.onPowerFactorRegulationTap(context);
              },
            ),

            _buildDropdownTile(
              context,
              'Shadow Scan enable',
              provider.advancedSet.shadowScanEnable,
              ['Enable', 'Disable'],
              (val) => provider.onPvStartOffline(val!),
            ),
            _buildDropdownTile(
              context,
              'LVRT Enable',
              provider.advancedSet.lvrtEnable,
              ['Enable', 'Disable'],
              (val) => provider.onLVRTEnable(val!),
            ),
            _buildDropdownTile(
              context,
              'Island Protection enable',
              provider.advancedSet.islandProtectionEnable,
              ['Enable', 'Disable'],
              (val) => provider.onIslandProtectionEnable(val!),
            ),
            _buildDropdownTile(
              context,
              'Overload Reset',
              provider.advancedSet.overloadReset,
              ['Enable', 'Disable'],
              (val) => provider.onOverloadReset(val!),
            ),
            _buildDropdownTile(
              context,
              'Gen Signal',
              provider.advancedSet.genSignal,
              ['Enable', 'Disable'],
              (val) => provider.onGenSignal(val!),
            ),
            _buildDropdownTile(
              context,
              'Grid Signal',
              provider.advancedSet.gridSignal,
              ['Enable', 'Disable'],
              (val) => provider.onGridSignal(val!),
            ),
            _buildDropdownTile(
              context,
              'Small Load Set',
              provider.advancedSet.smallLoadSet,
              ['Generator Input', 'Disable', 'Enable'],
              (val) => provider.onSmallLoadSet(val!),
            ),
            _buildDropdownTile(
              context,
              'GEN connect to Grid input',
              provider.advancedSet.genConnectToGridInput,
              ['Enable', 'Disable'],
              (val) => provider.onGenConnectGridInput(val!),
            ),
            _buildAdvancedSetTile(
              title: 'Gen Max Run Time',
              value: provider.advancedSet.genMaxRunTime,
              onTap: () {
                provider.onGenMaxRunTimeTap(context);
              },
            ),
            _buildAdvancedSetTile(
              title: 'Gen Down Time',
              value: provider.advancedSet.genDownTime,
              onTap: () {
                provider.onGenDownTimeTap(context);
              },
            ),

            _buildDropdownTile(
              context,
              'BMS Stop',
              provider.advancedSet.bmsStop,
              ['Enable', 'Disable'],
              (val) => provider.onBMSStop(val!),
            ),
            _buildDropdownTile(
              context,
              'ARC Setup',
              provider.advancedSet.arcSetup,
              ['Enable', 'Disable'],
              (val) => provider.onARCSetup(val!),
            ),
            _buildAdvancedSetTile(
              title: 'Modbus Address',
              value: provider.advancedSet.modbusAddress,
              onTap: () {
                provider.onModbusAddressTap(context);
              },
            ),

            _buildDropdownTile(
              context,
              'GFD turn off',
              provider.advancedSet.gfdTurnOff,
              ['Enable', 'Disable'],
              (val) => provider.onGFDTurnOff(val!),
            ),
            _buildDropdownTile(
              context,
              'Leakage turn off',
              provider.advancedSet.leakageTurnOff,
              ['Enable', 'Disable'],
              (val) => provider.onLeakageTurnOff(val!),
            ),
            _buildDropdownTile(
              context,
              'Beep',
              provider.advancedSet.beep,
              ['Enable', 'Disable'],
              (val) => provider.onBeepTap(val!),
            ),
            _buildDropdownTile(
              context,
              'CT Disable',
              provider.advancedSet.ctDisable,
              ['Enable', 'Disable'],
              (val) => provider.onCtDisable(val!),
            ),
            _buildDropdownTile(context, 'DRM', provider.advancedSet.drm, [
              'Enable',
              'Disable',
            ], (val) => provider.onDRM(val!)),
          ],
        );
      },
    );
  }

  Widget _buildDropdownTile(
    BuildContext context,
    String title,
    String value,
    List<String> options,
    Function(String?) onChanged,
  ) {
    return Container(
      height: 42.ph,
      decoration: BoxDecoration(color: ColorRes.black.withValues(alpha: 0.05)),

      padding: EdgeInsets.symmetric(horizontal: 16.pw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: styleW600S14)),
          DropdownButton<String>(
            value: value,
            items:
                options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
            onChanged: onChanged,
            underline: SizedBox(),
            icon: Padding(
              padding: EdgeInsets.only(left: 8.pw),
              child: SvgAsset(
                imagePath: AssetRes.downArrowIcon,
                color: ColorRes.grey2,
              ),
            ),
            style: styleW600S14.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedSetTile({
    String? title,
    String? value,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 42.ph,
        color: ColorRes.black.withValues(alpha: 0.05),
        padding: EdgeInsets.symmetric(horizontal: 16.pw, vertical: 10.ph),
        margin: const EdgeInsets.only(bottom: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Title
            Text(title ?? "", style: styleW600S14.copyWith()),

            /// Value
            Text(
              value ?? "",
              style: styleW600S14.copyWith(
                color: ColorRes.black.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
