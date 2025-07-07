import 'package:qbits/common/widget/common_widgets.dart';
import 'package:qbits/qbits.dart';

class OtpCodeVerificationScreen extends StatelessWidget {
  const OtpCodeVerificationScreen({super.key});

  static const routeName = "otp_code_verification";

  static Widget builder(BuildContext context) {
    Map<String, dynamic> argMap = {};
    if (context.args is Map<String, dynamic>) {
      argMap = context.args as Map<String, dynamic>;
    }
    return ChangeNotifierProvider<OtpCodeVerificationProvider>(
      create:
          (c) => OtpCodeVerificationProvider(
            email: argMap["email"]?.toString() ?? "",
          ),
      child: OtpCodeVerificationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OtpCodeVerificationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          appBar: CustomAppBar(title: context.l10n?.oTPCodeVerification ?? ""),
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.ph,
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
              ),
              child: SubmitButton(
                // enable: provider.isOTPValidate,
                title: context.l10n?.continueCap ?? "",
                loading: provider.loader,
                onTap: () {
                  context.read<OtpCodeVerificationProvider>().onVerifyTap(
                    context,
                  );
                },
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
              top: 20.ph,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// Space
                10.ph.spaceVertical,

                /// Title
                Text(
                  context.l10n?.otp ?? "",
                  style: styleW400S14.copyWith(
                    color: ColorRes.black.withValues(alpha: 0.6),
                  ),
                ),

                /// Space
                10.ph.spaceVertical,

                Pinput(
                  length: 5,
                  onCompleted:
                      (str) => context
                          .read<OtpCodeVerificationProvider>()
                          .onOtpChanged(str),
                  onSubmitted:
                      (str) => context
                          .read<OtpCodeVerificationProvider>()
                          .onOtpChanged(str),
                  onChanged:
                      context.read<OtpCodeVerificationProvider>().onOtpChanged,
                  autofocus: true,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  defaultPinTheme: pinTheme(),
                  disabledPinTheme: pinTheme(),
                  focusedPinTheme: pinTheme().copyWith(
                    decoration: pinTheme().decoration?.copyWith(
                      border: Border.all(color: ColorRes.primaryColor),
                    ),
                  ),

                  submittedPinTheme: pinTheme().copyWith(
                    decoration: pinTheme().decoration?.copyWith(
                      border: Border.all(color: ColorRes.primaryColor),
                    ),
                  ),
                  errorPinTheme: pinTheme().copyWith(
                    decoration: pinTheme().decoration?.copyWith(
                      border: Border.all(color: ColorRes.red),
                    ),
                  ),
                ),

                if (provider.otpError.isNotEmpty)
                  ErrorText(error: provider.otpError, topPadding: 4.ph),
              ],
            ),
          ),
        );
      },
    );
  }

  PinTheme pinTheme() {
    return PinTheme(
      width: 50.17.pw,
      height: 45.pw,
      textStyle: styleW400S16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.pw),
        color: ColorRes.lightGrey2,
        border: Border.all(color: ColorRes.black.withValues(alpha: 0.1)),
      ),
    );
  }
}
