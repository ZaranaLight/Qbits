import 'package:qbits/qbits.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  static const routeName = "set_password_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SetPasswordProvider>(
      create: (c) => SetPasswordProvider(),
      child: SetPasswordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SetPasswordProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          appBar: CustomAppBar(title: context.l10n?.setPassword ?? ""),
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.ph,
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
              ),
              child: SubmitButton(
                title: context.l10n?.confirm ?? "",
                onTap: () => provider.onTapConfirm(context),
              ),
            ),
          ),
          body: StackedLoader(
            loading: provider.loader,
            child: CustomSingleChildScroll(
              padding: EdgeInsets.only(
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
                bottom: Constants.safeAreaPadding.bottom + Constants.horizontalPadding,
                top: 20.pw,
              ),
              child: Column(
                children: [
                  /// Original Password
                  AppTextField(
                    obscureText: true,
                    controller: provider.originalPasswordController,
                    header: context.l10n?.originalPassword ?? "",
                    hintText: context.l10n?.enterOriginalPassword ?? "",
                    error: provider.originalPasswordError,
                  ),

                  /// Space
                  20.ph.spaceVertical,

                  /// New Password
                  AppTextField(
                    obscureText: true,
                    controller: provider.newPasswordController,
                    header: context.l10n?.newPassword ?? "",
                    hintText: context.l10n?.enterNewPassword ?? "",
                    error: provider.newPasswordError,
                  ),

                  /// Space
                  20.ph.spaceVertical,

                  /// Confirm New Password
                  AppTextField(
                    obscureText: true,
                    controller: provider.confirmNewPasswordController,
                    header: context.l10n?.confirmNewPassword ?? "",
                    hintText: context.l10n?.enterConfirmNewPassword ?? "",
                    error: provider.confirmNewPasswordError,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
