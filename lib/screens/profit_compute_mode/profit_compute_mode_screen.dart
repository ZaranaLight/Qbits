import 'package:qbits/qbits.dart';

class ProfitComputeModeScreen extends StatelessWidget {
  const ProfitComputeModeScreen({super.key});

  static const routeName = "profit_compute_mode_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<ProfitComputeModeProvider>(
      create: (c) => ProfitComputeModeProvider(),
      child: ProfitComputeModeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfitComputeModeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          appBar: CustomAppBar(title: context.l10n?.profitComputeMode ?? ""),
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
                onTap: () {
                  context.navigator.pop();
                  context.navigator.pop();
                  context.navigator.pop();
                },
              ),
            ),
          ),
          body: CustomSingleChildScroll(
            padding: EdgeInsets.only(
              bottom: Constants.safeAreaPadding.bottom + Constants.horizontalPadding,
              top: 20.pw,
            ),
            child: Column(
              children: [

                /// My Profit
                Padding(
                  padding: EdgeInsets.only(
                    left: Constants.horizontalPadding,
                    right: Constants.horizontalPadding,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "${context.l10n?.myProfit ?? ""}:",
                        style: styleW500S18.copyWith(
                          color: ColorRes.black2,
                        ),
                      ),

                      /// Space
                      5.pw.spaceHorizontal,

                      Text(
                        "371974.00",
                        style: styleW500S18.copyWith(
                          color: ColorRes.red,
                        ),
                      ),

                      /// Space
                      5.pw.spaceHorizontal,

                      /// Coin Icon
                      SvgAsset(imagePath: AssetRes.coinIcon),
                    ],
                  ),
                ),

                /// Space
                10.pw.spaceVertical,

                /// Total Energy
                Container(
                  decoration: BoxDecoration(
                    color: ColorRes.primaryColor.withValues(alpha: 0.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.horizontalPadding,
                      vertical: 12.ph,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "${context.l10n?.totalEnergy ?? ""}:",
                          style: styleW500S14.copyWith(
                            color: ColorRes.black2,
                          ),
                        ),

                        /// Space
                        5.pw.spaceHorizontal,

                        Text(
                          "185987 kWh",
                          style: styleW500S14.copyWith(
                            color: ColorRes.black2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Space
                10.pw.spaceVertical,

                /// Average Electric Price
                Container(
                  decoration: BoxDecoration(
                    color: ColorRes.primaryColor.withValues(alpha: 0.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.horizontalPadding,
                      vertical: 12.ph,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "${context.l10n?.averageElectricPrice ?? ""}:",
                          style: styleW500S14.copyWith(
                            color: ColorRes.black2,
                          ),
                        ),

                        /// Space
                        5.pw.spaceHorizontal,

                        Text(
                          "2.00",
                          style: styleW500S14.copyWith(
                            color: ColorRes.black2,
                          ),
                        ),

                        /// Space
                        5.pw.spaceHorizontal,

                        /// Coin Icon
                        SvgAsset(imagePath: AssetRes.coinIcon),
                      ],
                    ),
                  ),
                ),

                /// Space
                10.pw.spaceVertical,

                /// Lorem Ipsum Text
                Container(
                  decoration: BoxDecoration(
                    color: ColorRes.primaryColor.withValues(alpha: 0.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.horizontalPadding,
                      vertical: 12.ph,
                    ),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
                      style: styleW500S14.copyWith(
                        color: ColorRes.black2,
                      ),
                    ),
                  ),
                ),

                /// Space
                15.ph.spaceVertical,

                /// Parameter Set
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    left: Constants.horizontalPadding,
                    right: Constants.horizontalPadding,
                  ),
                  child: Text(
                    context.l10n?.parameterSet ?? "",
                    style: styleW500S18.copyWith(
                      color: ColorRes.black2,
                    ),
                  ),
                ),

                /// Space
                10.pw.spaceVertical,

                /// Energy Subsidized Price
                Container(
                  decoration: BoxDecoration(
                    color: ColorRes.primaryColor.withValues(alpha: 0.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.horizontalPadding,
                      vertical: 12.ph,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Text(
                            "${context.l10n?.energySubsidizedPrice ?? ""}:",
                            style: styleW500S14.copyWith(
                              color: ColorRes.black2,
                            ),
                          ),
                        ),

                        /// Space
                        20.pw.spaceHorizontal,

                        SizedBox(
                          width: 25.w,
                          child: AppTextField(
                            isDense: true,
                            textInputType: TextInputType.numberWithOptions(decimal: true),
                            controller: provider.energySubsidizedPriceController,
                            error: provider.energySubsidizedPriceError,
                            customPadding: EdgeInsets.symmetric(horizontal: 12.pw),
                            customBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.pw),
                              borderSide: BorderSide(
                                color: (provider.energySubsidizedPriceError ?? '').isNotEmpty
                                    ? ColorRes.red : ColorRes.primaryColor.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                        ),

                        /// Space
                        10.pw.spaceHorizontal,

                        /// Coin Icon
                        SvgAsset(imagePath: AssetRes.coinIcon),
                      ],
                    ),
                  ),
                ),

                /// Space
                10.pw.spaceVertical,

                Container(
                  decoration: BoxDecoration(
                    color: ColorRes.primaryColor.withValues(alpha: 0.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.horizontalPadding,
                      vertical: 12.ph,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Text(
                            "Lorem Ipsum is Simply:",
                            style: styleW500S14.copyWith(
                              color: ColorRes.black2,
                            ),
                          ),
                        ),

                        /// Space
                        20.pw.spaceHorizontal,

                        SizedBox(
                          width: 25.w,
                          child: AppTextField(
                            isDense: true,
                            textInputType: TextInputType.numberWithOptions(decimal: true),
                            controller: provider.loremIpsumController1,
                            error: provider.loremIpsumError1,
                            customPadding: EdgeInsets.symmetric(horizontal: 12.pw),
                            customBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.pw),
                              borderSide: BorderSide(
                                color: (provider.loremIpsumError1 ?? '').isNotEmpty
                                    ? ColorRes.red : ColorRes.primaryColor.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                        ),

                        /// Space
                        10.pw.spaceHorizontal,

                        /// Coin Icon
                        SvgAsset(imagePath: AssetRes.coinIcon),
                      ],
                    ),
                  ),
                ),

                /// Space
                10.pw.spaceVertical,

                Container(
                  decoration: BoxDecoration(
                    color: ColorRes.primaryColor.withValues(alpha: 0.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.horizontalPadding,
                      vertical: 12.ph,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Text(
                            "Lorem Ipsum is Simply:",
                            style: styleW500S14.copyWith(
                              color: ColorRes.black2,
                            ),
                          ),
                        ),

                        /// Space
                        20.pw.spaceHorizontal,

                        SizedBox(
                          width: 25.w,
                          child: AppTextField(
                            isDense: true,
                            textInputType: TextInputType.numberWithOptions(decimal: true),
                            controller: provider.loremIpsumController2,
                            error: provider.loremIpsumError2,
                            customPadding: EdgeInsets.symmetric(horizontal: 12.pw),
                            customBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.pw),
                              borderSide: BorderSide(
                                color: (provider.loremIpsumError2 ?? '').isNotEmpty
                                    ? ColorRes.red : ColorRes.primaryColor.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                        ),

                        /// Space
                        10.pw.spaceHorizontal,

                        /// Coin Icon
                        SvgAsset(imagePath: AssetRes.coinIcon),
                      ],
                    ),
                  ),
                ),

                /// Space
                10.pw.spaceVertical,

                Container(
                  decoration: BoxDecoration(
                    color: ColorRes.primaryColor.withValues(alpha: 0.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.horizontalPadding,
                      vertical: 12.ph,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Text(
                            "Lorem Ipsum is Simply:",
                            style: styleW500S14.copyWith(
                              color: ColorRes.black2,
                            ),
                          ),
                        ),

                        /// Space
                        20.pw.spaceHorizontal,

                        SizedBox(
                          width: 25.w,
                          child: AppTextField(
                            isDense: true,
                            textInputType: TextInputType.numberWithOptions(decimal: true),
                            controller: provider.loremIpsumController3,
                            error: provider.loremIpsumError3,
                            customPadding: EdgeInsets.symmetric(horizontal: 12.pw),
                            customBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.pw),
                              borderSide: BorderSide(
                                color: (provider.loremIpsumError3 ?? '').isNotEmpty
                                    ? ColorRes.red : ColorRes.primaryColor.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                        ),

                        /// Space
                        10.pw.spaceHorizontal,

                        Text(
                          "%",
                          style: styleW500S16.copyWith(
                            color: ColorRes.black2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Space
                10.pw.spaceVertical,

                Container(
                  decoration: BoxDecoration(
                    color: ColorRes.primaryColor.withValues(alpha: 0.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.horizontalPadding,
                      vertical: 12.ph,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Text(
                            "Lorem Ipsum is Simply:",
                            style: styleW500S14.copyWith(
                              color: ColorRes.black2,
                            ),
                          ),
                        ),

                        /// Space
                        20.pw.spaceHorizontal,

                        SizedBox(
                          width: 25.w,
                          child: AppTextField(
                            isDense: true,
                            textInputType: TextInputType.numberWithOptions(decimal: true),
                            controller: provider.loremIpsumController4,
                            error: provider.loremIpsumError4,
                            customPadding: EdgeInsets.symmetric(horizontal: 12.pw, vertical: 0),
                            customBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.pw),
                              borderSide: BorderSide(
                                color: (provider.loremIpsumError4 ?? '').isNotEmpty
                                    ? ColorRes.red : ColorRes.primaryColor.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                        ),

                        /// Space
                        10.pw.spaceHorizontal,

                        Text(
                          "%",
                          style: styleW500S16.copyWith(
                            color: ColorRes.black2,
                          ),
                        ),
                      ],
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
}
