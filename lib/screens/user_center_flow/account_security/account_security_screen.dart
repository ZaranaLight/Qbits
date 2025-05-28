import 'package:qbits/common/widget/app_tab_widget.dart';
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
                /// Space
                5.ph.spaceVertical,

                ///Phone Number
                TabWidget(
                  title: context.l10n?.phoneNumber ?? "",
                  imagePath: AssetRes.phoneIcon,
                  onTap: () {},
                ),

                ///Divider
                Divider(
                  height: 0,
                  color: ColorRes.black.withValues(alpha: 0.1),
                ),

                ///Set Password
                TabWidget(
                  title: context.l10n?.setPassword ?? "",
                  imagePath: AssetRes.lockIcon,
                  onTap: () {
                    context.navigator.pushNamed(UserCenterScreen.routeName);
                  },
                ),

                ///Divider
                Divider(
                  height: 0,
                  color: ColorRes.black.withValues(alpha: 0.1),
                ),

                ///Account Cancellation
                TabWidget(
                  title: context.l10n?.accountCancellation ?? "",
                  imagePath: AssetRes.deleteIcon,
                  onTap: () {},
                ),

                ///Space
                5.ph.spaceVertical,
              ],
            ),
          ),
        );
      },
    );
  }
}
