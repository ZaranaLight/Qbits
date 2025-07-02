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
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Azimuth',
                    value: provider.plantInfoPart3Class.azimuth,
                    onTap: () {
                      provider.onAzimuthTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Azimuth',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart3Class.azimuth.toString(),
                          style: styleW600S14.copyWith(
                            color: ColorRes.black,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

              ///Divider
              Divider(height: 0, color: ColorRes.black.withValues(alpha: 0.1)),

              ///Title Angle
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Title Angle',
                    value: provider.plantInfoPart3Class.titleAngle,
                    onTap: () {
                      provider.onTitleAngleTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Title Angle',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart3Class.titleAngle.toString(),
                          style: styleW600S14.copyWith(
                            color: ColorRes.black,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

              ///Divider
              Divider(height: 0, color: ColorRes.black.withValues(alpha: 0.1)),

              ///On-grid Date
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'On-grid Date',
                    value: provider.plantInfoPart3Class.onGridDate,
                    onTap: () {
                      provider.onOnGridDateTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'On-grid Date',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart3Class.onGridDate,
                          style: styleW600S14.copyWith(
                            color: ColorRes.black,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

              ///Divider
              provider.isEditing
                  ? Divider(
                    height: 0,
                    color: ColorRes.black.withValues(alpha: 0.1),
                  )
                  : SizedBox.shrink(),

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
