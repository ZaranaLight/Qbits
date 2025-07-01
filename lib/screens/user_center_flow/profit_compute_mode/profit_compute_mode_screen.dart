import 'package:qbits/qbits.dart';

class ProfitComputeModeScreen extends StatelessWidget {
  const ProfitComputeModeScreen({super.key});

  static const routeName = "profit_compute_mode_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<ProfitComputeModeProvider>(
      create: (context) => ProfitComputeModeProvider(),
      child: const ProfitComputeModeScreen(),
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
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
              ),
              child: SubmitButton(
                title: context.l10n?.confirm ?? "",
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
                ///Profit Row
                _buildProfitRow(context),

                ///Space
                Constants.horizontalPadding.spaceVertical,

                ///Energy Row
                _buildTotalEnergyRow(context),

                ///Space
                10.ph.spaceVertical,

                ///Average Price Row
                _buildAveragePriceRow(context),

                ///Space
                10.ph.spaceVertical,

                ///Lorem Ipsum Text
                _buildLoremIpsumText(),

                ///Space
                20.ph.spaceVertical,

                ///Parameter Set Header
                _buildParameterSetHeader(context),

                ///Space
                10.ph.spaceVertical,

                ///Parameter Inputs
                _buildParameterInputs(provider),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfitRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
      child: Row(
        children: [
          ///My Profit Text
          Text(
            "${context.l10n?.myProfit ?? ""}:",
            style: styleW500S18.copyWith(color: ColorRes.black2),
          ),

          ///Space
          5.pw.spaceHorizontal,

          /// Profit Amount
          Text("371974.00", style: styleW500S18.copyWith(color: ColorRes.red)),

          ///Space
          5.pw.spaceHorizontal,

          ///Coin Icon
          SvgAsset(imagePath: AssetRes.coinIcon),
        ],
      ),
    );
  }

  Widget _buildTotalEnergyRow(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorRes.primaryColor.withValues(alpha: 0.1),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
        vertical: 14.ph,
      ),
      child: Row(
        children: [
          Text(
            "${context.l10n?.totalEnergy ?? ""}:",
            style: styleW500S14.copyWith(color: ColorRes.black2),
          ),
          const SizedBox(width: 5),
          Text(
            "185987 kWh",
            style: styleW500S14.copyWith(color: ColorRes.black2),
          ),
        ],
      ),
    );
  }

  Widget _buildAveragePriceRow(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorRes.primaryColor.withValues(alpha: 0.1),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
        vertical: 14.ph,
      ),
      child: Row(
        children: [
          Text(
            "${context.l10n?.averageElectricPrice ?? ""}:",
            style: styleW500S14.copyWith(color: ColorRes.black2),
          ),
          const SizedBox(width: 5),
          Text("2.00", style: styleW500S14.copyWith(color: ColorRes.black2)),
          const SizedBox(width: 5),
          SvgAsset(imagePath: AssetRes.coinIcon),
        ],
      ),
    );
  }

  Widget _buildLoremIpsumText() {
    return Container(
      decoration: BoxDecoration(
        color: ColorRes.primaryColor.withValues(alpha: 0.1),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
        vertical: 14.ph,
      ),
      child: Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
        "Lorem Ipsum has been the industry's standard dummy text.",
        textAlign: TextAlign.justify,
        style: styleW500S14.copyWith(color: ColorRes.black2),
      ),
    );
  }

  Widget _buildParameterSetHeader(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
      child: Text(
        context.l10n?.parameterSet ?? "",
        style: styleW500S18.copyWith(color: ColorRes.black2),
      ),
    );
  }

  Widget _buildParameterInputs(ProfitComputeModeProvider provider) {
    return Column(
      children: [
        _buildParameterInput(
          title:
              "${navigatorKey.currentState!.context.l10n?.energySubsidizedPrice ?? ""}:",
          controller: provider.energySubsidizedPriceController,
          errorText: provider.energySubsidizedPriceError,
          showPercent: false,
        ),

        ///Space
        10.ph.spaceVertical,

        _buildParameterInput(
          title: "Lorem Ipsum is Simply:",
          controller: provider.loremIpsumController1,
          errorText: provider.loremIpsumError1,
          showPercent: false,
        ),

        ///Space
        10.ph.spaceVertical,

        _buildParameterInput(
          title: "Lorem Ipsum is Simply:",
          controller: provider.loremIpsumController2,
          errorText: provider.loremIpsumError2,
          showPercent: false,
        ),

        ///Space
        10.ph.spaceVertical,

        _buildParameterInput(
          title: "Lorem Ipsum is Simply:",
          controller: provider.loremIpsumController3,
          errorText: provider.loremIpsumError3,
          showPercent: true,
        ),

        ///Space
        10.ph.spaceVertical,

        _buildParameterInput(
          title: "Lorem Ipsum is Simply:",
          controller: provider.loremIpsumController4,
          errorText: provider.loremIpsumError4,
          showPercent: true,
        ),
      ],
    );
  }

  Widget _buildParameterInput({
    required String title,
    required TextEditingController controller,
    required String? errorText,
    required bool showPercent,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: ColorRes.primaryColor.withValues(alpha: 0.1),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
        vertical: 8.ph,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: styleW500S14.copyWith(color: ColorRes.black2, height: 0),
            ),
          ),

          ///Space
          16.pw.spaceHorizontal,

          SizedBox(
            width: 136.pw,
            child: AppTextField(
              isDense: true,
              textInputType: TextInputType.numberWithOptions(decimal: true),
              controller: controller,
              error: errorText,
              customPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 0,
              ),
              fillColor: ColorRes.white,
              maxWidth: 10.pw,
              customBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.pw),
                borderSide: BorderSide(
                  color:
                      errorText?.isNotEmpty ?? false
                          ? ColorRes.red
                          : ColorRes.primaryColor.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),

          ///Space
          8.pw.spaceHorizontal,

          SizedBox(
            width: 19.pw,
            child:
                showPercent
                    ? Text(
                      "%",
                      textAlign: TextAlign.end,
                      style: styleW500S16.copyWith(color: ColorRes.black2),
                    )
                    : SvgAsset(imagePath: AssetRes.coinIcon),
          ),

          ///Space
          8.pw.spaceHorizontal,
        ],
      ),
    );
  }
}
