import 'package:qbits/qbits.dart';

class ModeSettings {
  String pointOfTime;
  String mode1;
  String startTime1;
  String endTime1;
  String powerSet1;
  String socSet1;
  String voltageSet1;

  ModeSettings({
    this.pointOfTime = 'Point of time 1',
    this.mode1 = 'Disable',
    this.startTime1 = '',
    this.endTime1 = '',
    this.powerSet1 = '0–30',
    this.socSet1 = '0–100',
    this.voltageSet1 = '0–1000',
  });
}

class ModeWidget extends StatelessWidget {
  const ModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RemoteControlProvider>(
      builder: (context, provider, child) {
        final mode = provider.modeSettings;
        return Container(
          color: ColorRes.white,
          child: Column(
            spacing: 12.ph,
            children: [
              // Dropdown: Point of time
              _buildDropdownTile(
                context,
                'Point of time',
                mode.pointOfTime,
                [
                  'Point of time 1',
                  'Point of time 2',
                  'Point of time 3',
                  'Point of time 4',
                  'Point of time 5',
                ],
                (val) => provider.updatePointOfTime(val!),
              ),

              // Dropdown: Mode 1
              _buildDropdownTile(context, 'Mode 1', mode.mode1, [
                'Enable',
                'Disable',
                'DisCharge',
                'Grid Charge',
                'Gen Charge',
              ], (val) => provider.updateMode1(val!)),

              // Start Time
              _buildTextFieldTile(
                'Start Time1',
                mode.startTime1,
                provider.updateStartTime1,
                hint: 'Text',
              ),

              // End Time
              _buildTextFieldTile(
                'End Time1',
                mode.endTime1,
                provider.updateEndTime1,
                hint: 'Text',
              ),

              // Power Set1
              _buildTextFieldTile(
                'Power Set1',
                mode.powerSet1,
                provider.updatePowerSet1,
                hint: '0–30',
              ),

              // Soc Set1
              _buildTextFieldTile(
                'Soc Set1',
                mode.socSet1,
                provider.updateSocSet1,
                hint: '0–100',
              ),

              // Voltage Set1
              _buildTextFieldTile(
                'Voltage Set1',
                mode.voltageSet1,
                provider.updateVoltageSet1,
                hint: '0–1000',
              ),

              /// Vertical space
              6.ph.spaceVertical,

              /// Setup Button
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.pw),
                  child: SizedBox(
                    width: 90.pw,
                    height: 38.ph,
                    child: EmptyButton(
                      isBordered: true,
                      style: styleW500S14.copyWith(
                        color: ColorRes.primaryColor,
                      ),
                      title: context.l10n?.setUp ?? "",
                    ),
                  ),
                ),
              ),

              /// Vertical space
              7.ph.spaceVertical,
            ],
          ),
        );
      },
    );
  }

  Widget _buildDropdownTile(
    BuildContext context,
    String title,
    String value,
    List<String> options,
    Function(String?) onChanged,
  ) {
    return Container(
      height: 42.ph,
      decoration: BoxDecoration(color: ColorRes.white),
      padding: EdgeInsets.symmetric(horizontal: 16.pw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: styleW600S14)),
          DropdownButton<String>(
            value: value,
            alignment: Alignment(1, 1),
            items:
                options
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(e),
                        ),
                      ),
                    )
                    .toList(),
            onChanged: onChanged,
            underline: SizedBox(),
            // hides bottom border
            icon: Padding(
              padding: EdgeInsets.only(left: 8.pw),
              child: SvgAsset(
                imagePath: AssetRes.downArrowIcon,
                color: ColorRes.grey2,
              ),
            ),
            style: styleW600S14.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldTile(
    String title,
    String value,
    Function(String) onChanged, {
    String hint = '',
  }) {
    return Container(
      height: 42.ph,
      decoration: BoxDecoration(color: ColorRes.white),
      padding: EdgeInsets.symmetric(horizontal: 16.pw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: styleW600S14)),
          SizedBox(
            width: 120.pw,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorRes.black.withValues(alpha: 0.1),
                ),
                borderRadius: BorderRadius.circular(4.pw),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.pw, vertical: 10.ph),
              child: TextFormField(
                initialValue: value,
                onChanged: onChanged,
                style: styleW500S14.copyWith(
                  color: ColorRes.black.withValues(alpha: 0.6),
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  hintStyle: styleW500S14.copyWith(
                    color: ColorRes.black.withValues(alpha: 0.6),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
