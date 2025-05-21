import 'package:qbits/common/widget/appbars.dart';
import 'package:qbits/common/widget/custom_scroll.dart';
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
    return Scaffold(
      appBar: CustomAppBar(title: context.l10n?.selectRegion ?? ""),
      body: CustomSingleChildScroll(
        padding: EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
        child: Column(
          children: [
            ///Space
            10.pw.spaceVertical,


            Row(
              children: [
                /// Icon
                SvgAsset(imagePath: AssetRes.infoIcon, width: 20.pw),

                ///Space
                6.pw.spaceHorizontal,

                /// Text
                Expanded(
                  child: Text(
                    context.l10n?.pleaseSelectTheRegionThatCorrespondsTo ?? "",
                    style: styleW500S16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
