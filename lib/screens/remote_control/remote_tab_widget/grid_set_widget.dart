import 'package:qbits/qbits.dart';

class GridSet {
  String gridStandard;
  String gridFrequencySetting;
  String gridVoltageUpperLimit;
  String gridVoltageLowerLimit;
  String gridFrequencyUpperLimit;
  String gridFrequencyLowerLimit;
  String reconnectDelay;
  String gridVoltage;

  GridSet({
    this.gridStandard = '0',
    this.gridFrequencySetting = '0.00',
    this.gridVoltageUpperLimit = '0.0V',
    this.gridVoltageLowerLimit = '0.0V',
    this.gridFrequencyUpperLimit = '0.00Hz',
    this.gridFrequencyLowerLimit = '0.00Hz',
    this.reconnectDelay = '0',
    this.gridVoltage = '0V',
  });
}

class GridSetWidget extends StatelessWidget {
  const GridSetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RemoteControlProvider>(
      builder: (context, provider, child) {
        return Container(
          color: ColorRes.white,
          child: Column(
            spacing: 12.ph,

            children: [
              _buildBatterySettingTile(
                title: 'Grid Standard',
                value: provider.gridSet.gridStandard,
                onTap: () {
                  provider.onGridStandard(context);
                },
              ),
              _buildBatterySettingTile(
                title: 'Grid Frequency Setting',
                value: provider.gridSet.gridFrequencySetting,
                onTap: () {
                  provider.onFrequencySetting(context);
                },
              ),
              _buildBatterySettingTile(
                title: 'Grid Voltage Upper limit',
                value: provider.gridSet.gridVoltageUpperLimit,
                onTap: () {
                  provider.onGridVoltageUpperLimit(context);
                },
              ),
              _buildBatterySettingTile(
                title: 'Grid Voltage Lower limit',
                value: provider.gridSet.gridVoltageLowerLimit,
                onTap: () {
                  provider.onGridVoltageLowerLimit(context);
                },
              ),
              _buildBatterySettingTile(
                title: 'Grid Frequency Upper limit',
                value: provider.gridSet.gridFrequencyUpperLimit,
                onTap: () {
                  provider.onGridFrequencyUpperLimit(context);
                },
              ),
              _buildBatterySettingTile(
                title: 'Grid Frequency Lower limit',
                value: provider.gridSet.gridFrequencyLowerLimit,
                onTap: () {
                  provider.onGridFrequencyLowerLimit(context);
                },
              ),
              _buildBatterySettingTile(
                title: 'Reconnect Delay',
                value: provider.gridSet.reconnectDelay,
                onTap: () {
                  provider.onReconnectDelay(context);
                },
              ),
              _buildBatterySettingTile(
                title: 'Grid Voltage',
                value: provider.gridSet.gridVoltage,
                onTap: () {
                  provider.onGridVoltage(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBatterySettingTile({
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
