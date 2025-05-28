import 'package:qbits/qbits.dart';
import 'package:qbits/screens/user_center_flow/guest/widget/guest_list_widget.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({super.key});

  static const routeName = "guest";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<EndUserProvider>(
      create: (c) => EndUserProvider(),
      child: GuestScreen(),
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
              left: 16.pw,
              right: 16.pw,
              bottom:
                  Constants.safeAreaPadding.bottom +
                  Constants.horizontalPadding,
              top: 20.pw,
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
                          _TopImgWidget(name: "0kWh"),
                          _TopImgWidget(name: "385233kWh"),
                        ],
                      ),

                      /// Space
                      16.pw.spaceVertical,

                      /// Second Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 42.pw,
                        children: [
                          _TopImgWidget(name: "5"),
                          _TopImgWidget(name: "2927.77T"),
                          _TopImgWidget(name: "21052.94"),
                        ],
                      ),
                    ],
                  ),
                ),

                ///Space
                16.pw.spaceVertical,

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(8.pw),
                    ),

                    child: CustomListView(
                      itemCount: 3,
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 1,
                          width: double.infinity,
                          color: ColorRes.black.withValues(alpha: 0.1),
                        );
                      },
                      itemBuilder: (context, index) {
                        return GuestListWidget();
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

  const _TopImgWidget({this.name});

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
        14.pw.spaceVertical,

        /// Text
        Text(
          name ?? "",
          style: styleW500S14.copyWith(color: ColorRes.primaryColor),
        ),
      ],
    );
  }
}
