import 'package:qbits/qbits.dart';
import 'package:qbits/screens/user_center_flow/qa/qa_provider.dart';

class QaScreen extends StatelessWidget {
  const QaScreen({super.key});

  static const routeName = "qa_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<QaProvider>(
      create: (c) => QaProvider(),
      child: QaScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QaProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: CustomAppBar(title: context.l10n?.qa ?? ""),

          body: CustomSingleChildScroll(
            padding: EdgeInsets.only(
              left: 16.pw,
              right: 16.pw,
              top: 20.pw,
              bottom:
                  Constants.safeAreaPadding.bottom +
                  Constants.horizontalPadding,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ///Scanner Icon
                    InkWell(
                      onTap: () => provider.scanQRCode(context, 'model'),
                      child: SvgAsset(
                        imagePath: AssetRes.scannerIcon,
                        width: 40.pw,
                        height: 40.pw,
                        color: ColorRes.primaryColor,
                      ),
                    ),

                    ///
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(8.pw),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 12.pw),
                        padding: EdgeInsets.symmetric(horizontal: 10.pw),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        context.navigator.pop();
                      },
                      borderRadius: BorderRadius.circular(5.pw),
                      child: Container(
                        height: 44.pw,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.pw,
                          vertical: 10.pw,
                        ),
                        decoration: BoxDecoration(
                          color: ColorRes.primaryColor,
                          borderRadius: BorderRadius.circular(8.pw),
                        ),
                        child: Center(
                          child: Text(
                            context.l10n?.confirm ?? "",
                            style: styleW600S14.copyWith(color: ColorRes.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                ///Space
                16.pw.spaceVertical,
              ],
            ),
          ),
        );
      },
    );
  }
}
