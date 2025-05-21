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
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(child: SvgAsset(imagePath: AssetRes.authBackgroundIcon)),
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
                      Row(
                        children: [
                          ///International icon
                          Text(
                            context.l10n?.international ?? "",
                            style: styleW500S14,
                          ),

                          ///Space between the icon and text
                          4.pw.spaceHorizontal,

                          ///Down arrow icon
                          SvgAsset(imagePath: AssetRes.downArrowIcon),
                        ],
                      ),

                      Row(
                        children: [
                          ///World icon
                          SvgAsset(imagePath: AssetRes.worldIcon),

                          ///Space between the icon and text
                          4.pw.spaceHorizontal,

                          /// Language selection text
                          Text(
                            context.l10n?.languageSelection ?? "",
                            style: styleW500S14,
                          ),
                        ],
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
                          color: ColorRes.primaryColor.withValues(alpha: 0.2),
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
                          // controller: startController,
                          header: context.l10n?.account ?? "",
                          hintText: context.l10n?.account ?? "",
                        ),

                        ///Space
                        20.pw.spaceVertical,

                        ///Password
                        AppTextField(
                          // controller: startController,
                          header: context.l10n?.password ?? "",
                          hintText: context.l10n?.password ?? "",
                        ),

                        ///Space
                        24.pw.spaceVertical,

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context.l10n?.forgotPassword ?? "",
                              style: styleW500S16,
                            ),
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

                  SubmitButton(onTap: () {}, title: context.l10n?.signIn ?? ""),

                  ///Space
                  10.pw.spaceVertical,


                  EmptyButton(onTap: () {}, title: context.l10n?.signIn ?? ""),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
