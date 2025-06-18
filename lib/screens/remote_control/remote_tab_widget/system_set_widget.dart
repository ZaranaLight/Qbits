import 'package:qbits/qbits.dart';

class SystemSettings {
  String switchOnOffEnable;
  String runMode;
  String workMode;
  String refluxUplinkPower;
  String solarSell;
  String weekSell;
  String maxSellPower;
  String energyMode;
  String offlineMode;
  String gridPeakShave;
  String gridPeakShavePower;

  SystemSettings({
    this.switchOnOffEnable = 'OFF',
    this.runMode = 'Manual',
    this.workMode = 'Anti-reflux to grid',
    this.refluxUplinkPower = '0KW',
    this.solarSell = 'Disable',
    this.weekSell = '[0]',
    this.maxSellPower = '0KW',
    this.energyMode = 'Battery First',
    this.offlineMode = 'Disable',
    this.gridPeakShave = 'Disable',
    this.gridPeakShavePower = '0W',
  });
}

class SystemSetWidget extends StatelessWidget {
  const SystemSetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RemoteControlProvider>(
      builder: (context, provider, child) {
        return Container(
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            spacing: 12.ph,

            children: [
              // Run Mode
              _buildDropdownTile(
                context,
                'Switch ON and OFF enable',
                provider.settings.switchOnOffEnable,
                ['ON', 'OFF'],
                (value) => provider.updateOnOffEnable(value!),
              ),

              // Run Mode
              _buildDropdownTile(
                context,
                'Run Mode',
                provider.settings.runMode,
                ['Text', 'Auto', 'Manual'],
                (value) => provider.updateRunMode(value!),
              ),

              // Work Mode
              _buildDropdownTile(
                context,
                'Work Mode',
                provider.settings.workMode,
                ['Anti-reflux to grid', 'Grid-tie', 'Off-grid'],
                (value) => provider.updateWorkMode(value!),
              ),

              // Reflux Uplink Power
              _buildInfoTile(
                'Reflux Uplink Power',
                provider.settings.refluxUplinkPower,
                () {
                  provider.onRefluxUplinkPower(context);
                },
              ),

              // Solar Sell
              _buildDropdownTile(
                context,
                'Solar Sell',
                provider.settings.solarSell,
                ['Disable', 'Enable'],
                (value) => provider.updateSolarSell(value!),
              ),

              // Week Sell
              _buildDropdownTile(
                context,
                'Week Sell',
                provider.settings.weekSell,
                ['[0]', '[1]', '[2]', '[3]', '[4]', '[5]', '[6]'],
                (value) => provider.updateWeekSell(value!),
              ),

              // Max Sell Power
              _buildInfoTile(
                'Max Sell Power',
                provider.settings.maxSellPower,
                () {
                  provider.onMaxSellPower(context);
                },
              ),

              // Energy Mode
              _buildDropdownTile(
                context,
                'Energy Mode',
                provider.settings.energyMode,
                ['Load First', 'Battery First', 'Grid First'],
                (value) => provider.updateEnergyMode(value!),
              ),

              // Off-line Mode
              _buildDropdownTile(
                context,
                'Off-line Mode',
                provider.settings.offlineMode,
                ['Disable', 'Enable'],
                (value) => provider.updateOfflineMode(value!),
              ),

              // Grid Peak-shave
              _buildDropdownTile(
                context,
                'Grid Peak-shave',
                provider.settings.gridPeakShave,
                ['Disable', 'Enable'],
                (value) => provider.updateGridPeakShave(value!),
              ),

              // Grid Peak-shave Power
              _buildInfoTile(
                'Grid Peak-shave Power',
                provider.settings.gridPeakShavePower,
                () {
                  provider.onGridPeakShavePower(context);
                },
              ),
            ],
          ),
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

  Widget _buildInfoTile(String title, String value, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 42.ph,
        decoration: BoxDecoration(
          color: ColorRes.black.withValues(alpha: 0.05),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.pw, vertical: 10.ph),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: styleW600S14),
            Text(
              value,
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
