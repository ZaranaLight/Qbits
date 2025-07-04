import 'package:qbits/qbits.dart';

class Diagram3Widget extends StatelessWidget {
  const Diagram3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorRes.white),
      padding: EdgeInsets.only(
        left: 16.pw,
        right: 16.pw,
        top: 30.ph,
        bottom: 50.ph,
      ),
      child: Column(
        children: [
          RowWithTitleAndValueWidget(
            value: '0.0',
            title: 'Daily Generation',
            title2: 'Monthly Generation',
            value2: '0.0 1 2 3 4 5 6 7 8 9 0',
          ),
          SizedBox(
            height: 24.ph,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  height: 50.ph,
                  width: 50.ph,
                  child: SvgAsset(
                    imagePath: AssetRes.greenSolarPlateIcon,
                    height: 50.ph,
                    width: 50.ph,
                  ),
                ),
              ],
            ),
          ),
          RowWithTitleAndValueWidget(
            value: '0.0',
            title: 'Yearly Generation',
            title2: 'Total Generation',
            value2: '0.0',
          ),

          /// Space
          12.ph.spaceVertical,

          /// Image
          SvgAsset(imagePath: AssetRes.dashIcon),

          /// Space
          12.ph.spaceVertical,

          RowWithTitleAndValueWidget(
            value: '0.0',
            title: 'Daily Consumption',
            title2: 'Monthly Consumption',
            value2: '0.0',
          ),
          SizedBox(
            height: 24.ph,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  height: 50.ph,
                  width: 50.ph,
                  child: SvgAsset(
                    imagePath: AssetRes.solarPlateIcon,
                    height: 50.ph,
                    width: 50.ph,
                  ),
                ),
              ],
            ),
          ),
          RowWithTitleAndValueWidget(
            value: '0.0',
            title: 'Yearly Consumption',
            title2: 'Total Consumption',
            value2: '0.0',
          ),
        ],
      ),
    );
  }
}
