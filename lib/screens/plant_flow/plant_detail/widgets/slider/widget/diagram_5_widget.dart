import 'package:qbits/qbits.dart';

class Diagram5Widget extends StatelessWidget {
  const Diagram5Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorRes.white),
      padding: EdgeInsets.symmetric(horizontal: 16.pw, vertical: 24.ph),
      child: Stack(
        children: [
          /// Title
          Column(
            spacing: 24.ph,
            children: [
              RowWithTitleAndValueWidget(
                value: '0.0',
                title: 'Daily Energy Charged',
                title2: 'Monthly Energy Charged',
                value2: '0.0',
              ),
              RowWithTitleAndValueWidget(
                value: '0.0',
                title: 'Yearly Energy Charged',
                title2: 'Total Energy Charged',
                value2: '0.0',
              ),

              RowWithTitleAndValueWidget(
                value: '0.0',
                title: 'Daily Energy Discharged',
                title2: 'Month Energy Discharge',
                value2: '0.0',
              ),
              RowWithTitleAndValueWidget(
                value: '0.0',
                title: 'Yearly Energy Discharged',
                title2: 'Total Energy Discharged',
                value2: '0.0',
              ),
            ],
          ),

          /// Dash Icon
          Positioned(
            top: 15,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                /// Solar Plate Icon
                SvgAsset(imagePath: AssetRes.greenSolarPlateIcon),

                /// Space
                40.ph.spaceVertical,

                /// Dash Icon
                SvgAsset(imagePath: AssetRes.dashIcon),

                /// Space
                40.ph.spaceVertical,

                /// Solar Plate Icon
                SvgAsset(imagePath: AssetRes.solarPlateIcon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
