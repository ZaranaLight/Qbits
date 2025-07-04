import 'package:qbits/qbits.dart';

class PlantInfoScreen extends StatelessWidget {
  const PlantInfoScreen({super.key});

  static const routeName = "plant_info_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlantInfoProvider(),
      child: const PlantInfoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantInfoProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            title: context.l10n?.plantInfo ?? "",
            actions: [
              InkWell(
                onTap: () {
                  provider.toggleEdit();
                },
                borderRadius: BorderRadius.circular(5.pw),
                child: Padding(
                  padding: EdgeInsets.all(19.0),
                  child: SvgAsset(
                    imagePath:
                        provider.isEditing
                            ? AssetRes.closeIcon
                            : AssetRes.editIcon,
                    color: ColorRes.white,
                  ),
                ),
              ),
            ],
          ),
          body: CustomSingleChildScroll(
            padding: EdgeInsets.only(
              bottom: Constants.safeAreaPadding.bottom + 20.pw,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlantInfoPart1(),
                16.ph.spaceVertical,
                PlantInfoPart2(),
                16.ph.spaceVertical,
                PlantInfoPart3(),
              ],
            ),
          ),
        );
      },
    );
  }
}
