import 'package:qbits/common/widget/common_widgets.dart';
import 'package:qbits/qbits.dart';

class SelectRegionScreen extends StatelessWidget {
  const SelectRegionScreen({
    super.key,
    this.onRegionSelected,
    this.initialRegion,
  });

  static const routeName = "select_region";
  final void Function(String selectedRegion)? onRegionSelected;
  final String? initialRegion;

  static Widget builder(
    BuildContext context, {
    void Function(String)? onRegionSelected,
    String? initialRegion,
  }) {
    return ChangeNotifierProvider<SelectRegionProvider>(
      create: (c) => SelectRegionProvider(initialRegion: initialRegion),
      child: SelectRegionScreen(
        initialRegion: initialRegion,
        onRegionSelected: onRegionSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectRegionProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: CustomAppBar(title: context.l10n?.selectRegion ?? ""),
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.ph,
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
              ),
              child: SubmitButton(
                title: context.l10n?.ok ?? "",
                enable: provider.selectedRegion != "",
                onTap: () {
                  final selectedRegion = provider.selectedRegion;
                  if (onRegionSelected != null) {
                    onRegionSelected!(selectedRegion);
                  }
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
              top: Constants.horizontalPadding,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    /// Icon
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: SvgAsset(
                        imagePath: AssetRes.infoIcon,
                        width: 20.pw,
                      ),
                    ),

                    ///Space
                    6.pw.spaceHorizontal,

                    /// Text
                    Expanded(
                      child: Text(
                        context.l10n?.pleaseSelectTheRegionThatCorrespondsTo ??
                            "",
                        style: styleW500S16,
                      ),
                    ),
                  ],
                ),

                ///Space
                10.ph.spaceVertical,

                ///Divider
                Divider(
                  height: 1.pw,
                  color: ColorRes.black.withValues(alpha: 0.1),
                ),

                /// CheckBox List
                CustomListView(
                  itemCount: provider.regionCheckBoxNameList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      width: double.infinity,
                      color: ColorRes.black.withValues(alpha: 0.1),
                    );
                  },
                  itemBuilder: (context, index) {
                    final name = provider.regionCheckBoxNameList[index];
                    final isChecked = provider.isChecked(name);
                    return RadioButtonCell(
                      title: name,
                      isSelected: isChecked,
                      onTap: () => provider.selectOnly(name),
                    );
                  },
                ),

                ///Space
                1.ph.spaceVertical,

                ///Divider
                Column(
                  children: [
                    Divider(
                      height: 1.pw,
                      color: ColorRes.black.withValues(alpha: 0.1),
                    ),
                  ],
                ),

                ///Space
                30.ph.spaceVertical,

                ///Don't know how to choose
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      context.navigator.pushNamed(
                        SelectRegionDescriptionScreen.routeName,
                      );
                    },
                    borderRadius: BorderRadius.circular(5.pw),
                    child: Padding(
                      padding: EdgeInsets.all(5.pw),
                      child: Text(
                        context.l10n?.doNotKnowHowToChoose ?? "",
                        style: styleW500S14.copyWith(
                          color: ColorRes.primaryColor,
                        ),
                      ),
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
