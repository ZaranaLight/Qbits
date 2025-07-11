import 'package:qbits/qbits.dart';

class SystemSettings {
  String switchOnOffEnable;
  String runMode;
  String workMode;
  String refluxUplinkPower;
  String solarSell;
  List<String> weekSell;
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
    this.weekSell = const ['0'],
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
              ///Run Mode
              AppDropDownMenuWidget(
                title: 'Switch ON and OFF enable',
                context: context,
                value: provider.settings.switchOnOffEnable,
                options: [
                  'ON',
                  'OFF',
                  'hjkhjkhjkhjkhjkhjhjhjhjhjhjhjhjhjhjhjkhkhjhjkhjkhjkhjkhjkhkjhkjhkhjkhjkh',
                ],
                onChanged: (value) => provider.updateOnOffEnable(value!),
              ),

              ///Run Mode
              AppDropDownMenuWidget(
                title: 'Run Mode',
                context: context,
                value: provider.settings.runMode,
                options: ['Text', 'Auto', 'Manual'],
                onChanged: (value) => provider.updateRunMode(value!),
              ),

              ///Work Mode
              AppDropDownMenuWidget(
                title: 'Work Mode',
                context: context,
                value: provider.settings.workMode,
                options: ['Anti-reflux to grid', 'Grid-tie', 'Off-grid'],
                onChanged: (value) => provider.updateWorkMode(value!),
              ),

              ///Reflux Uplink Power
              AppTextFieldDialog2Widget(
                title: 'Reflux Uplink Power',
                value: provider.settings.refluxUplinkPower,
                onTap: () {
                  provider.onRefluxUplinkPower(context);
                },
              ),

              ///Solar Sell
              AppDropDownMenuWidget(
                title: 'Solar Sell',
                context: context,
                value: provider.settings.solarSell,
                options: ['Disable', 'Enable'],
                onChanged: (value) => provider.updateSolarSell(value!),
              ),

              /// Week Sell
              MultiSelectWeekSellWidget(
                options: provider.weekDayMap.keys.toList(),
                selected: provider.settings.weekSell,
                onChanged: provider.updateWeekSell,
              ),

              ///Max Sell Power
              AppTextFieldDialog2Widget(
                title: 'Max Sell Power',
                value: provider.settings.maxSellPower,
                onTap: () {
                  provider.onMaxSellPower(context);
                },
              ),

              ///Energy Mode
              AppDropDownMenuWidget(
                title: 'Energy Mode',
                context: context,
                value: provider.settings.energyMode,
                options: ['Load First', 'Battery First', 'Grid First'],
                onChanged: (value) => provider.updateEnergyMode(value!),
              ),

              ///Off-line Mode
              AppDropDownMenuWidget(
                title: 'Off-line Mode',
                context: context,
                value: provider.settings.offlineMode,
                options: ['Disable', 'Enable'],
                onChanged: (value) => provider.updateOfflineMode(value!),
              ),

              ///Grid Peak-shave
              AppDropDownMenuWidget(
                title: 'Grid Peak-shave',
                context: context,
                value: provider.settings.gridPeakShave,
                options: ['Disable', 'Enable'],
                onChanged: (value) => provider.updateGridPeakShave(value!),
              ),

              ///Grid Peak-shave Power
              AppTextFieldDialog2Widget(
                title: 'Grid Peak-shave Power',
                value: provider.settings.gridPeakShavePower,
                onTap: () {
                  provider.onGridPeakShavePower(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
