import 'package:qbits/qbits.dart';

class DeviceTypeBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: 100.h,
            padding: EdgeInsets.only(
              top: Constants.horizontalPadding,
              bottom: Constants.safeAreaPadding.bottom + 10.ph,
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select Option', style: styleW600S20),
                    InkWell(
                      onTap: () => context.navigator.pop(),
                      borderRadius: BorderRadius.circular(5.pw),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgAsset(
                          imagePath: AssetRes.closeIcon,
                          width: 12.pw,
                        ),
                      ),
                    ),
                  ],
                ),

                15.ph.spaceVertical,

                /// Divider
                Divider(color: ColorRes.primaryColor),

                /// Inverter Option
                InkWell(
                  onTap: () {
                    context.navigator.pop();
                    context.navigator.pushNamed(AddInverterScreen.routeName);
                  },
                  borderRadius: BorderRadius.circular(5.pw),
                  child: Container(
                    width: 100.h,
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Inverter', style: styleW600S16),
                  ),
                ),

                Divider(color: ColorRes.black.withOpacity(0.1)),

                /// Energy Manager Option
                InkWell(
                  onTap: () {
                    context.navigator.pop();
                    context.navigator.pushNamed(
                      AddEnergyManagerScreen.routeName,
                    );
                  },
                  borderRadius: BorderRadius.circular(5.pw),
                  child: Container(
                    width: 100.h,
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Energy Manager', style: styleW600S16),
                  ),
                ),

                15.ph.spaceVertical,
              ],
            ),
          ),
        );
      },
    );
  }
}
