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
          appBar: CustomAppBar(
            title: context.l10n?.endUser ?? "",
            actions: [
              ///Torch Button
              InkWell(
                onTap: () {
                  context.navigator.pushNamed(AddUserFormScreen.routeName);
                },
                borderRadius: BorderRadius.circular(5.pw),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.horizontalPadding,
                    vertical: 10.pw,
                  ),
                  child: SvgAsset(imagePath: AssetRes.plusIcon),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
              bottom: Constants.safeAreaPadding.bottom + 20.pw,
              top: 20.pw,
            ),
            child: Column(
              children: [
                /// Expanded Search TextField
                Container(
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(8.pw),
                  ),
                  child: SearchTextField(
                    hintText: context.l10n?.search,
                    controller: provider.searchController,
                    fillColor: ColorRes.white,
                    prefixIcon: SvgAsset(
                      imagePath: AssetRes.searchIcon,
                      color: ColorRes.black,
                    ),
                  ),
                ),

                /// Space
                Constants.horizontalPadding.spaceVertical,

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
