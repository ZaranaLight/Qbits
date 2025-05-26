import 'package:qbits/qbits.dart';
import 'package:qbits/screens/auth/role_choice/role_choice_provider.dart';

class RoleChoiceScreen extends StatelessWidget {
  const RoleChoiceScreen({super.key});

  static const routeName = "role_choice_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<RoleChoiceProvider>(
      create: (c) => RoleChoiceProvider(),
      child: RoleChoiceScreen(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.l10n?.roleChoice ?? ""),
      body: CustomSingleChildScroll(
        padding: EdgeInsets.symmetric(
          vertical: Constants.safeAreaPadding.bottom + 20.pw,
          horizontal: 16.pw,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Text(context.l10n?.pleaseSelectYourRole ?? "", style: styleW600S16),

            /// Space
            20.ph.spaceVertical,

            /// Role Choice Buttons For Individual
            RoleChoiceButtons(
              imagePath: AssetRes.userIcon,
              title: context.l10n?.individual ?? "",
              role: context.l10n?.stationOwner ?? "",
              onTap: () {},
            ),

            /// Space
            20.pw.spaceVertical,

            /// Role Choice Buttons For Company
            RoleChoiceButtons(
              imagePath: AssetRes.groupUserIcon,
              title: context.l10n?.company ?? "",
              role: context.l10n?.installer ?? "",
              onTap: () {},
            ),

            /// Space
            40.pw.spaceVertical,

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ///Guidance Button
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(31.pw),
                    color: ColorRes.primaryColor,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.pw,
                    vertical: 6.pw,
                  ),
                  child: Center(
                    child: Text(
                      context.l10n?.guidance ?? "",
                      style: styleW500S14.copyWith(color: ColorRes.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoleChoiceButtons extends StatelessWidget {
  final String title;
  final String role;
  final String imagePath;
  final VoidCallback onTap;

  const RoleChoiceButtons({
    super.key,
    required this.title,
    required this.role,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.pw),
      child: Container(
        height: 113.pw,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.pw),
          color: ColorRes.black.withValues(alpha: 0.04),
          border: Border.all(color: ColorRes.black.withValues(alpha: 0.1)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.pw, vertical: 30.pw),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// User Icon
            SvgAsset(imagePath: imagePath, width: 54.pw),

            ///Space
            100.pw.spaceHorizontal,

            /// Individual and Station Owner Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Individual Text
                  Text(title, style: styleW500S16),

                  ///Space
                  6.pw.spaceVertical,

                  /// Role Text
                  Text(
                    role,
                    style: styleW400S14.copyWith(
                      color: ColorRes.black.withValues(alpha: 0.4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
