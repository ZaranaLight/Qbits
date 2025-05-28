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
              bottom:
                  Constants.safeAreaPadding.bottom +
                  Constants.horizontalPadding,
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
                        style: styleW500S18.copyWith(color: ColorRes.black2),
                      ),

                      /// Space
                      5.pw.spaceHorizontal,

                      Text(
                        "371974.00",
                        style: styleW500S18.copyWith(color: ColorRes.red),
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
                          style: styleW500S14.copyWith(color: ColorRes.black2),
                        ),

                        /// Space
                        5.pw.spaceHorizontal,

                        /// Energy Value
                        Text(
                          "185987 kWh",
                          style: styleW500S14.copyWith(color: ColorRes.black2),
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
                        /// Average Electric Price Text
                        Text(
                          "${context.l10n?.averageElectricPrice ?? ""}:",
                          style: styleW500S14.copyWith(color: ColorRes.black2),
                        ),

                        /// Space
                        5.pw.spaceHorizontal,

                        /// Average Electric Price Value
                        Text(
                          "2.00",
                          style: styleW500S14.copyWith(color: ColorRes.black2),
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
                      style: styleW500S14.copyWith(color: ColorRes.black2),
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
                    style: styleW500S18.copyWith(color: ColorRes.black2),
                  ),
                ),

                /// Space
                10.pw.spaceVertical,

                /// Energy Subsidized Price
                CommonParameterSetWidget(
                  title: "${context.l10n?.energySubsidizedPrice ?? ""}:",
                  isPercentIconVisible: false,
                  textEditingController:
                      provider.energySubsidizedPriceController,
                  errorText: provider.energySubsidizedPriceError,
                ),

                /// Space
                10.pw.spaceVertical,

                /// Energy Subsidized Price
                CommonParameterSetWidget(
                  title: "Lorem Ipsum is Simply:",
                  isPercentIconVisible: false,
                  textEditingController: provider.loremIpsumController1,
                  errorText: provider.loremIpsumError1,
                ),

                /// Space
                10.pw.spaceVertical,

                /// Energy Subsidized Price
                CommonParameterSetWidget(
                  title: "Lorem Ipsum is Simply:",
                  isPercentIconVisible: false,
                  textEditingController: provider.loremIpsumController2,
                  errorText: provider.loremIpsumError2,
                ),

                /// Space
                10.pw.spaceVertical,

                /// Energy Subsidized Price
                CommonParameterSetWidget(
                  title: "Lorem Ipsum is Simply:",
                  isPercentIconVisible: true,
                  textEditingController: provider.loremIpsumController3,
                  errorText: provider.loremIpsumError3,
                ),

                /// Space
                10.pw.spaceVertical,

                /// Energy Subsidized Price
                CommonParameterSetWidget(
                  title: "Lorem Ipsum is Simply:",
                  isPercentIconVisible: true,
                  textEditingController: provider.loremIpsumController4,
                  errorText: provider.loremIpsumError4,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CommonParameterSetWidget extends StatelessWidget {
  final String? title;
  final TextEditingController? textEditingController;
  final String? errorText;
  final bool isPercentIconVisible;

  const CommonParameterSetWidget({
    super.key,
    this.title,
    this.textEditingController,
    this.errorText,
    this.isPercentIconVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfitComputeModeProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(
            color: ColorRes.primaryColor.withValues(alpha: 0.1),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.horizontalPadding,
              vertical: 12.ph,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Title
                Expanded(
                  child: Text(
                    title ?? "",
                    style: styleW500S14.copyWith(color: ColorRes.black2),
                  ),
                ),

                /// Space
                20.pw.spaceHorizontal,

                /// Text Field
                SizedBox(
                  width: 25.w,
                  child: AppTextField(
                    isDense: true,
                    textInputType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    controller: textEditingController,
                    error: errorText,
                    customPadding: EdgeInsets.symmetric(
                      horizontal: 12.pw,
                      vertical: 0,
                    ),
                    customBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.pw),
                      borderSide: BorderSide(
                        color:
                            provider.loremIpsumError4.isNotEmpty
                                ? ColorRes.red
                                : ColorRes.primaryColor.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ),

                /// Space
                10.pw.spaceHorizontal,

                /// Percent Icon or Coin Icon
                SizedBox(
                  width: 20.pw,
                  child:
                      (isPercentIconVisible)
                          ? Text(
                            "%",
                            textAlign: TextAlign.end,
                            style: styleW500S16.copyWith(
                              color: ColorRes.black2,
                            ),
                          )
                          :
                          /// Coin Icon
                          SvgAsset(imagePath: AssetRes.coinIcon),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
