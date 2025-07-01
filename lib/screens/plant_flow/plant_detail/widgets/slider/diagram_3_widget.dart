import 'package:qbits/qbits.dart';

class Diagram3Widget extends StatelessWidget {
  const Diagram3Widget({super.key});

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
                title: 'Daily Generation',
                title2: 'Monthly Generation',
                value2: '0.0',
              ),
              RowWithTitleAndValueWidget(
                value: '0.0',
                title: 'Yearly Generation',
                title2: 'Total Generation',
                value2: '0.0',
              ),

              RowWithTitleAndValueWidget(
                value: '0.0',
                title: 'Daily Consumption',
                title2: 'Monthly Consumption',
                value2: '0.0',
              ),
              RowWithTitleAndValueWidget(
                value: '0.0',
                title: 'Yearly Consumption',
                title2: 'Total Consumption',
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
