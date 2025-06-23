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
      insetPadding: EdgeInsets.zero,
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
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: ColorRes.black.withValues(alpha: 0.1)),
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.ph, horizontal: 0),

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
      ),
    );
  }
}
