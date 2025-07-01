import 'package:qbits/qbits.dart';

class RankDialogBox extends StatelessWidget {
  const RankDialogBox({super.key});

  static void show({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (con) {
        return ChangeNotifierProvider.value(
          value: context.read<PlantProvider>(),
          child: const RankDialogBox(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(
        context.l10n?.rank ?? "",
        style: styleW500S14.copyWith(color: ColorRes.primaryColor),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            10.ph.spaceVertical,
            _buildRow(title: context.l10n?.day ?? ""),
            _buildRow(title: context.l10n?.month ?? ""),
            _buildRow(title: context.l10n?.total ?? ""),
            _buildRow(title: context.l10n?.capacity ?? ""),
            _buildRow(title: context.l10n?.equative ?? ""),
          ],
        ),
      ),
    );
  }

  Widget _buildRow({required String title}) {
    return Consumer<PlantProvider>(
      builder: (_, provider, __) {
        final isAscSelected = provider.isRankSelected(title, true);
        final isDescSelected = provider.isRankSelected(title, false);
        return Container(
          width: 100.w,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: ColorRes.black.withValues(alpha: 0.1)),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.ph),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    provider.selectRank(title, true);
                  },
                  borderRadius: BorderRadius.circular(5),

                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text(
                          title,
                          style:
                              isAscSelected
                                  ? styleW600S14.copyWith(
                                    color: ColorRes.primaryColor,
                                  )
                                  : styleW500S14,
                        ),

                        /// Horizontal Space
                        2.pw.spaceHorizontal,

                        SvgAsset(
                          imagePath: AssetRes.longUpArrowIcon,
                          color: isAscSelected ? ColorRes.primaryColor : null,
                        ),
                      ],
                    ),
                  ),
                ),

                Spacer(),

                Text("-", style: styleW500S14),

                Spacer(),

                InkWell(
                  onTap: () {
                    provider.selectRank(title, false);
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text(
                          title,
                          style:
                              isDescSelected
                                  ? styleW600S14.copyWith(
                                    color: ColorRes.primaryColor,
                                  )
                                  : styleW500S14,
                        ),

                        /// Horizontal Space
                        2.pw.spaceHorizontal,

                        SvgAsset(
                          imagePath: AssetRes.longDownArrowIcon,
                          color: isDescSelected ? ColorRes.primaryColor : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
