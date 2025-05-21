import 'package:qbits/common/widget/app_text_form_feild.dart';
import 'package:qbits/common/widget/buttons.dart';
import 'package:qbits/common/widget/custom_scroll.dart';
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
    final provider = Provider.of<SignInProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<SignInProvider>(
        builder: (context, state, child) {
          return Stack(
            children: [
              // Background image
              Positioned(
                child: SvgAsset(imagePath: AssetRes.authBackgroundIcon),
              ),
              SafeArea(
                child: CustomSingleChildScroll(
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.horizontalPadding,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///Region
                          _TopRowWidget(
                            onTap: () => provider.onSelectRegionTap(context),
                            title: context.l10n?.international ?? "",
                            imgPath: AssetRes.downArrowIcon,
                          ),

                          ///Language
                          _TopRowWidget(
                            onTap: () => provider.onSelectLanguageTap(context),
                            title: context.l10n?.languageSelection ?? "",
                            imgPath: AssetRes.worldIcon,
                          ),
                        ],
                      ),

                      ///Space between the top and the logo
                      230.pw.spaceVertical,

                      ///Login
                      Container(
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(16.pw),
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
                          left: 16.pw,
                          right: 16.pw,
                          top: 24.pw,
                          bottom: 20.pw,
                        ),
                        child: Column(
                          children: [
                            ///Account
                            AppTextField(
                              controller: state.accountController,
                              header: context.l10n?.account ?? "",
                              hintText: context.l10n?.account ?? "",
                              error: state.accountError,
                            ),

                            ///Space
                            20.pw.spaceVertical,

                            ///Password
                            AppTextField(
                              controller: state.passwordController,
                              error: state.pwdError,
                              hintText: context.l10n?.password,
                              header: context.l10n?.password,
                              textInputType: TextInputType.visiblePassword,
                              obscureText: !state.isPwdVisible,
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
                                  key: ValueKey<bool>(state.isPwdVisible),
                                  imagePath:
                                      state.isPwdVisible
                                          ? AssetRes.invisibleIcon
                                          : AssetRes.eyeIcon,
                                ),
                              ),
                              onSuffixTap: state.onPwdVisibilityChanged,
                            ),

                            ///Space
                            24.pw.spaceVertical,

                            ///Forgot password and Bluetooth
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ///Forgot password
                                Text(
                                  context.l10n?.forgotPassword ?? "",
                                  style: styleW500S16,
                                ),

                                ///Bluetooth
                                Text(
                                  context.l10n?.bluetooth ?? "",
                                  style: styleW500S16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      ///Space
                      58.pw.spaceVertical,

                      SubmitButton(
                        onTap: () => provider.onSignInTap(context),
                        title: context.l10n?.signIn ?? "",
                      ),

                      ///Space
                      10.pw.spaceVertical,

                      EmptyButton(
                        onTap: () {},
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

class _TopRowWidget extends StatelessWidget {
  final String? title;
  final String? imgPath;
  final VoidCallback onTap;

  const _TopRowWidget({this.title, this.imgPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5.pw),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ///icon
            Text(title ?? "", style: styleW500S14),

            ///Space between the icon and text
            4.pw.spaceHorizontal,

            ///Down arrow icon
            SvgAsset(imagePath: imgPath ?? ""),
          ],
        ),
      ),
    );
  }
}
