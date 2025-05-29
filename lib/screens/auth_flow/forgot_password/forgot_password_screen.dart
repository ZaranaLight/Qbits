import 'package:qbits/qbits.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  static const routeName = "forgot_password_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordProvider>(
      create: (c) => ForgotPasswordProvider(),
      child: ForgotPasswordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          appBar: CustomAppBar(title: context.l10n?.forgotPassword ?? ""),
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.ph,
                left: 16.pw,
                right: 16.pw,
              ),
              child: SubmitButton(
                title: context.l10n?.continueCap ?? "",
                onTap: () => provider.onContinueTap(context),
              ),
            ),
          ),
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
                ///Email
                AppTextField(
                  textInputType: TextInputType.emailAddress,
                  controller: provider.emailController,
                  header: context.l10n?.email ?? "",
                  hintText: context.l10n?.email ?? "",
                  error: provider.emailError,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
