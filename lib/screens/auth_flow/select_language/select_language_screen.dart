import 'package:qbits/common/widget/common_widgets.dart';
import 'package:qbits/qbits.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  static const routeName = "select_language";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SelectLanguageProvider>(
      create: (c) => SelectLanguageProvider(),
      child: SelectLanguageScreen(),
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
                bottom: 30.ph,
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
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
              bottom: Constants.safeAreaPadding.bottom + Constants.horizontalPadding,
            ),
            child: Column(
              children: [
                ///Space
                15.pw.spaceVertical,

                /// CheckBox List
                CustomListView(
                  itemCount: provider.languageCheckBoxNameList.length,
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
                    final name = provider.languageCheckBoxNameList[index];
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
              ],
            ),
          ),
        );
      },
    );
  }
}
