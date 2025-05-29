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
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.ph),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///Svg Icon
              SvgAsset(width: 20.pw, imagePath: imagePath,  ),

              /// Space
              10.pw.spaceHorizontal,

              ///Ti
              Expanded(
                child: Text(
                  title,
                  style: styleW600S16.copyWith(color: ColorRes.black2),
                ),
              ),

              /// Forward Icon
              trailingWidget ??
                  SvgAsset(
                    imagePath: AssetRes.forwardIcon,
                    color: ColorRes.black,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
