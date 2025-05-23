import 'package:qbits/qbits.dart';

class DeviceLiberyContainer extends StatelessWidget {
  const DeviceLiberyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.pw, vertical: 16.ph),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n?.deviceLibery ?? "",
                  style: styleW500S16.copyWith(
                    color: ColorRes.black.withValues(alpha: 60),
                  ),
                ),

                /// Forward Icon
                SvgAsset(imagePath: AssetRes.forwardIcon),
              ],
            ),
          ),

          Container(height: 1, color: ColorRes.black.withValues(alpha: 0.10)),

          /// Space
          14.ph.spaceVertical,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.pw),
            child: Row(
              children: [
                Text(
                  "${context.l10n?.allQuantity ?? ""}: ",
                  style: styleW500S16.copyWith(color: ColorRes.darkGrey),
                ),
                Text(
                  "0",
                  style: styleW600S16.copyWith(color: ColorRes.darkGrey),
                ),
              ],
            ),
          ),

          /// Space
          13.ph.spaceVertical,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.pw, vertical: 20.ph),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _dotWidget(
                  color: ColorRes.parrot,
                  title: context.l10n?.online ?? "",
                  value: "0",
                  isRightSide: false,
                ),
                _dotWidget(
                  color: ColorRes.orange,
                  title: context.l10n?.offline ?? "",
                  value: "0",
                  isRightSide: false,
                ),
                _dotWidget(
                  color: ColorRes.pinkish,
                  title: context.l10n?.alarm ?? "",
                  value: "0",
                  isRightSide: true,
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.pw),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _dotWidget(
                  color: ColorRes.azureBlue,
                  title: context.l10n?.correlate ?? "",
                  value: "0",
                  isRightSide: false,
                ),
                _dotWidget(
                  color: ColorRes.mintBlue,
                  title: context.l10n?.uncorrelate ?? "",
                  value: "0",
                  isRightSide: true,
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              right: 20.pw,
              left: 20.pw,
              bottom: 20.ph,
              top: 11.ph,
            ),
            padding: EdgeInsets.symmetric(horizontal: 9.pw, vertical: 20.ph),
            decoration: BoxDecoration(
              color: ColorRes.primaryColor.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _activityWidget(
                  title: context.l10n?.dailyActivity ?? "",
                  value: "0",
                ),
                _activityWidget(
                  title: context.l10n?.monthlyActivity ?? "",
                  value: "0",
                ),
                _activityWidget(
                  title: context.l10n?.yearlyActivity ?? "",
                  value: "0",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dotWidget({
    required String title,
    required String value,
    required bool isRightSide,
    required Color color,
  }) {
    return Column(
      children: [
        Row(
          textDirection: isRightSide ? TextDirection.rtl : TextDirection.ltr,
          children: [
            /// Dot
            Container(
              height: 14.ph,
              width: 14.ph,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: color.withAlpha(20),
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            ),

            /// Space
            4.pw.spaceHorizontal,

            /// Title
            Text(title, style: styleW500S14),
          ],
        ),

        /// Space
        4.ph.spaceVertical,

        /// Value
        Text(value, style: styleW400S14),
      ],
    );
  }

  Widget _activityWidget({required String title, required String value}) {
    return Column(
      children: [
        /// Activity Title Text
        Text(title, style: styleW500S16),

        /// Space
        4.ph.spaceVertical,

        /// Activity Value Text
        Text(value, style: styleW600S16),
      ],
    );
  }
}
