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
          backgroundColor: ColorRes.lightGrey2,
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
              bottom:
                  Constants.safeAreaPadding.bottom +
                  Constants.horizontalPadding,
              top: 20.pw,
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  /// Station Name
                  AppTextField(
                    controller: provider.stationNameController,
                    header: context.l10n?.stationName ?? "",
                    hintText: context.l10n?.stationName ?? "",
                    error: provider.stationNameError,
                    headerColor: ColorRes.black,
                    isMandatory: true,
                  ),

                  ///Space
                  20.pw.spaceVertical,

                  /// Model
                  AppTextField(
                    controller: provider.modelController,
                    header: context.l10n?.model ?? "",
                    hintText: context.l10n?.model ?? "",
                    error: provider.modelError,
                    headerColor: ColorRes.black,
                    isMandatory: true,
                    suffixIcon: InkWell(
                      onTap: () async {
                        provider.scanQRCode(context, 'model');
                        // final scannedResult = await context.navigator.push(
                        //   MaterialPageRoute(builder: (_) => const QRScannerScreen()),
                        // );
                        //
                        // if (scannedResult != null && scannedResult is String) {
                        //   // Use scannedResult
                        //   print('Scanned code: $scannedResult');
                        // }
                      },
                      child: SvgAsset(
                        imagePath: AssetRes.scannerIcon2,
                        color: ColorRes.black.withValues(alpha: 0.5),
                      ),
                    ),
                  ),

                  ///Space
                  20.pw.spaceVertical,

                  /// Account
                  AppTextField(
                    controller: provider.accountController,
                    header: context.l10n?.account ?? "",
                    hintText: context.l10n?.account ?? "",
                    error: provider.accountError,
                    headerColor: ColorRes.black,
                    isMandatory: true,
                  ),

                  ///Space
                  20.pw.spaceVertical,

                  /// Password
                  AppTextField(
                    obscureText: !provider.isPasswordVisible,
                    controller: provider.passwordController,
                    header: context.l10n?.password ?? "",
                    hintText: context.l10n?.password ?? "",
                    headerColor: ColorRes.black,
                    isMandatory: true,
                    error: provider.passwordError,
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
                  ),

                  ///Space
                  10.pw.spaceVertical,

                  /// Confirm Password
                  AppTextField(
                    obscureText: !provider.isConfirmPasswordVisible,
                    controller: provider.confirmPasswordController,
                    hintText: context.l10n?.confirmPassword ?? "",
                    error: provider.confirmPasswordError,
                    headerColor: ColorRes.black,
                    isMandatory: true,
                    onSuffixTap: provider.onCnfPwdVisibilityChanged,
                    suffixIcon: AnimatedSwitcher(
                      duration: 300.milliseconds,
                      transitionBuilder: (
                        Widget child,
                        Animation<double> animation,
                      ) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: SvgAsset(
                        key: ValueKey<bool>(provider.isConfirmPasswordVisible),
                        imagePath:
                            !provider.isConfirmPasswordVisible
                                ? AssetRes.eyeIcon
                                : AssetRes.invisibleIcon,

                        color: ColorRes.black.withValues(alpha: 0.3),
                      ),
                    ),
                  ),

                  ///Space
                  20.pw.spaceVertical,

                  /// Your City
                  AppTextField(
                    controller: provider.cityController,
                    header: context.l10n?.yourCity ?? "",
                    hintText: context.l10n?.yourCity ?? "",
                    error: provider.cityError,
                    headerColor: ColorRes.black,
                    isMandatory: true,
                  ),

                  ///Space
                  20.pw.spaceVertical,

                  /// Collector Address
                  AppTextField(
                    controller: provider.collectorAddressController,
                    header: context.l10n?.collectorAddress ?? "",
                    hintText: context.l10n?.collectorAddress ?? "",
                    error: provider.collectorAddressError,
                    headerColor: ColorRes.black,
                    isMandatory: true,
                    maxLine: 3,
                    minLine: 1,
                    textInputType: TextInputType.streetAddress,
                    suffixIcon: InkWell(
                      onTap: () async {
                        provider.scanQRCode(context, 'collector_address');
                      },
                      child: SvgAsset(
                        imagePath: AssetRes.scannerIcon2,
                        color: ColorRes.black.withValues(alpha: 0.5),
                      ),
                    ),
                  ),

                  ///Space
                  20.pw.spaceVertical,

                  /// Timezone
                  AppDropDown<String>(
                    itemAsString: (e) => e,
                    hintText: context.l10n?.timezone ?? "",
                    onChanged: (val) => provider.onChangeTimezone(val),
                    selectedValue: provider.selectedTimezone,
                    header: context.l10n?.timezone ?? "",
                    error: provider.timezoneError,
                    isMandatory: true,
                    headerColor: ColorRes.black,
                    suffixIcon: SvgAsset(
                      imagePath: AssetRes.timeZoneIcon,
                      color: ColorRes.black.withValues(alpha: 0.5),
                    ),
                    optionsList: [
                      "GMT 0",
                      "GMT 1",
                      "GMT 2",
                      "GMT 3",
                      "GMT 4",
                      "GMT 5",
                    ],
                  ),

                  ///Space
                  20.pw.spaceVertical,

                  /// Station Type
                  AppDropDown<String>(
                    itemAsString: (e) => e,
                    hintText: context.l10n?.stationType ?? "",
                    onChanged: (val) => provider.onChangeStationType(val),
                    selectedValue: provider.selectedStationType,
                    header: context.l10n?.stationType ?? "",
                    error: provider.stationTypeError,
                    optionsList: ["Station 1", "Station 2", "Station 3"],
                    headerColor: ColorRes.black,
                    isMandatory: true,
                  ),

                  ///Space
                  20.pw.spaceVertical,

                  /// Phone Number
                  AppTextField(
                    textInputType: TextInputType.numberWithOptions(decimal: true),
                    controller: provider.phoneNumberController,
                    header: context.l10n?.phoneNumber ?? "",
                    hintText: context.l10n?.phoneNumber ?? "",
                    error: provider.phoneNumberError,
                    headerColor: ColorRes.black,
                    isMandatory: true,
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
