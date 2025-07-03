import 'package:qbits/qbits.dart';

class SelectRegionDescriptionScreen extends StatelessWidget {
  const SelectRegionDescriptionScreen({super.key});

  static const routeName = "select_region_description";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SelectRegionProvider>(
      create: (c) => SelectRegionProvider(),
      child: SelectRegionDescriptionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectRegionProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          appBar: CustomAppBar(
            title: context.l10n?.selectRegionDescription ?? "",
          ),
          body: CustomSingleChildScroll(
            padding: EdgeInsets.only(
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
              bottom:
                  Constants.safeAreaPadding.bottom +
                  Constants.horizontalPadding,
              top: 20.ph,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and "
                  "setting industry. Lorem Ipsum has been the industry's "
                  "standard dummy text ever since the 1500s, when an"
                  "unknown printer took a galley of type.",
                  style: styleW400S14.copyWith(color: ColorRes.black2),
                ),

                /// Space
                15.ph.spaceVertical,
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),
                15.ph.spaceVertical,

                Text(
                  "What is Lorem Ipsum?",
                  style: styleW600S14.copyWith(color: ColorRes.black2),
                ),

                /// Space
                8.ph.spaceVertical,

                Text(
                  "Lorem Ipsum is simply dummy text of the printing and"
                  "setting industry. Lorem Ipsum has been the industry's"
                  "standard dummy text ever since the 1500s, when an"
                  "unknown printer took a galley of type.",
                  style: styleW400S14.copyWith(color: ColorRes.black2),
                ),

                /// Space
                14.ph.spaceVertical,

                Text(
                  "Lorem Ipsum is simply dummy text of the printing and"
                  "setting industry. Lorem Ipsum has been the industry's"
                  "standard dummy text ever since the 1500s, when an"
                  "unknown printer took a galley of type.",
                  style: styleW400S14.copyWith(color: ColorRes.black2),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
