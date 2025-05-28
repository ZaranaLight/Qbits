import 'package:qbits/qbits.dart';

class AccountSecurityScreen extends StatelessWidget {
  const AccountSecurityScreen({super.key});

  static const routeName = "account_security_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AccountSecurityProvider>(
      create: (c) => AccountSecurityProvider(),
      child: AccountSecurityScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountSecurityProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          appBar: CustomAppBar(title: context.l10n?.accountSecurity ?? ""),
          body: Padding(
            padding: EdgeInsets.only(
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
              bottom: Constants.safeAreaPadding.bottom + Constants.horizontalPadding,
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
                              imagePath: AssetRes.phoneIcon,
                            ),

                            /// Space
                            10.pw.spaceHorizontal,

                            Text(
                              context.l10n?.phoneNumber ?? "",
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
                          context.navigator.pushNamed(
                            UserCenterOptionsScreen.routeName,
                          );
                        },
                        child: Row(
                          children: [
                            SvgAsset(
                              width: 18.pw,
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
                              width: 20.pw,
                              imagePath: AssetRes.deleteIcon,
                            ),

                            /// Space
                            10.pw.spaceHorizontal,

                            Text(
                              context.l10n?.accountCancellation ?? "",
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
