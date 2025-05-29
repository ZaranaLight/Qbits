import 'package:qbits/qbits.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSingleChildScroll(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Space between tabs and content
          16.ph.spaceVertical,

          Container(
            decoration: BoxDecoration(color: ColorRes.white),

            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.horizontalPadding,
                    vertical: Constants.horizontalPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.l10n?.plantInfo ?? "", style: styleW500S16),
                      SvgAsset(
                        imagePath: AssetRes.forwardIcon,
                        color: ColorRes.black.withValues(alpha: 0.3),
                      ),
                    ],
                  ),
                ),

                ///Divider
                Divider(
                  height: 0,
                  color: ColorRes.black.withValues(alpha: 0.1),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.horizontalPadding,
                  ),
                  child: Column(
                    children: [
                      /// Space
                      16.pw.spaceVertical,

                      RowWidget(title: context.l10n?.address, value: "text"),

                      /// Space
                      16.pw.spaceVertical,

                      RowWidget(
                        title: context.l10n?.capacity,
                        value: "20.02kW",
                      ),

                      /// Space
                      16.pw.spaceVertical,

                      RowWidget(
                        title: context.l10n?.stationType,
                        value: "Solar System",
                      ),

                      /// Space
                      16.pw.spaceVertical,

                      RowWidget(title: context.l10n?.longitude, value: "0"),

                      /// Space
                      16.pw.spaceVertical,

                      RowWidget(title: context.l10n?.latitude, value: "0"),

                      /// Space
                      16.pw.spaceVertical,

                      /// Owner Details
                      RowWidget(
                        title: context.l10n?.ownerPhone,
                        trailingWidget: Align(
                          alignment: Alignment.topRight,
                          child: SvgAsset(
                            imagePath: AssetRes.phoneIcon,
                            color: ColorRes.primaryColor,
                          ),
                        ),
                      ),

                      /// Space
                      16.pw.spaceVertical,
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// Space
          20.ph.spaceVertical,
        ],
      ),
    );
  }
}
