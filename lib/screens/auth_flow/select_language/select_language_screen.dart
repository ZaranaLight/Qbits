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
          bottomNavigationBar: Padding(
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
          body: CustomListView(
            itemCount: provider.languageCheckBoxNameList.length,
            padding: EdgeInsets.only(
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
              top: 4.ph,
              bottom: Constants.safeAreaPadding.bottom + 16.ph,
            ),
            itemBuilder: (context, index) {
              final name = provider.languageCheckBoxNameList[index];
              final isChecked = provider.isChecked(name);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioButtonCell(
                    title: name,
                    isSelected: isChecked,
                    onTap: () => provider.selectOnly(name),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: ColorRes.black.withValues(alpha: 0.1),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
