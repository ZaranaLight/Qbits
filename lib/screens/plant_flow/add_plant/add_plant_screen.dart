import 'package:map_location_picker/map_location_picker.dart';
import 'package:qbits/common/widget/common_widgets.dart';
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
              ///Station Name
              _buildTextFormFieldTile(
                'Station Name',
                provider.plant.stationName,
                provider.updatePlantStationNameTap,
                keyboardType: TextInputType.text,
                hintTitle: "Enter station name",
              ),

              /// Divider
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              /// Error Text
              _AppErrorTextWidget(errorText: provider.stationNameError),

              ///Your City
              _buildTextFormFieldTile(
                'Your City',
                provider.plant.city,
                provider.updatePlantCityNameTap,
                keyboardType: TextInputType.text,
                hintTitle: "Enter your name",
              ),

              /// Divider
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              /// Error Text
              _AppErrorTextWidget(errorText: provider.cityError),

              ///Capacity
              _buildTextFormFieldTile(
                'Capacity(kW)',
                provider.plant.capacity,
                provider.updatePlantCapacityKWTap,
                keyboardType: TextInputType.text,
                hintTitle: "Enter station name",
              ),

              /// Divider
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              /// Error Text
              _AppErrorTextWidget(errorText: provider.capacityError),

              ///Station Type
              _buildDropdownField(
                title: "Station Type",
                value: provider.selectedStationType,
                options: provider.stationTypes,
                onChanged: (value) {
                  if (value != null) provider.setStationType(value);
                },
              ),

              /// Divider
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              /// Error Text
              _AppErrorTextWidget(errorText: provider.stationTypeError),

              ///Battery
              _buildTextFormFieldTile(
                'Battery',
                provider.plant.battery,
                provider.updatePlantBatteryTap,
                keyboardType: TextInputType.text,
                hintTitle: "Kwh",
              ),

              /// Divider
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              /// Error Text
              _AppErrorTextWidget(errorText: provider.batteryError),

              ///Longitude
              _buildTextFormFieldTile(
                'Longitude',
                provider.plant.latitude,
                provider.updatePlantLatitude,
                keyboardType: TextInputType.text,
                hintTitle: "Enter Longitude",
              ),

              /// Divider
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              /// Error Text
              _AppErrorTextWidget(errorText: provider.latitudeError),

              ///Latitude
              _buildTextFormFieldTile(
                'Latitude',
                provider.plant.longitude,
                provider.updatePlantLongitude,
                keyboardType: TextInputType.text,
                hintTitle: "Enter Latitude",
              ),

              /// Divider
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              /// Error Text
              _AppErrorTextWidget(errorText: provider.longitudeError),

              /// Space
              10.ph.spaceVertical,

              /// Map Location Picker
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
          10.pw.spaceHorizontal,
          Expanded(
            flex: 2,
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
          10.pw.spaceHorizontal,
          Expanded(
            flex: 2,
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

class _AppErrorTextWidget extends StatelessWidget {
  final String? errorText;

  const _AppErrorTextWidget({this.errorText});

  @override
  Widget build(BuildContext context) {
    return ErrorText(error: errorText, bottomPadding: 9.ph, leftPadding: 0);
  }
}
