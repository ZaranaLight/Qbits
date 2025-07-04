import 'package:qbits/qbits.dart';

class Diagram4Widget extends StatelessWidget {
  const Diagram4Widget({super.key});

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
            title: 'Daily Grid Feed-in',
            title2: 'Monthly Grid Feed-in',
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
                    imagePath: AssetRes.greenGridIcon,
                    height: 50.ph,
                    width: 50.ph,
                  ),
                ),
              ],
            ),
          ),
          RowWithTitleAndValueWidget(
            value: '0.0',
            title: 'Yearly Grid Feed-in',
            title2: 'Total Grid Feed-in',
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
            title: 'Daily Energy Purchased',
            title2: 'Monthly Energy Purchased',
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
                    imagePath: AssetRes.redGridIcon,
                    height: 50.ph,
                    width: 50.ph,
                  ),
                ),
              ],
            ),
          ),

          RowWithTitleAndValueWidget(
            value: '0.0',
            title: 'Yearly Energy Purchased',
            title2: 'Total Energy Purchased',
            value2: '0.0',
          ),
        ],
      ),
    );
  }
}
