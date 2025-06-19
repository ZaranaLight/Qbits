import 'package:qbits/qbits.dart';
import 'package:qbits/screens/remote_control/widget/multiple_check_dialog_widget.dart';

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
              DropdownWidget(
                title: 'Switch ON and OFF enable',
                context: context,
                value: provider.settings.switchOnOffEnable,
                options: ['ON', 'OFF','hjkhjkhjkhjkhjkhjhjhjhjhjhjhjhjhjhjhjkhkhjhjkhjkhjkhjkhjkhkjhkjhkhjkhjkh'],
                onChanged: (value) => provider.updateOnOffEnable(value!),
              ),

              ///Run Mode
              DropdownWidget(
                title: 'Run Mode',
                context: context,
                value: provider.settings.runMode,
                options: ['Text', 'Auto', 'Manual'],
                onChanged: (value) => provider.updateRunMode(value!),
              ),

              ///Work Mode
              DropdownWidget(
                title: 'Work Mode',
                context: context,
                value: provider.settings.workMode,
                options: ['Anti-reflux to grid', 'Grid-tie', 'Off-grid'],
                onChanged: (value) => provider.updateWorkMode(value!),
              ),

              ///Reflux Uplink Power
              TextFieldDialog(
                title: 'Reflux Uplink Power',
                value: provider.settings.refluxUplinkPower,
                onTap: () {
                  provider.onRefluxUplinkPower(context);
                },
              ),

              ///Solar Sell
              DropdownWidget(
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
              TextFieldDialog(
                title: 'Max Sell Power',
                value: provider.settings.maxSellPower,
                onTap: () {
                  provider.onMaxSellPower(context);
                },
              ),

              ///Energy Mode
              DropdownWidget(
                title: 'Energy Mode',
                context: context,
                value: provider.settings.energyMode,
                options: ['Load First', 'Battery First', 'Grid First'],
                onChanged: (value) => provider.updateEnergyMode(value!),
              ),

              ///Off-line Mode
              DropdownWidget(
                title: 'Off-line Mode',
                context: context,
                value: provider.settings.offlineMode,
                options: ['Disable', 'Enable'],
                onChanged: (value) => provider.updateOfflineMode(value!),
              ),

              ///Grid Peak-shave
              DropdownWidget(
                title: 'Grid Peak-shave',
                context: context,
                value: provider.settings.gridPeakShave,
                options: ['Disable', 'Enable'],
                onChanged: (value) => provider.updateGridPeakShave(value!),
              ),

              ///Grid Peak-shave Power
              TextFieldDialog(
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
