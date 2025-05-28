import 'package:qbits/qbits.dart';

class UserCenterScreen extends StatelessWidget {
  const UserCenterScreen({super.key});

  static const routeName = "user_center_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<UserCenterProvider>(
      create: (c) => UserCenterProvider(),
      child: UserCenterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserCenterProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          appBar: CustomAppBar(title: context.l10n?.userCenter ?? ""),
          body: CustomSingleChildScroll(
            padding: EdgeInsets.only(
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
              bottom:
                  Constants.safeAreaPadding.bottom +
                  Constants.horizontalPadding,
              top: 20.pw,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    5.ph.spaceVertical,

                    ///Set Password
                    _TabWidget(
                      title: context.l10n?.setPassword ?? "",
                      imagePath: AssetRes.lockIcon,
                      onTap: () {
                        context.navigator.pushNamed(
                          SetPasswordScreen.routeName,
                        );
                      },
                    ),

                    /// Divider
                    Divider(
                      height: 0,
                      color: ColorRes.black.withValues(alpha: 0.1),
                    ),

                    ///Set Profit Compute Mode
                    _TabWidget(
                      title: context.l10n?.setProfitComputeMode ?? "",
                      imagePath: AssetRes.profitIcon,
                      onTap: () {
                        context.navigator.pushNamed(
                          ProfitComputeModeScreen.routeName,
                        );
                      },
                    ),

                    ///Divider
                    Divider(
                      height: 0,
                      color: ColorRes.black.withValues(alpha: 0.1),
                    ),

                    ///Auto Sign In
                    _TabWidget(
                      title: context.l10n?.autoSignIn ?? "",
                      imagePath: AssetRes.profileIcon,
                      trailingWidget: SizedBox(
                        height: 20.pw,
                        child: Switch(
                          value: provider.isAutoSignInOn,
                          padding: EdgeInsets.zero,
                          activeColor: ColorRes.primaryColor,
                          inactiveThumbColor: ColorRes.lightGrey,
                          trackOutlineColor:
                              WidgetStateProperty.resolveWith<Color?>((
                                Set<WidgetState> states,
                              ) {
                                return provider.isAutoSignInOn
                                    ? null
                                    : ColorRes.lightGrey;
                              }),
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            provider.updateAutoSignInSetting(value);
                          },
                        ),
                      ),
                      onTap: () {},
                    ),

                    5.ph.spaceVertical,
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TabWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  final Widget? trailingWidget;

  const _TabWidget({
    required this.title,
    required this.imagePath,
    required this.onTap,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.ph),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///Svg Icon
            SvgAsset(width: 20.pw, imagePath: imagePath, height: 20.pw),

            /// Space
            10.pw.spaceHorizontal,

            ///Ti
            Expanded(
              child: Text(
                title,
                style: styleW600S16.copyWith(color: ColorRes.black2),
              ),
            ),

            /// Forward Icon
            trailingWidget ??
                SvgAsset(
                  imagePath: AssetRes.forwardIcon,
                  color: ColorRes.black,
                ),
          ],
        ),
      ),
    );
  }
}
