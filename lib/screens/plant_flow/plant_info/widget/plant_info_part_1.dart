import 'package:qbits/qbits.dart';

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
              EditableInfoField(
                title: 'Station Name',
                value: provider.plantInfoPart1Class.stationName,
                isEditing: provider.isEditing,
                onTap: () => provider.onStationNameTap(context),
              ),

              ///Your City
              EditableInfoField(
                title: 'Your City',
                value: provider.plantInfoPart1Class.yourCity,
                isEditing: provider.isEditing,
                onTap: () => provider.onYourCityTap(context),
              ),

              ///Capacity
              EditableInfoField(
                title: 'Capacity(kW)',
                value: provider.plantInfoPart1Class.capacity,
                isEditing: provider.isEditing,
                onTap: () => provider.onCapacityTap(context),
              ),

              ///Station Type
              provider.isEditing
                  ? AppDropDownMenuWidget(
                    title: 'Station Type',
                    topPadding: 15.ph,
                    bottomPadding: 15.ph,
                    leftPadding: 0,
                    titleColor: ColorRes.black.withValues(alpha: 0.5),
                    backgroundColor: ColorRes.white,
                    context: context,
                    value: provider.plantInfoPart1Class.stationType,
                    options: [
                      ' 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0',
                      'Battery storage system',
                      'Solar System with Battery',
                    ],
                    onChanged: (value) => provider.updateStationType(value!),
                  )
                  : PlantInfoViewWidget(
                    title: 'Station Type',
                    value: provider.plantInfoPart1Class.stationType,
                  ),

              ///Divider
              Divider(height: 0, color: ColorRes.black.withValues(alpha: 0.1)),

              ///  Battery Capacity
              EditableInfoField(
                title: 'Battery Capacity',
                value: provider.plantInfoPart1Class.batteryCapacity,
                isEditing: provider.isEditing,
                onTap: () => provider.onBatteryCapacityTap(context),
              ),

              ///  Longitude
              EditableInfoField(
                title: 'Longitude',
                value: provider.plantInfoPart1Class.longitude,
                isEditing: provider.isEditing,
                onTap: () => provider.onLongitudeTap(context),
              ),

              ///  Latitude
              EditableInfoField(
                title: 'Latitude',
                value: provider.plantInfoPart1Class.latitude,
                isEditing: provider.isEditing,
                onTap: () => provider.onLatitudeTap(context),
              ),

              /// Owner’s Phone
              EditableInfoField(
                title: 'Owner’s Phone',
                value: provider.plantInfoPart1Class.ownerPhone,
                isEditing: provider.isEditing,
                onTap: () => provider.onOwnerPhoneTap(context),
              ),

              /// Admin’s Phone
              EditableInfoField(
                title: 'Admin’s Phone',
                value: provider.plantInfoPart1Class.adminPhone,
                isEditing: provider.isEditing,
                onTap: () => provider.onAdminPhoneTap(context),
              ),

              /// Installer’s Phone
              EditableInfoField(
                title: 'Installer’s Phone',
                value: provider.plantInfoPart1Class.installerPhone,
                isEditing: provider.isEditing,
                onTap: () => provider.onInstallerPhoneTap(context),
                isLastItem: true,
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
