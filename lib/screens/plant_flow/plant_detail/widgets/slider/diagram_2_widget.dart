import 'package:qbits/qbits.dart';

class Diagram2Widget extends StatelessWidget {
  const Diagram2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.pw, vertical: 30.ph),
      decoration: BoxDecoration(color: ColorRes.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///Solar
              buildIconWithText(
                title: 'Solar',
                value: '0kw',
                imagePath: AssetRes.greenSolar2Icon,
                isIconPrefix: true,
              ),

              ///Grid
              buildIconWithText(
                title: 'Grid',
                value: '0kw',
                imagePath: AssetRes.gridIcon,
                isIconPrefix: false,
              ),
            ],
          ),

          ///Space
          16.ph.spaceVertical,

          /// Diagram Icon
          SvgAsset(imagePath: AssetRes.diagram1Icon),

          /// Space
          10.ph.spaceVertical,

          /// Load
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///Solar
              buildIconWithText(
                title: 'Battery',
                value: '0kw',
                imagePath: AssetRes.batteryIcon,
                isIconPrefix: true,
              ),

              ///Grid
              buildIconWithText(
                title: 'Load',
                value: '0kw',
                imagePath: AssetRes.loadIcon,
                isIconPrefix: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildIconWithText({
    required String imagePath,
    required String title,
    required String value,
    required bool isIconPrefix,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Icon
        if (isIconPrefix) SvgAsset(imagePath: imagePath),

        /// Space
        14.pw.spaceHorizontal,

        /// Text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Text(title, style: styleW400S12.copyWith(color: ColorRes.black)),

            ///Space
            5.ph.spaceVertical,

            /// Value
            Text(value, style: styleW600S14.copyWith(color: ColorRes.black)),
          ],
        ),

        /// Space
        if (!isIconPrefix)
          /// Icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Space
              14.pw.spaceHorizontal,

              /// Icon
              SvgAsset(imagePath: imagePath, ),
            ],
          ),
      ],
    );
  }
}
