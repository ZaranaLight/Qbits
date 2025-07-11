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
              AppTextFieldDialog2Widget(
                title: 'Grid Standard',
                value: provider.gridSet.gridStandard,
                onTap: () {
                  provider.onGridStandard(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Grid Frequency Setting',
                value: provider.gridSet.gridFrequencySetting,
                onTap: () {
                  provider.onFrequencySetting(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Grid Voltage Upper limit',
                value: provider.gridSet.gridVoltageUpperLimit,
                onTap: () {
                  provider.onGridVoltageUpperLimit(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Grid Voltage Lower limit',
                value: provider.gridSet.gridVoltageLowerLimit,
                onTap: () {
                  provider.onGridVoltageLowerLimit(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Grid Frequency Upper limit',
                value: provider.gridSet.gridFrequencyUpperLimit,
                onTap: () {
                  provider.onGridFrequencyUpperLimit(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Grid Frequency Lower limit',
                value: provider.gridSet.gridFrequencyLowerLimit,
                onTap: () {
                  provider.onGridFrequencyLowerLimit(context);
                },
              ),
              AppTextFieldDialog2Widget(
                title: 'Reconnect Delay',
                value: provider.gridSet.reconnectDelay,
                onTap: () {
                  provider.onReconnectDelay(context);
                },
              ),
              AppTextFieldDialog2Widget(
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
}
