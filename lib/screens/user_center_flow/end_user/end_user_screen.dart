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
    return Consumer<EndUserProvider>(
      builder: (context, provider, child) {
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
                /// Expanded Search TextField
                SearchTextField(
                  hintText: context.l10n?.search,
                  fillColor: ColorRes.white,
                  controller: provider.searchController,
                  prefixIcon: SvgAsset(
                    imagePath: AssetRes.searchIcon,
                    color: ColorRes.black,
                  ),
                ),

                /// Space
                16.pw.spaceVertical,

                Expanded(
                  child: CustomListView(
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20.pw,
                          vertical: 8.pw,
                        ),
                        width: double.infinity,
                      );
                    },
                    itemBuilder: (context, index) {
                      return EndUserListWidget();
                    },
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
