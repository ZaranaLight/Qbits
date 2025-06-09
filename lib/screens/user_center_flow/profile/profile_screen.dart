import 'package:qbits/qbits.dart';
import 'package:qbits/screens/collector/add_collector/add_collector_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = "profile";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider(),
      child: const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, state, _) {
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
                  const _AppBar(),
                  Expanded(
                    child: CustomSingleChildScroll(
                      padding: EdgeInsets.symmetric(
                        horizontal: Constants.horizontalPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Space
                          12.ph.spaceVertical,

                          /// Profile Card
                          _buildProfileCard(context),

                          /// Space
                          20.ph.spaceVertical,

                          /// Options
                          _buildOptions(context),

                          /// Space
                          20.ph.spaceVertical,

                          /// Improve Section
                          _buildImproveSection(context),
                        ],
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

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(8.pw),
      ),
      child: Material(
        color: ColorRes.transparent,
        child: InkWell(
          onTap:
              () => context.navigator.pushNamed(
                ProfileInformationScreen.routeName,
              ),
          borderRadius: BorderRadius.circular(8.pw),
          child: Container(
            width: 92.w,
            padding: EdgeInsets.symmetric(vertical: 18.ph, horizontal: 20.pw),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Profile Image
                AssetsImg(
                  width: 50.pw,
                  height: 50.ph,
                  imagePath: AssetRes.profileImg,
                ),

                /// Space
                15.pw.spaceHorizontal,

                /// Profile Details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Name
                    Text(
                      "Guest",
                      style: styleW600S16.copyWith(color: ColorRes.black2),
                    ),

                    /// Space
                    2.pw.spaceVertical,

                    ///Company Code
                    Text(
                      context.l10n?.companyCode ?? "",
                      style: styleW400S12.copyWith(color: ColorRes.black2),
                    ),

                    /// Space
                    6.ph.spaceVertical,

                    ///Date
                    Text(
                      DateTime.now().toYyyyMmDd.toString(),
                      style: styleW400S12.copyWith(color: ColorRes.black2),
                    ),

                    /// Space
                    10.ph.spaceVertical,

                    /// Contact Icons
                    Row(
                      children: [
                        /// Contact Icons
                        Material(
                          color: ColorRes.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(5.pw),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgAsset(
                                imagePath: AssetRes.phoneIcon,
                                width: 19.pw,
                              ),
                            ),
                          ),
                        ),

                        ///Email Icon
                        Material(
                          color: ColorRes.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(5.pw),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgAsset(
                                imagePath: AssetRes.emailIcon,
                                width: 19.pw,
                              ),
                            ),
                          ),
                        ),

                        /// Chat Icon
                        Material(
                          color: ColorRes.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(5.pw),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgAsset(
                                imagePath: AssetRes.chatIcon,
                                width: 19.pw,
                              ),
                            ),
                          ),
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
    );
  }

  Widget _buildOptions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ///Space
          5.ph.spaceVertical,

          ///Account Information
          TabWidget(
            title: context.l10n?.accountSecurity ?? "",
            imagePath: AssetRes.securityIcon,
            onTap:
                () => context.navigator.pushNamed(
                  AccountSecurityScreen.routeName,
                ),
          ),

          ///Divider
          Divider(height: 0, color: Colors.black.withValues(alpha: 0.1)),

          ///Currency
          TabWidget(
            title: context.l10n?.currency ?? "",
            imagePath: AssetRes.currencyIcon,
            onTap: () => context.navigator.pushNamed(CurrencyScreen.routeName),
          ),

          ///Divider
          Divider(height: 0, color: Colors.black.withValues(alpha: 0.1)),

          ///Sign Out
          TabWidget(
            title: context.l10n?.signOut ?? "",
            imagePath: AssetRes.logoutIcon,
            isLogout: true,

            onTap:
                () => context.navigator.pushNamedAndRemoveUntil(
                  SignInScreen.routeName,
                  (_) => false,
                ),
          ),
          5.ph.spaceVertical,
        ],
      ),
    );
  }

  Widget _buildImproveSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context.l10n?.clickToImproveContentInformation ?? "",
              style: styleW400S14.copyWith(
                color: ColorRes.black2,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SvgAsset(imagePath: AssetRes.closeRoundIcon),
        ],
      ),
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
            20.ph.spaceVertical,
          ],
        ),
      ),
    );
  }
}
