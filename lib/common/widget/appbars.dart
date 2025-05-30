import 'package:qbits/qbits.dart';
import 'package:qbits/utils/responsive_utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final bool centerTitle;
  final bool showBackBtn;
  final Widget? appBarWidget;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.appBarWidget,
    this.backgroundColor = ColorRes.primaryColor,
    this.centerTitle = true,
    this.showBackBtn = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          appBarWidget ??
          Text(
            title ?? "",
            style: styleW600S20.copyWith(color: ColorRes.white),
          ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      leading:
          /// Back Button
          (showBackBtn)
              ? Padding(
                padding: EdgeInsets.only(
                  right: 2.pw,
                  left: Constants.isTablet ? 16.pw : 0,
                ),
                child: InkWell(
                  onTap: context.navigator.pop,
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    height: 40.pw,
                    width: 40.pw,
                    child: Center(
                      child: SvgAsset(
                        imagePath: AssetRes.backIcon,
                        height: Constants.horizontalPadding,
                      ),
                    ),
                  ),
                ),
              )
              : SizedBox(),
      actions: actions,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
