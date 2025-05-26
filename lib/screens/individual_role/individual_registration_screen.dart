import 'package:qbits/qbits.dart';

class IndividualRegistrationScreen extends StatelessWidget {
  const IndividualRegistrationScreen({super.key});

  static const routeName = "individual_registration_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<IndividualRegistrationProvider>(
      create: (c) => IndividualRegistrationProvider(),
      child: IndividualRegistrationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IndividualRegistrationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          appBar: CustomAppBar(title: context.l10n?.individual ?? ""),
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.ph,
                left: 16.pw,
                right: 16.pw,
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
              bottom: Constants.safeAreaPadding.bottom + Constants.horizontalPadding,
              top: 20.pw,
            ),
            child: Column(
              children: [
                /// Station Name
                AppTextField(
                  controller: provider.stationNameController,
                  header: context.l10n?.stationName ?? "",
                  hintText: context.l10n?.stationName ?? "",
                  error: provider.stationNameError,
                ),

                ///Space
                20.pw.spaceVertical,

                /// Model
                AppTextField(
                  controller: provider.modelController,
                  header: context.l10n?.model ?? "",
                  hintText: context.l10n?.model ?? "",
                  error: provider.modelError,
                ),

                ///Space
                20.pw.spaceVertical,

                /// Account
                AppTextField(
                  controller: provider.accountController,
                  header: context.l10n?.account ?? "",
                  hintText: context.l10n?.account ?? "",
                  error: provider.accountError,
                ),

                ///Space
                20.pw.spaceVertical,

                /// Password
                AppTextField(
                  obscureText: !provider.isPasswordVisible,
                  controller: provider.passwordController,
                  header: context.l10n?.password ?? "",
                  hintText: context.l10n?.password ?? "",
                  error: provider.passwordError,
                  onSuffixTap: provider.onPwdVisibilityChanged,
                  suffixIcon: AnimatedSwitcher(
                    duration: 300.milliseconds,
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: SvgAsset(
                      key: ValueKey<bool>(provider.isPasswordVisible),
                      imagePath: !provider.isPasswordVisible ? AssetRes.eyeIcon : AssetRes.invisibleIcon,
                    ),
                  ),
                ),

                ///Space
                10.pw.spaceVertical,

                /// Confirm Password
                AppTextField(
                  obscureText: !provider.isConfirmPasswordVisible,
                  controller: provider.confirmPasswordController,
                  hintText: context.l10n?.confirmPassword ?? "",
                  error: provider.confirmPasswordError,
                  onSuffixTap: provider.onCnfPwdVisibilityChanged,
                  suffixIcon: AnimatedSwitcher(
                    duration: 300.milliseconds,
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    child: SvgAsset(
                      key: ValueKey<bool>(provider.isConfirmPasswordVisible),
                      imagePath: !provider.isConfirmPasswordVisible ? AssetRes.eyeIcon : AssetRes.invisibleIcon,
                    ),
                  ),
                ),

                ///Space
                20.pw.spaceVertical,

                /// Your City
                AppTextField(
                  obscureText: true,
                  controller: provider.cityController,
                  header: context.l10n?.yourCity ?? "",
                  hintText: context.l10n?.yourCity ?? "",
                  error: provider.cityError,
                ),

                ///Space
                20.pw.spaceVertical,

                /// Collector Address
                AppTextField(
                  controller: provider.collectorAddressController,
                  header: context.l10n?.collectorAddress ?? "",
                  hintText: context.l10n?.collectorAddress ?? "",
                  error: provider.collectorAddressError,
                ),

                ///Space
                20.pw.spaceVertical,

                /// Timezone
                AppTextField(
                  textInputType: TextInputType.datetime,
                  controller: provider.timezoneController,
                  header: context.l10n?.timezone ?? "",
                  hintText: context.l10n?.timezone ?? "",
                  error: provider.timezoneError,
                ),

                ///Space
                20.pw.spaceVertical,

                /// Station Type
                AppTextField(
                  controller: provider.stationTypeController,
                  header: context.l10n?.stationType ?? "",
                  hintText: context.l10n?.stationType ?? "",
                  error: provider.stationTypeError,
                ),

                ///Space
                20.pw.spaceVertical,

                /// Phone Number
                AppTextField(
                  textInputType: TextInputType.phone,
                  controller: provider.phoneNumberController,
                  header: context.l10n?.phoneNumber ?? "",
                  hintText: context.l10n?.phoneNumber ?? "",
                  error: provider.phoneNumberError,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
