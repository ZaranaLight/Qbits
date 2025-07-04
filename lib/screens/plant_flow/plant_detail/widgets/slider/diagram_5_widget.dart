import 'package:qbits/qbits.dart';

class Diagram5Widget extends StatelessWidget {
  const Diagram5Widget({super.key});

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
            title: 'Daily Energy Charged',
            title2: 'Monthly Energy Charged',
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
                    imagePath: AssetRes.greenBatteryIcon2,
                    height: 50.ph,
                    width: 50.ph,
                  ),
                ),
              ],
            ),
          ),
          RowWithTitleAndValueWidget(
            value: '0.0',
            title: 'Yearly Energy Charged',
            title2: 'Total Energy Charged',
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
            title: 'Daily Energy Discharged',
            title2: 'Month Energy Discharge',
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
                    imagePath: AssetRes.redBatteryIcon2,
                    height: 50.ph,
                    width: 50.ph,
                  ),
                ),
              ],
            ),
          ),
          RowWithTitleAndValueWidget(
            value: '0.0',
            title: 'Yearly Energy Discharged',
            title2: 'Total Energy Discharged',
            value2: '0.0',
          ),
        ],
      ),
    );
  }
}
