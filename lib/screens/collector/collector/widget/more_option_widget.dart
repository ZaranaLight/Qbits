import 'package:qbits/common/widget/app_alert_dialog.dart';
import 'package:qbits/qbits.dart';

class MoreOptionsPopup extends StatelessWidget {
  const MoreOptionsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      constraints: BoxConstraints(maxWidth: 100.w),
      offset: Offset(0, 30.ph),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        side: BorderSide(color: ColorRes.white),
      ),
      padding: EdgeInsets.all(12.pw),
      color: ColorRes.white,
      itemBuilder: (con) {
        return [
          PopupMenuItem(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// Edit
                InkWell(
                  onTap: () {
                    context.navigator.pop();
                    context.navigator.pushNamed(EditCollectorScreen.routeName);
                  },
                  borderRadius: BorderRadius.circular(5.pw),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.pw,
                      horizontal: 8.pw,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgAsset(
                          imagePath: AssetRes.editIcon,
                          color: ColorRes.primaryColor,
                          width: 15.ph,
                        ),
                        Text(
                          context.l10n?.edit ?? "Edit",
                          style: styleW500S14.copyWith(
                            color: ColorRes.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Divider
                Divider(height: 0, color: ColorRes.lightGrey),

                /// Delete
                InkWell(
                  onTap: () {
                    context.navigator.pop();
                    openAppAlertDialog(
                      context,
                      title: 'Alert',
                      onYesTap: () => context.navigator.pop(),
                      subTitle:
                      'Are you sure you want to delete this inverter?',
                    );
                  },
                  borderRadius: BorderRadius.circular(5.pw),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.pw,
                      horizontal: 8.pw,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgAsset(
                          imagePath: AssetRes.deleteIcon,
                          color: ColorRes.red,
                          width: 15.ph,
                        ),
                        Text(
                          context.l10n?.delete ?? "Delete",
                          style: styleW500S14.copyWith(
                            color: ColorRes.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
      },
      child: Padding(
        padding: EdgeInsets.all(16.pw),
        child: SvgAsset(
          imagePath: AssetRes.horizontalDots,
          width: 24.pw,
        ),
      ),
    );
  }
}
