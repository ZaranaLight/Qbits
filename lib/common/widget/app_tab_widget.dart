import 'package:qbits/qbits.dart';

class TabWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  final bool isLogout;
  final Widget? trailingWidget;

  const TabWidget({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
    this.trailingWidget,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorRes.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5.pw),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.ph, horizontal: 5.pw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///Svg Icon
              SvgAsset(
                width: 20.pw,
                height: 20.ph,
                imagePath: imagePath,
                color: ColorRes.black2,
              ),

              /// Space
              10.pw.spaceHorizontal,

              ///Ti
              Expanded(
                child: Text(
                  title,
                  style: styleW600S16.copyWith(
                    color: isLogout ? ColorRes.darkRed : ColorRes.black,
                  ),
                ),
              ),

              /// Forward Icon
              trailingWidget ??
                  SvgAsset(
                    imagePath: AssetRes.forwardIcon,
                    color: ColorRes.black.withValues(alpha: 0.6),
                    height: 13.ph,
                    width: 9.pw,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
