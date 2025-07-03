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
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Title
          Column(
            spacing: 24.ph,
            children: [
              RowWithTitleAndValueWidget(
                value: '0.0',
                title: 'Daily Grid Feed-in',
                title2: 'Monthly Grid Feed-in',
                value2: '0.0',
              ),
              RowWithTitleAndValueWidget(
                value: '0.0',
                title: 'Yearly Grid Feed-in',
                title2: 'Total Grid Feed-in',
                value2: '0.0',
              ),

              RowWithTitleAndValueWidget(
                value: '0.0',
                title: 'Daily Energy Purchased',
                title2: 'Monthly Energy Purchased',
                value2: '0.0',
              ),
              RowWithTitleAndValueWidget(
                value: '0.0',
                title: 'Yearly Energy Purchased',
                title2: 'Total Energy Purchased',
                value2: '0.0',
              ),
            ],
          ),

          /// Dash Icon
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgAsset(imagePath: AssetRes.greenGridIcon),
                40.ph.spaceVertical,
                SvgAsset(imagePath: AssetRes.dashIcon),
                40.ph.spaceVertical,
                SvgAsset(imagePath: AssetRes.redGridIcon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
