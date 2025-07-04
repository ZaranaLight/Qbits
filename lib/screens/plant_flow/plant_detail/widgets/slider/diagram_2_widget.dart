import 'package:qbits/qbits.dart';

class Diagram2Widget extends StatelessWidget {
  const Diagram2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.pw,
        right: 16.pw,
        top: 30.ph,
        bottom: 50.ph,
      ),
      decoration: BoxDecoration(color: ColorRes.white),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Prevent vertical overflow
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Title
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///Solar
              Expanded(
                child: buildIconWithText(
                  title: 'Solar',
                  value: '0kw',
                  imagePath: AssetRes.greenSolar2Icon,
                  isIconPrefix: true,
                  isTwoItems: true,
                  isRtl: false,
                  isNotCenter: true,
                ),
              ),

              ///Grid
              Expanded(
                child: buildIconWithText(
                  title: 'Grid',
                  value: '0kw',
                  imagePath: AssetRes.gridIcon,
                  isIconPrefix: false,
                  isTwoItems: true,
                  isRtl: true,
                  isNotCenter: true,
                ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Solar
              Expanded(
                child: buildIconWithText(
                  title: 'Battery',
                  value: '0kw',
                  imagePath: AssetRes.batteryIcon,
                  isIconPrefix: true,
                  isTwoItems: true,
                  isRtl: false,
                  isNotCenter: true,
                ),
              ),

              ///Grid
              Expanded(
                child: buildIconWithText(
                  title: 'Load',
                  value: '0kw',
                  imagePath: AssetRes.loadIcon,
                  isIconPrefix: false,
                  isTwoItems: true,
                  isRtl: true,
                  isNotCenter: true,
                ),
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
    bool isRtl = false,
    bool isTwoItems = false,
    bool isNotCenter = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment:
            isNotCenter
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isIconPrefix) SvgAsset(imagePath: imagePath),

          if (isIconPrefix) 14.pw.spaceHorizontal,

          /// Use Expanded instead of Flexible to take remaining space
          isTwoItems
              ? Expanded(
                child: Column(
                  crossAxisAlignment:
                      isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    ///Title
                    Text(
                      title,
                      textAlign: isRtl ? TextAlign.end : TextAlign.start,
                      style: styleW400S12.copyWith(color: ColorRes.black),
                    ),

                    ///Space
                    5.ph.spaceVertical,

                    ///Value
                    Text(
                      value,
                      textAlign: isRtl ? TextAlign.end : TextAlign.start,
                      style: styleW600S14.copyWith(color: ColorRes.black),
                    ),
                  ],
                ),
              )
              : Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ///Title
                    Text(
                      title,
                      textAlign: TextAlign.end,
                      style: styleW400S12.copyWith(color: ColorRes.black),
                    ),

                    ///Space
                    5.ph.spaceVertical,

                    ///Value
                    Text(
                      value,
                      style: styleW600S14.copyWith(color: ColorRes.black),
                    ),
                  ],
                ),
              ),

          if (!isIconPrefix) 14.pw.spaceHorizontal,

          if (!isIconPrefix) SvgAsset(imagePath: imagePath),
        ],
      ),
    );
  }
}
