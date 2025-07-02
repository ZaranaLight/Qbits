import 'package:qbits/qbits.dart';
import 'package:qbits/screens/plant_flow/plant_info/widget/drop_down_widget_2.dart';


class PlantInfoPart1 extends StatelessWidget {
  const PlantInfoPart1({super.key});

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
              ///Station Name
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Station Name',
                    value: provider.plantInfoPart1Class.stationName,
                    onTap: () {
                      provider.onStationNameTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Station Name',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart1Class.stationName.toString(),
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

              ///Your City
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Your City',
                    value: provider.plantInfoPart1Class.yourCity,
                    onTap: () {
                      provider.onYourCityTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your City',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart1Class.yourCity.toString(),
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

              ///  Battery Capacity
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Capacity(kW)',
                    value: provider.plantInfoPart1Class.capacity,
                    onTap: () {
                      provider.onBatteryCapacityTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Capacity(kW)',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart1Class.capacity.toString(),
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

              ///Station Type
              provider.isEditing
                  ? DropdownWidget2(
                    title: 'Station Type',
                    backgroundColor: ColorRes.white,
                    context: context,
                    value: provider.plantInfoPart1Class.stationType,
                    options: [
                      'Solar System',
                      'Battery storage system',
                      'Solar System with Battery',
                    ],
                    onChanged: (value) => provider.updateStationType(value!),
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Station Type',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart1Class.stationType.toString(),
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

              ///  Battery Capacity
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Battery Capacity',
                    value: provider.plantInfoPart1Class.batteryCapacity,
                    onTap: () {
                      provider.onCapacityTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Battery Capacity',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart1Class.batteryCapacity
                              .toString(),
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

              /// Longitude
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Longitude',
                    value: provider.plantInfoPart1Class.longitude,
                    onTap: () {
                      provider.onLongitudeTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Longitude',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart1Class.longitude.toString(),
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

              /// Longitude
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Latitude:',
                    value: provider.plantInfoPart1Class.latitude,
                    onTap: () {
                      provider.onLatitudeTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latitude',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart1Class.latitude.toString(),
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

              ///Owner’s Phone
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Owner’s Phone',
                    value: provider.plantInfoPart1Class.ownerPhone,
                    onTap: () {
                      provider.onOwnerPhoneTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Owner’s Phone',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart1Class.ownerPhone.toString(),
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

              ///Admin’s Phone
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Admin’s Phone',
                    value: provider.plantInfoPart1Class.adminPhone,
                    onTap: () {
                      provider.onAdminPhoneTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Admin’s Phone',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart1Class.adminPhone.toString(),
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

              ///Installer’s Phone
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Installer’s Phone',
                    value: provider.plantInfoPart1Class.installerPhone,
                    onTap: () {
                      provider.onInstallerPhoneTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Installer’s Phone',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart1Class.installerPhone
                              .toString(),
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
