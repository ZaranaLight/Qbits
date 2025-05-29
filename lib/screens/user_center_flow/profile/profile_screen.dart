import 'package:qbits/qbits.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = "profile";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<ProfileProvider>(
      create: (c) => ProfileProvider(),
      child: ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, state, child) {
        return StackedLoader(
          loading: state.loader,
          child: Stack(
            children: [
              Container(
                height: 200.ph,
                width: 100.w,
                color: ColorRes.primaryColor,
              ),
              Column(
                children: [
                  _AppBar(),

                  Expanded(
                    child: StackedLoader(
                      loading: state.loader,
                      child: CustomSingleChildScroll(
                        padding: EdgeInsets.symmetric(
                          horizontal: Constants.horizontalPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Space
                            12.ph.spaceVertical,

                            /// Profile Content
                            Container(
                              width: 92.w,
                              decoration: BoxDecoration(
                                color: ColorRes.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    offset: Offset(0, 4),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    context.navigator.pushNamed(
                                      ProfileInformationScreen.routeName,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 18.ph,
                                        horizontal: 20.pw,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /// Profile Image
                                          AssetsImg(
                                            width: 50.pw,
                                            height: 50.ph,
                                            imagePath: AssetRes.profileImg,
                                          ),

                                          /// Space
                                          15.pw.spaceHorizontal,

                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ///Guest
                                              Text(
                                                "Guest",
                                                style: styleW600S16.copyWith(
                                                  color: ColorRes.black2,
                                                ),
                                              ),

                                              ///Company Code
                                              Text(
                                                context.l10n?.companyCode ?? "",
                                                style: styleW400S12.copyWith(
                                                  color: ColorRes.black2,
                                                ),
                                              ),

                                              /// Space
                                              5.pw.spaceVertical,

                                              Text(
                                                "2022-01-18",
                                                style: styleW400S12.copyWith(
                                                  color: ColorRes.black2,
                                                ),
                                              ),

                                              /// Space
                                              10.pw.spaceVertical,

                                              Row(
                                                children: [
                                                  SvgAsset(
                                                    imagePath: AssetRes.phoneIcon,
                                                  ),

                                                  /// Space
                                                  10.pw.spaceHorizontal,

                                                  SvgAsset(
                                                    imagePath: AssetRes.emailIcon,
                                                  ),

                                                  /// Space
                                                  10.pw.spaceHorizontal,

                                                  SvgAsset(
                                                    imagePath: AssetRes.chatIcon,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Space
                            20.ph.spaceVertical,

                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: ColorRes.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  ///Space
                                  5.ph.spaceVertical,

                                  ///Account Cancellation
                                  TabWidget(
                                    title: context.l10n?.accountSecurity ?? "",
                                    imagePath: AssetRes.securityIcon,
                                    onTap: () {
                                      context.navigator.pushNamed(
                                        AccountSecurityScreen.routeName,
                                      );
                                    },
                                  ),

                                  Divider(
                                    height: 0.ph,
                                    color: ColorRes.black.withValues(alpha: 0.1),
                                  ),

                                  ///Currency
                                  TabWidget(
                                    title: context.l10n?.currency ?? "",
                                    imagePath: AssetRes.currencyIcon,
                                    onTap: () {
                                      context.navigator.pushNamed(
                                        CurrencyScreen.routeName,
                                      );
                                    },
                                  ),

                                  ///Divider
                                  Divider(
                                    height: 0.ph,
                                    color: ColorRes.black.withValues(alpha: 0.1),
                                  ),

                                  ///Sign Out
                                  TabWidget(
                                    title: context.l10n?.signOut ?? "",
                                    imagePath: AssetRes.logoutIcon,
                                    isLogout: true,
                                    onTap: () {
                                      context.navigator.pushNamedAndRemoveUntil(
                                        SignInScreen.routeName,
                                        (route) => false,
                                      );
                                    },
                                  ),

                                  5.ph.spaceVertical,
                                ],
                              ),
                            ),

                            // Space
                            20.ph.spaceVertical,

                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                color: ColorRes.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    context
                                            .l10n
                                            ?.clickToImproveContentInformation ??
                                        "",
                                    style: styleW400S14.copyWith(
                                      color: ColorRes.black2,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),

                                  Spacer(),

                                  /// Forward Icon
                                  SvgAsset(imagePath: AssetRes.closeRoundIcon),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: Constants.horizontalPadding,
          right: Constants.horizontalPadding,
          top: 10.ph,
        ),
        child: Column(
          children: [
            Text(
              context.l10n?.profile ?? "",
              style: styleW600S20.copyWith(color: ColorRes.white),
            ),

            /// Space
            20.ph.spaceVertical,
          ],
        ),
      ),
    );
  }
}
