import 'package:qbits/qbits.dart';

class RankDialogBox extends StatelessWidget {
  const RankDialogBox({super.key});

  static void show({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return ChangeNotifierProvider(
          create: (_) => PlantProvider(),
          child: const RankDialogBox(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
      ),
      title: Text(
        context.l10n?.rank ?? "",
        style: styleW500S14.copyWith(color: ColorRes.primaryColor),
      ),
      // contentPadding: EdgeInsets.symmetric(horizontal:  15.ph),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            /// Space
            15.ph.spaceVertical,
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
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 14.ph, bottom: 14.ph,left: 5.pw,right: 5.pw),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: ColorRes.black.withValues(alpha: 0.1)),
          ),
        ),
        child: Row(
          children: [
            Text(title, style: styleW500S14),

            /// Horizontal Space
            2.pw.spaceHorizontal,

            SvgAsset(imagePath: AssetRes.longUpArrowIcon),

            Spacer(),

            Text("-", style: styleW500S14),

            Spacer(),

            Text(title, style: styleW500S14),

            /// Horizontal Space
            2.pw.spaceHorizontal,

            SvgAsset(imagePath: AssetRes.longDownArrowIcon),
          ],
        ),
      ),
    );
  }
}
