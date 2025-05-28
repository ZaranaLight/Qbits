import 'package:qbits/qbits.dart';

class TotalPlantsContainer extends StatelessWidget {
  const TotalPlantsContainer({super.key});

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
              children: [
                Text(
                  context.l10n?.totalPlants ?? "",
                  style: styleW500S16.copyWith(
                    color: ColorRes.black.withValues(alpha: 60),
                  ),
                ),

                /// Space
                6.pw.spaceHorizontal,

                Text("7", style: styleW600S16),

                Spacer(),

                /// Forward Icon
                SvgAsset(imagePath: AssetRes.forwardIcon),
              ],
            ),
          ),

          Container(height: 1, color: ColorRes.black.withValues(alpha: 0.10)),

          _totalPlant(
            title: context.l10n?.normal ?? "",
            svg: AssetRes.doneIcon,
            value: "0",
          ),

          _totalPlant(
            title: context.l10n?.offline ?? "",
            svg: AssetRes.offlineIcon,
            value: "6",
          ),

          _totalPlant(
            title: context.l10n?.alarm ?? "",
            svg: AssetRes.exclamationIcon,
            value: "1",
          ),

          /// Space
          8.ph.spaceVertical,
        ],
      ),
    );
  }

  Widget _totalPlant({
    required String title,
    required String svg,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.pw, vertical: 12.ph),
      child: Row(
        children: [
          SvgAsset(imagePath: svg),

          10.pw.spaceHorizontal,

          Text(title, style: styleW500S16),

          Spacer(),

          Text(value, style: styleW500S16),

          4.pw.spaceHorizontal,

          SvgAsset(imagePath: AssetRes.forwardIcon),
        ],
      ),
    );
  }
}
