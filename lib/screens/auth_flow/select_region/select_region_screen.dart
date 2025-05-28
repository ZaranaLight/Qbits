import 'package:qbits/common/widget/common_widgets.dart';
import 'package:qbits/qbits.dart';

class SelectRegionScreen extends StatelessWidget {
  const SelectRegionScreen({super.key});

  static const routeName = "select_region";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SelectRegionProvider>(
      create: (c) => SelectRegionProvider(),
      child: SelectRegionScreen(),
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
                left: 16.pw,
                right: 16.pw,
              ),
              child: SubmitButton(
                title: context.l10n?.ok ?? "",
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
              bottom: Constants.safeAreaPadding.bottom + 16.pw,
              top: 16.pw,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    /// Icon
                    SvgAsset(imagePath: AssetRes.infoIcon, width: 20.pw),

                    ///Space
                    6.pw.spaceHorizontal,

                    /// Text
                    Expanded(
                      child: Text(
                        context.l10n?.pleaseSelectTheRegionThatCorrespondsTo ??
                            "",
                        style: styleW500S16,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),

                ///Space
                10.pw.spaceVertical,

                ///Divider
                Divider(
                  height: 1.pw,
                  color: ColorRes.black.withValues(alpha: 0.1),
                ),

                ///Space
                14.pw.spaceVertical,

                /// CheckBox List
                CustomListView(
                  itemCount: provider.regionCheckBoxNameList.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      margin: EdgeInsets.symmetric(vertical: 14.pw),
                      width: double.infinity,
                      color: ColorRes.black.withValues(alpha: 0.1),
                    );
                  },
                  itemBuilder: (context, index) {
                    final name = provider.regionCheckBoxNameList[index];
                    final isChecked = provider.isChecked(name);
                    return CheckBoxBtn(
                      value: isChecked,
                      onChange: (value) {
                        provider.setChecked(name, value);
                      },
                      text: name,
                    );
                  },
                ),

                ///Space
                14.pw.spaceVertical,

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
                30.pw.spaceVertical,

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
