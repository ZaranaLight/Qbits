import 'package:qbits/qbits.dart';

class PlantInfoPart3 extends StatelessWidget {
  const PlantInfoPart3({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantInfoProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(color: ColorRes.white),
          padding: EdgeInsets.only(
            left: Constants.horizontalPadding,
            right: Constants.horizontalPadding,
          ),
          child: Column(
            children: [
              ///Azimuth
              EditableInfoField(
                title: 'Azimuth',
                value: provider.plantInfoPart3Class.azimuth,
                isEditing: provider.isEditing,
                onTap: () => provider.onAzimuthTap(context),
              ),

              ///Title Angle
              EditableInfoField(
                title: 'Title Angle',
                value: provider.plantInfoPart3Class.titleAngle,
                isEditing: provider.isEditing,
                onTap: () => provider.onTitleAngleTap(context),
              ),

              ///On-grid Date
              EditableInfoField(
                title: 'On-grid Date',
                value: provider.plantInfoPart3Class.onGridDate,
                isEditing: provider.isEditing,
                onTap: () => provider.onOnGridDateTap(context),
              ),

              provider.isEditing
                  ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.ph),
                    child: SubmitButton(
                      onTap: () {},
                      title: context.l10n?.submit ?? "",
                    ),
                  )
                  : SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
