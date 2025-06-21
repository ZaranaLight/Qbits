import 'package:qbits/qbits.dart';

class MeterWidget extends StatelessWidget {
  const MeterWidget({super.key});

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
              ColumKeyValueWidget(
                label: context.l10n?.power ?? "",
                value: '0kW',
              ),

            ],
          ),

          ///Space
          20.ph.spaceVertical,

          /// Data Row
          Row(
            children: [
              ColumKeyValueWidget(label: context.l10n?.totalPower, value: '0kW'),
              ColumKeyValueWidget(
                label: context.l10n?.status,
                value: '0kW',
              ),
            ],
          ),

        

        ],
      ),
    );
  }
}
