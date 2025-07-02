import 'package:qbits/qbits.dart';

class BatteryWidget extends StatelessWidget {
  const BatteryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorRes.white),
      margin: EdgeInsets.symmetric(horizontal: 14.pw),
      padding: EdgeInsets.symmetric(horizontal: 14.pw, vertical: 12.ph),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Data Row
          Row(
            children: [
              /// Voltage
              ColumKeyValueWidget(
                label: context.l10n?.voltage ?? "",
                value: '0kW',
              ),

              /// Space
              10.pw.spaceHorizontal,

              ///Current
              ColumKeyValueWidget(
                label: context.l10n?.current ?? "",
                value: '0kW',
              ),
            ],
          ),

          ///Space
          20.ph.spaceVertical,

          /// Data Row
          Row(
            children: [
              /// Power
              ColumKeyValueWidget(label: context.l10n?.power, value: '0kW'),

              /// Space
              10.pw.spaceHorizontal,

              /// Battery Capacity
              ColumKeyValueWidget(
                label: context.l10n?.batteryCapacity,
                value: '0kW',
              ),
            ],
          ),

          ///Space
          20.ph.spaceVertical,

          /// Data Row
          Row(
            children: [
              /// Working Status
              ColumKeyValueWidget(
                label: context.l10n?.workingStatus ?? "",
                value: '0kW',
              ),

              /// Space
              10.pw.spaceHorizontal,

              /// Test Status
              ColumKeyValueWidget(
                label: context.l10n?.testStatus ?? "",
                value: '0kW',
              ),
            ],
          ),

          ///Space
          20.ph.spaceVertical,

          /// Data Row
          Row(
            children: [
              /// BMS Status
              ColumKeyValueWidget(
                label: context.l10n?.bmsComStatus,
                value: '0kW',
              ),

              /// Space
              10.pw.spaceHorizontal,

              /// BMS Temperature
              ColumKeyValueWidget(
                label: context.l10n?.bmsTemperature,
                value: '0kW',
              ),
            ],
          ),

          ///Space
          20.ph.spaceVertical,

          /// Data Row
          Row(
            children: [
              /// BMS Voltage
              ColumKeyValueWidget(
                label: context.l10n?.bmsMaxChargingCurrent,
                value: '0kW',
              ),

              /// Space
              10.pw.spaceHorizontal,

              ///BMS Current
              ColumKeyValueWidget(
                label: context.l10n?.bmsMaxDischargingCurrent,
                value: '0kW',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
