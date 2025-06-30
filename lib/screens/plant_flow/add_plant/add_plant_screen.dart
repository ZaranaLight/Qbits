import 'package:map_location_picker/map_location_picker.dart';
import 'package:qbits/qbits.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({super.key});

  static const routeName = "add_plant";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AddPlantProvider>(
      create: (c) => AddPlantProvider(),
      child: AddPlantScreen(),
    );
  }

  @override
  State<AddPlantScreen> createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    // _locateUser();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddPlantProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.ph,
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
              ),
              child: SubmitButton(
                title: context.l10n?.confirm ?? "",
                onTap: () {
                  provider.submitPlant(context);
                },
              ),
            ),
          ),
          appBar: CustomAppBar(title: context.l10n?.addPlant ?? ""),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildTextFormFieldTile(
                'Station Name',
                provider.plant.stationName,
                provider.updatePlantStationNameTap,
                keyboardType: TextInputType.text,
                hintTitle: "Enter station name",
              ),
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),
              _buildTextFormFieldTile(
                'Your City',
                provider.plant.city,
                provider.updatePlantCityNameTap,
                keyboardType: TextInputType.text,
                hintTitle: "Enter station name",
              ),

              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              _buildTextFormFieldTile(
                'Capacity(kW)',
                provider.plant.capacity,
                provider.updatePlantCapacityKWTap,
                keyboardType: TextInputType.text,
                hintTitle: "Enter station name",
              ),
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              _buildDropdownField(
                title: "Station Type",
                value: provider.selectedStationType,
                options: provider.stationTypes,
                onChanged: (value) {
                  if (value != null) provider.setStationType(value);
                },
              ),
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              _buildTextFormFieldTile(
                'Battery',
                provider.plant.battery,
                provider.updatePlantBatteryTap,
                keyboardType: TextInputType.text,
                hintTitle: "Kwh",
              ),
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              _buildTextFormFieldTile(
                'Longitude',
                provider.plant.latitude,
                provider.updatePlantLatitude,
                keyboardType: TextInputType.text,
                hintTitle: "Enter Longitude",
              ),
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              _buildTextFormFieldTile(
                'Latitude',
                provider.plant.longitude,
                provider.updatePlantLongitude,
                keyboardType: TextInputType.text,
                hintTitle: "Enter Latitude",
              ),
              10.ph.spaceVertical,
              SizedBox(
                height: 200.ph,
                child: AssetsImg(imagePath: AssetRes.mapImg),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDropdownField({
    required String title,
    required String value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
    String? trailingIcon,
    void Function()? onScanTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: styleW500S14.copyWith(
                color: ColorRes.black.withValues(alpha: 0.5),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: value,
                    underline: SizedBox.shrink(),
                    onChanged: onChanged,
                    style: styleW500S14,
                    padding: EdgeInsets.zero,
                    isDense: true,
                    icon: const SizedBox.shrink(),
                    // hides the arrow
                    items:
                        options
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                  ),
                ),
                if (trailingIcon != null)
                  GestureDetector(
                    onTap: onScanTap,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SvgAsset(
                        imagePath: trailingIcon,
                        color: ColorRes.primaryColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormFieldTile(
    String title,
    String value,
    ValueChanged<String> onChanged, {
    TextInputType keyboardType = TextInputType.text,
    String? hintTitle,
  }) {
    return SizedBox(
      height: 28.ph,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: styleW500S14.copyWith(
                color: ColorRes.black.withValues(alpha: 0.5),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              initialValue: value,
              onChanged: onChanged,
              keyboardType: keyboardType,
              style: styleW500S14.copyWith(),
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: hintTitle,
                hintStyle: styleW500S14.copyWith(
                  color: ColorRes.black.withValues(alpha: 0.6),
                ),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
