import 'package:qbits/qbits.dart';

class UserCenterOptionsScreen extends StatelessWidget {
  const UserCenterOptionsScreen({super.key});

  static const routeName = "user_center_options_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AccountSecurityProvider>(
      create: (c) => AccountSecurityProvider(),
      child: UserCenterOptionsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountSecurityProvider>(
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

                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: InkWell(
                        onTap: () {
                          // context.navigator.pushNamed(
                          //   MyWatchlistScreen.routeName,
                          // );
                        },
                        child: Row(
                          children: [
                            SvgAsset(
                              width: 20.pw,
                              imagePath: AssetRes.lockIcon,
                            ),

                            /// Space
                            10.pw.spaceHorizontal,

                            Text(
                              context.l10n?.setPassword ?? "",
                              style: styleW600S16.copyWith(
                                color: ColorRes.black2,
                              ),
                            ),

                            Spacer(),

                            /// Forward Icon
                            SvgAsset(imagePath: AssetRes.forwardIcon),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15.ph),
                      height: 1.ph,
                      color: ColorRes.black.withValues(alpha: 0.1),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: InkWell(
                        onTap: () {
                          // context.navigator.pushNamed(
                          //   MyWatchlistScreen.routeName,
                          // );
                        },
                        child: Row(
                          children: [
                            SvgAsset(
                              width: 18.pw,
                              imagePath: AssetRes.profitIcon,
                            ),

                            /// Space
                            10.pw.spaceHorizontal,

                            Text(
                              context.l10n?.setProfitComputeMode ?? "",
                              style: styleW600S16.copyWith(
                                color: ColorRes.black2,
                              ),
                            ),

                            Spacer(),

                            /// Forward Icon
                            SvgAsset(imagePath: AssetRes.forwardIcon),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15.ph),
                      height: 1.ph,
                      color: ColorRes.black.withValues(alpha: 0.1),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: InkWell(
                        onTap: () {
                          // context.navigator.pushNamed(
                          //   MyWatchlistScreen.routeName,
                          // );
                        },
                        child: Row(
                          children: [
                            SvgAsset(
                              width: 20.pw,
                              imagePath: AssetRes.profileIcon,
                            ),

                            /// Space
                            10.pw.spaceHorizontal,

                            Text(
                              context.l10n?.autoSignIn ?? "",
                              style: styleW600S16.copyWith(
                                color: ColorRes.black2,
                              ),
                            ),

                            Spacer(),

                            /// Forward Icon
                            SvgAsset(imagePath: AssetRes.forwardIcon),
                          ],
                        ),
                      ),
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
