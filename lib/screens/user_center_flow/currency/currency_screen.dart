import 'package:qbits/qbits.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  static const routeName = "currency";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<CurrencyProvider>(
      create: (c) => CurrencyProvider(),
      child: CurrencyScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(title: context.l10n?.currency ?? ""),
      body: CustomSingleChildScroll(
        padding: EdgeInsets.only(
          left: Constants.horizontalPadding,
          right: Constants.horizontalPadding,
          bottom:
              Constants.safeAreaPadding.bottom + 16.ph,
          top: 10.ph,
        ),
        child: Column(
          children: [
            ///End User Tab
            _CurrencyTabWidget(
              title: context.l10n?.endUser ?? "",
              imagePath: AssetRes.profileIcon,
              onTap: () {
                context.navigator.pushNamed(EndUserScreen.routeName);
              },
            ),

            ///Divider
            Divider(color: ColorRes.black.withValues(alpha: 0.1), height: 0),

            ///Service Provider Tab
            _CurrencyTabWidget(
              title: context.l10n?.qa ?? "",
              imagePath: AssetRes.searchIcon,
              onTap: () {
                context.navigator.pushNamed(QaScreen.routeName);
              },
            ),

            ///Divider
            Divider(color: ColorRes.black.withValues(alpha: 0.1), height: 0),

            /// Service Provider Tab
            _CurrencyTabWidget(
              title: context.l10n?.noEquipment ?? "",
              imagePath: AssetRes.deleteIcon,
              onTap: () {},
            ),

            ///Divider
            Divider(color: ColorRes.black.withValues(alpha: 0.1), height: 0),

            ///Privacy Policy Tab
            _CurrencyTabWidget(
              title: context.l10n?.privacyPolicy ?? "",
              imagePath: AssetRes.infoIcon,
              onTap: () {},
            ),

            ///Divider
            Divider(color: ColorRes.black.withValues(alpha: 0.1), height: 0),

            ///Operation Guide Tab
            _CurrencyTabWidget(
              title: context.l10n?.operationGuide ?? "",
              imagePath: AssetRes.helpIcon,
              onTap: () {},
            ),

            ///Divider
            Divider(color: ColorRes.black.withValues(alpha: 0.1), height: 0),
          ],
        ),
      ),
    );
  }
}

class _CurrencyTabWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const _CurrencyTabWidget({
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Constants.horizontalPadding,
          horizontal: 5.pw,
        ),
        child: Column(
          children: [
            Row(
              children: [
                SvgAsset(
                  imagePath: imagePath,
                  width: 20.pw,
                  height: 20.ph,
                  color: ColorRes.black,
                ),
                10.ph.spaceHorizontal,
                Text(title, style: styleW600S16),
                Spacer(),
                SvgAsset(
                  imagePath: AssetRes.rightArrowIcon,
                  color: ColorRes.black.withValues(alpha: 0.6),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
