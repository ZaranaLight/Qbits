import 'package:qbits/common/widget/common_widgets.dart';
import 'package:qbits/qbits.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({
    super.key,
    this.onLanguageSelected,
    this.initialLanguage,
  });

  static const routeName = "select_language";
  final void Function(String selectedRegion)? onLanguageSelected;
  final String? initialLanguage;

  static Widget builder(
    BuildContext context, {
    void Function(String)? onLanguageSelected,
    String? initialLanguage,
  }) {
    return ChangeNotifierProvider<SelectLanguageProvider>(
      create: (c) => SelectLanguageProvider(initialLanguage: initialLanguage),
      child: SelectLanguageScreen(
        initialLanguage: initialLanguage,
        onLanguageSelected: onLanguageSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectLanguageProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: CustomAppBar(title: context.l10n?.language ?? ""),
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: Constants.safeAreaPadding.bottom + 30.ph,
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
              ),
              child: SubmitButton(
                title: context.l10n?.ok ?? "",
                enable: provider.selectedLanguage != "",
                onTap: () {
                  final selectedLanguage = provider.selectedLanguage;
                  if (onLanguageSelected != null) {
                    onLanguageSelected!(selectedLanguage);
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
            ),
            child: Column(
              children: [
                ///Space
                4.ph.spaceVertical,

                /// CheckBox List
                CustomListView(
                  itemCount: provider.languageCheckBoxNameList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      width: double.infinity,
                      // margin: EdgeInsets.only(bottom: 4.ph, top: 4.ph),
                      color: ColorRes.black.withValues(alpha: 0.1),
                    );
                  },
                  itemBuilder: (context, index) {
                    final name = provider.languageCheckBoxNameList[index];
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
              ],
            ),
          ),
        );
      },
    );
  }
}
