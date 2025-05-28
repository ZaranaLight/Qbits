import 'package:qbits/qbits.dart';

class TabWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  final bool isLogout;

  const TabWidget({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorRes.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.ph, horizontal: 5.pw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///Svg Icon
              SvgAsset(width: 20.pw, imagePath: imagePath, height: 20.pw),

              /// Space
              10.pw.spaceHorizontal,

              ///Ph
              Expanded(
                child: Text(
                  title,
                  style: styleW600S16.copyWith(
                    color: isLogout ? ColorRes.darkRed : ColorRes.black2,
                  ),
                ),
              ),

              /// Forward Icon
              SvgAsset(
                imagePath: AssetRes.forwardIcon,
                color: ColorRes.black.withValues(alpha: 0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
