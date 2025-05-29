import 'package:qbits/qbits.dart';

class ProfileInfoOTPVerificationScreen extends StatelessWidget {
  const ProfileInfoOTPVerificationScreen({super.key});

  static const routeName = "profile_info_otp_verification";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<ProfileInformationProvider>(
      create: (c) => ProfileInformationProvider(),
      child: ProfileInfoOTPVerificationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileInformationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          appBar: CustomAppBar(title: context.l10n?.profileInformation ?? ""),
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.ph,
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
              ),
              child: SubmitButton(
                title: context.l10n?.continueCap ?? "",
                onTap: () {
                  context.navigator.pop();
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
              top: 20.pw,
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
                  length: 6,
                  onCompleted:
                      (str) => context
                          .read<ProfileInformationProvider>()
                          .onVerifyTap(context),
                  onSubmitted:
                      (str) => context
                          .read<ProfileInformationProvider>()
                          .onVerifyTap(context),
                  onChanged:
                      context.read<ProfileInformationProvider>().onOtpChanged,
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
