import 'package:qbits/qbits.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const routeName = "sign_in";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SignInProvider>(
      create: (c) => SignInProvider(),
      child: SignInScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SignInProvider>(
        builder: (context, provider, child) {
          return Stack(
            children: [
              // Background image
              Positioned(
                child: Stack(
                  children: [
                    /// Background icon
                    SvgAsset(
                      imagePath: AssetRes.authBackgroundIcon,
                      height: 52.h,
                    ),

                    /// App name icon
                    Positioned(
                      top: 0,
                      bottom: 80.pw,
                      left: 80.pw,
                      right: 80.pw,
                      child: SvgAsset(
                        imagePath: AssetRes.appNameIcon,
                        width: 200.pw,
                        height: 67.ph,
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: CustomSingleChildScroll(
                  padding: EdgeInsets.only(
                    left: Constants.horizontalPadding,
                    right: Constants.horizontalPadding,
                    bottom:
                        Constants.safeAreaPadding.bottom +
                        Constants.horizontalPadding,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///Region
                          InkWell(
                            onTap: () => provider.onSelectRegionTap(context),
                            borderRadius: BorderRadius.circular(5.pw),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  ///icon
                                  Text(
                                    context.l10n?.international ?? "",
                                    style: styleW500S14.copyWith(
                                      color: ColorRes.grey2,
                                    ),
                                  ),

                                  ///Space between the icon and text
                                  4.pw.spaceHorizontal,

                                  ///Down arrow icon
                                  SvgAsset(imagePath: AssetRes.downArrowIcon),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => provider.onSelectLanguageTap(context),
                            borderRadius: BorderRadius.circular(5.pw),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  ///Down arrow icon
                                  SvgAsset(imagePath: AssetRes.worldIcon),

                                  ///Space between the icon and text
                                  4.pw.spaceHorizontal,

                                  ///icon
                                  Text(
                                    context.l10n?.languageSelection ?? "",
                                    style: styleW500S14.copyWith(
                                      color: ColorRes.grey2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///Space between the top and the logo
                      230.ph.spaceVertical,

                      ///Login
                      Container(
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(
                            Constants.horizontalPadding,
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(-5, 0),
                              blurRadius: 40,
                              spreadRadius: 0,
                              color: ColorRes.primaryColor.withValues(
                                alpha: 0.2,
                              ),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.only(
                          left: Constants.horizontalPadding,
                          right: Constants.horizontalPadding,
                          top: 24.pw,
                          bottom: 20.pw,
                        ),
                        child: Column(
                          children: [
                            ///Account
                            AppTextField(
                              controller: provider.accountController,
                              header: context.l10n?.account ?? "",
                              hintText: context.l10n?.account ?? "",
                              error: provider.accountError,
                            ),

                            ///Space
                            20.ph.spaceVertical,

                            ///Password
                            AppTextField(
                              controller: provider.passwordController,
                              error: provider.pwdError,
                              hintText: context.l10n?.password,
                              header: context.l10n?.password,
                              textInputType: TextInputType.visiblePassword,
                              obscureText: !provider.isPwdVisible,
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
                                  key: ValueKey<bool>(provider.isPwdVisible),
                                  imagePath:
                                      provider.isPwdVisible
                                          ? AssetRes.eyeIcon
                                          : AssetRes.invisibleIcon,
                                  color: ColorRes.black.withValues(alpha: 0.3),
                                ),
                              ),
                              onSuffixTap: provider.onPwdVisibilityChanged,
                            ),

                            ///Space
                            20.ph.spaceVertical,

                            ///Forgot password and Bluetooth
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ///Forgot password
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap:
                                        () => provider.onForgotPwdTap(context),
                                    borderRadius: BorderRadius.circular(5.pw),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        context.l10n?.forgotPassword ?? "",
                                        style: styleW500S16.copyWith(
                                          color: ColorRes.black.withValues(
                                            alpha: 0.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                ///Bluetooth
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap:
                                        () =>
                                            provider.onBluetoothPwdTap(context),
                                    borderRadius: BorderRadius.circular(5.pw),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        context.l10n?.bluetooth ?? "",
                                        style: styleW500S16.copyWith(
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
                          ],
                        ),
                      ),

                      ///Space
                      58.ph.spaceVertical,

                      SubmitButton(
                        onTap: () => provider.onSignInTap(context),
                        title: context.l10n?.signIn ?? "",
                      ),

                      ///Space
                      10.ph.spaceVertical,

                      EmptyButton(
                        onTap: () => provider.onSignUpTap(context),
                        title: context.l10n?.register ?? "",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
