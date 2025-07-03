import 'package:qbits/qbits.dart';

class EndUserDetailScreen extends StatelessWidget {
  const EndUserDetailScreen({super.key});

  static const routeName = "end_user_detail_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<EndUserProvider>(
      create: (c) => EndUserProvider(),
      child: EndUserDetailScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: CustomAppBar(title: context.l10n?.guest ?? ""),
          body: Padding(
            padding: EdgeInsets.only(
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
              bottom:
                  Constants.safeAreaPadding.bottom +
                  Constants.horizontalPadding,
              top: 20.ph,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    // horizontal: 34.pw,
                    vertical: 24.pw,
                  ),
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(8.pw),
                  ),
                  child: Column(
                    children: [
                      /// First Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 42.pw,
                        children: [
                          _TopImgWidget(name: "Okw"),
                          _TopImgWidget(name: "0kWh", isColorChange: true),
                          _TopImgWidget(name: "385233kWh"),
                        ],
                      ),

                      /// Space
                      Constants.horizontalPadding.spaceVertical,

                      /// Second Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 42.pw,
                        children: [
                          _TopImgWidget(name: "5"),
                          _TopImgWidget(name: "2927.77T", isColorChange: true),
                          _TopImgWidget(name: "21052.94"),
                        ],
                      ),
                    ],
                  ),
                ),

                ///Space
                Constants.horizontalPadding.spaceVertical,

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.pw),
                    ),
                    child: CustomListView(
                      itemCount: 3,
                      separatorBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.pw),
                          width: double.infinity,
                          child: Divider(
                            color: ColorRes.black.withValues(alpha: 0.1),
                            height: 0,
                          ),
                        );
                      },
                      padding: EdgeInsets.only(
                        bottom: Constants.safeAreaPadding.bottom + 15.ph,
                        top: 5.ph,
                      ),
                      itemBuilder: (context, index) {
                        return EndUserListWidget(
                          onTap: () {
                            context.navigator.pop();
                          },
                        );
                      },
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

class _TopImgWidget extends StatelessWidget {
  final String? name;
  final bool? isColorChange;

  const _TopImgWidget({this.name, this.isColorChange = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70.pw,
          height: 70.pw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70.pw),
            color: ColorRes.grey3,
          ),
        ),

        ///Space
        14.ph.spaceVertical,

        /// Text
        Text(
          name ?? "",
          style: styleW500S14.copyWith(
            color: isColorChange! ? ColorRes.orange3 : ColorRes.primaryColor,
          ),
        ),
      ],
    );
  }
}
