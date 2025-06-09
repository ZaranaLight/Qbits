import 'package:qbits/qbits.dart';

class AddUserFormScreen extends StatelessWidget {
  static const routeName = "add_user_form_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AddUserProvider>(
      create: (c) => AddUserProvider(),
      child: AddUserFormScreen(),
    );
  }

  const AddUserFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddUserProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.ph,
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
              ),
              child: Row(
                children: [
                  /// Submit Button
                  Expanded(
                    child: SubmitButton(
                      title: context.l10n?.confirm ?? "",
                      onTap: () => {provider.onConfirmTap(context)},
                    ),
                  ),

                  /// Space
                  14.pw.spaceHorizontal,

                  /// Cancel Button
                  Expanded(
                    child: SubmitButton(
                      bgColor: ColorRes.red,
                      title: context.l10n?.cancel ?? "",
                      onTap: () => {context.navigator.pop()},
                      style: styleW700S16.copyWith(color: ColorRes.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          appBar: CustomAppBar(title: context.l10n?.addUser ?? ""),
          body: CustomSingleChildScroll(
            padding: EdgeInsets.only(
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
              bottom: Constants.safeAreaPadding.bottom + 20.pw,
              top: 20.pw,
            ),
            child: Column(
              children: [
                /// Original Password
                AppTextField(
                  controller: provider.accountController,
                  header: context.l10n?.account ?? "",
                  hintText: context.l10n?.enterAccount ?? "",
                  error: provider.accountError,
                ),

                /// Space
                20.ph.spaceVertical,

                /// New Password
                AppTextField(
                  obscureText: provider.isPasswordVisible,
                  onSuffixTap: provider.onPwdVisibilityChanged,
                  suffixIcon: AnimatedSwitcher(
                    duration: 300.milliseconds,
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                    ) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: SvgAsset(
                      key: ValueKey<bool>(provider.isPasswordVisible),
                      imagePath:
                          !provider.isPasswordVisible
                              ? AssetRes.eyeIcon
                              : AssetRes.invisibleIcon,
                      color: ColorRes.black.withValues(alpha: 0.3),
                    ),
                  ),
                  controller: provider.passwordController,
                  header: context.l10n?.password ?? "",
                  hintText: context.l10n?.enterPassword ?? "",
                  error: provider.passwordError,
                ),

                /// Space
                20.ph.spaceVertical,

                /// Confirm New Password
                AppTextField(
                  controller: provider.phoneNumberController,
                  header: context.l10n?.phoneNumber ?? "",
                  hintText: context.l10n?.enterPhoneNumber ?? "",
                  error: provider.phoneNumberError,
                ),

                /// Space
                20.ph.spaceVertical,

                /// Confirm New Password
                AppTextField(
                  controller: provider.mailController,
                  header: context.l10n?.mail ?? "",
                  hintText: context.l10n?.enterMail ?? "",
                  error: provider.mailError,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
