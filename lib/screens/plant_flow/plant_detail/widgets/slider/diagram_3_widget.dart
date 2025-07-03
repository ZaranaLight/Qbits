import 'package:qbits/qbits.dart';

class Diagram3Widget extends StatelessWidget {
  const Diagram3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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

              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgAsset(imagePath: AssetRes.greenSolarPlateIcon),
                    40.ph.spaceVertical,
                    SvgAsset(imagePath: AssetRes.dashIcon),
                    40.ph.spaceVertical,
                    SvgAsset(imagePath: AssetRes.solarPlateIcon),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
