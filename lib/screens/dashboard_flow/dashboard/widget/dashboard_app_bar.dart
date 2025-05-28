import 'package:qbits/qbits.dart';
class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key, this.title, this.actionWidget});

  final String? title;
  final Widget? actionWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: ColorRes.primaryColor,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(
            top: actionWidget != null ? 0 : 5.ph,
            bottom: actionWidget != null ? 10.ph : 18.ph,
            left: Constants.horizontalPadding,
            right: actionWidget != null ? 0 : Constants.horizontalPadding,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title ?? "",
                  style: styleW700S24.copyWith(color: ColorRes.white),
                ),
              ),
              actionWidget ?? SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
