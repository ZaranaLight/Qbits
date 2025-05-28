import 'package:qbits/qbits.dart';

class EndUserScreen extends StatelessWidget {
  const EndUserScreen({super.key});

  static const routeName = "end_user";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<EndUserProvider>(
      create: (c) => EndUserProvider(),
      child: EndUserScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.l10n?.endUser ?? ""),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.pw,
          right: 16.pw,
          bottom: Constants.safeAreaPadding.bottom + 20.pw,
          top: 20.pw,
        ),
        child: Column(
          children: [
            /// Space
            10.pw.spaceHorizontal,

            /// Expanded Search TextField
            Expanded(
              child: SearchTextField(
                hintText: context.l10n?.search,
                
                fillColor: ColorRes.white,


                // controller: state.searchController,
                prefixIcon: SvgAsset(
                  imagePath: AssetRes.searchIcon,
                  color: ColorRes.black,
                ),
              ),
            ),

            /// Space
            10.pw.spaceHorizontal,
          ],
        ),
      ),
    );
  }
}
