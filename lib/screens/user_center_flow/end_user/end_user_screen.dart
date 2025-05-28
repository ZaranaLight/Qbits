import 'package:qbits/qbits.dart';
import 'package:qbits/screens/user_center_flow/guest/guest_screen.dart';

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
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.pw),
                          color: ColorRes.white,
                        ),
                        child: Material(
                          color: ColorRes.transparent,
                          child: InkWell(
                            onTap: () {
                              context.navigator.pushNamed(
                                GuestScreen.routeName,
                              );
                            },
                            borderRadius: BorderRadius.circular(8.pw),
                            child: Padding(
                              padding: EdgeInsets.all(12.pw),
                              child: Row(
                                children: [
                                  /// User Image
                                  AssetsImg(
                                    imagePath: AssetRes.profileImg,
                                    width: 96.pw,
                                    height: 96.pw,
                                  ),

                                  /// Space
                                  10.pw.spaceHorizontal,

                                  /// User Details
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /// User Name
                                      Text(
                                        'Guest',
                                        style: styleW700S17.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),

                                      ///Space
                                      4.pw.spaceVertical,

                                      ///Password
                                      Text(
                                        'Password: 1234',
                                        style: styleW500S12.copyWith(
                                          color: ColorRes.black.withValues(
                                            alpha: 0.6,
                                          ),
                                        ),
                                      ),

                                      ///Space
                                      4.pw.spaceVertical,

                                      ///Phone
                                      Text(
                                        'Phone:',
                                        style: styleW500S12.copyWith(
                                          color: ColorRes.black.withValues(
                                            alpha: 0.6,
                                          ),
                                        ),
                                      ),

                                      ///Space
                                      4.pw.spaceVertical,

                                      ///Mail
                                      Text(
                                        'Mail:',
                                        style: styleW500S12.copyWith(
                                          color: ColorRes.black.withValues(
                                            alpha: 0.6,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
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
