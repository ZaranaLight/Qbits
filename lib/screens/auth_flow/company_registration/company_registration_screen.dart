import 'package:qbits/qbits.dart';

class CompanyRegistrationScreen extends StatelessWidget {
  const CompanyRegistrationScreen({super.key});

  static const routeName = "company_registration_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<CompanyRegistrationProvider>(
      create: (c) => CompanyRegistrationProvider(),
      child: CompanyRegistrationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CompanyRegistrationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorRes.lightGrey2,
          appBar: CustomAppBar(title: context.l10n?.company ?? ""),
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.ph,
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
              ),
              child: SubmitButton(
                title: context.l10n?.register ?? "",
                onTap: () => provider.onRegisterTap(context),
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
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.ph),
                        child: Text(
                          "${context.l10n?.tip ?? ""}:",
                          style: styleW600S14.copyWith(color: ColorRes.black2),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: 10.ph),
                        child: Text(
                          "If your company has already registered a company account in Management System, you do not need to register again.\nPlease contact the administrator of your company (organization) to add you as a subordinate organization or organization member in the system.",
                          style: styleW400S12.copyWith(
                            color: ColorRes.black2.withValues(alpha: 0.6),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),

                ///Space
                20.ph.spaceVertical,

                Container(
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            /// Account
                            AppTextField(
                              isMandatory: true,
                              controller: provider.accountController,
                              header: context.l10n?.account ?? "",
                              hintText: context.l10n?.account ?? "",
                              error: provider.accountError,
                            ),

                            ///Space
                            20.ph.spaceVertical,

                            /// Password
                            AppTextField(
                              isMandatory: true,
                              obscureText: !provider.isPasswordVisible,
                              controller: provider.passwordController,
                              header: context.l10n?.password ?? "",
                              hintText: context.l10n?.password ?? "",
                              error: provider.passwordError,
                              onSuffixTap: provider.onPwdVisibilityChanged,
                              suffixIcon: AnimatedSwitcher(
                                duration: 300.milliseconds,
                                transitionBuilder: (
                                  Widget child,
                                  Animation<double> animation,
                                ) {
                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                                },
                                child: SvgAsset(
                                  key: ValueKey<bool>(
                                    provider.isPasswordVisible,
                                  ),
                                  imagePath:
                                      provider.isPasswordVisible
                                          ? AssetRes.eyeIcon
                                          : AssetRes.invisibleIcon,
                                  color: ColorRes.black.withValues(alpha: 0.3),
                                ),
                              ),
                            ),

                            ///Space
                            16.ph.spaceVertical,

                            /// Confirm Password
                            AppTextField(
                              obscureText: !provider.isConfirmPasswordVisible,
                              controller: provider.confirmPasswordController,
                              hintText: context.l10n?.confirmPassword ?? "",
                              error: provider.confirmPasswordError,
                              onSuffixTap: provider.onCnfPwdVisibilityChanged,
                              suffixIcon: AnimatedSwitcher(
                                duration: 300.milliseconds,
                                transitionBuilder: (
                                  Widget child,
                                  Animation<double> animation,
                                ) {
                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                                },
                                child: SvgAsset(
                                  key: ValueKey<bool>(
                                    provider.isConfirmPasswordVisible,
                                  ),
                                  imagePath:
                                      provider.isConfirmPasswordVisible
                                          ? AssetRes.eyeIcon
                                          : AssetRes.invisibleIcon,
                                  color: ColorRes.black.withValues(alpha: 0.3),
                                ),
                              ),
                            ),

                            ///Space
                            20.ph.spaceVertical,

                            /// Company Code
                            AppTextField(
                              isMandatory: true,

                              controller: provider.companyCodeController,
                              header: context.l10n?.companyCode ?? "",
                              hintText: context.l10n?.companyCode ?? "",
                              error: provider.companyCodeError,
                              suffixIcon: Material(
                                color: ColorRes.transparent,
                                child: InkWell(
                                  onTap: () {
                                    provider.generateCode();
                                  },
                                  borderRadius: BorderRadius.circular(5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgAsset(
                                      imagePath: AssetRes.resetIcon,
                                      color: ColorRes.black.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///Space
                      10.ph.spaceVertical,

                      /// Send
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 17,
                            width: 5,
                            color: ColorRes.primaryColor,
                          ),

                          ///Space
                          10.pw.spaceHorizontal,

                          Text(
                            context.l10n?.send ?? "",
                            style: styleW600S14.copyWith(
                              color: ColorRes.black2,
                            ),
                          ),
                        ],
                      ),

                      ///Space
                      10.ph.spaceVertical,

                      /// Mail
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: AppTextField(
                          isMandatory: true,
                          readOnly: true,
                          textInputType: TextInputType.emailAddress,
                          controller: provider.mailController,
                          header: context.l10n?.mail ?? "",
                          hintText: context.l10n?.enterMailBox ?? "",
                          error: provider.mailError,
                          suffixIcon: Material(
                            color: ColorRes.transparent,
                            child: InkWell(
                              onTap: () {
                                provider.sendCode();
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgAsset(imagePath: AssetRes.sendIcon),
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///Space
                      10.ph.spaceVertical,
                      if (provider.showCodeField)
                        Column(
                          children: [
                            /// Please use phone number or email ti obtain the verification code
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 17,
                                  width: 5,
                                  color: ColorRes.primaryColor,
                                ),

                                ///Space
                                10.pw.spaceHorizontal,

                                Flexible(
                                  child: Text(
                                    context
                                            .l10n
                                            ?.pleaseUseYourPhoneNumberOrEmailToObtain ??
                                        "",
                                    style: styleW600S14.copyWith(
                                      color: ColorRes.black2,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            ///Space
                            10.ph.spaceVertical,

                            /// Verification Code
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: AppTextField(
                                isMandatory: true,
                                textInputType: TextInputType.number,
                                controller: provider.verificationCodeController,
                                header: context.l10n?.code ?? "",
                                hintText:
                                    context.l10n?.enterVerificationCode ?? "",
                                error: provider.verificationCodeError,
                              ),
                            ),
                          ],
                        ),

                      ///Space
                      20.ph.spaceVertical,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
