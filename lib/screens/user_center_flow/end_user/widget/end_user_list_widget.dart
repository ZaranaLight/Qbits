import 'package:qbits/qbits.dart';

class EndUserListWidget extends StatelessWidget {
  final double? height  ;
  final double? width  ;
  final VoidCallback? onTap;
  const EndUserListWidget({super.key, this.height, this.width, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorRes.white,
      borderRadius: BorderRadius.circular(8.pw),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.pw),
        child: Padding(
          padding: EdgeInsets.all(12.pw),
          child: Row(
            children: [
              /// User Image
              AssetsImg(
                imagePath: AssetRes.profileImg,
                width: width ??107.pw,
                height: height??107.pw,
              ),

              /// Space
              10.pw.spaceHorizontal,

              /// User Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// User Name
                    Text("Guest", style: styleW700S16),

                    ///Space
                    4.ph.spaceVertical,

                    ///Password
                    Text(
                      'Password: 1234',
                      style: styleW500S12.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.6),
                      ),
                    ),

                    ///Space
                    4.ph.spaceVertical,

                    ///Phone
                    Text(
                      'Phone:',
                      style: styleW500S12.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.6),
                      ),
                    ),

                    ///Space
                    4.ph.spaceVertical,

                    ///Mail
                    Text(
                      'Mail:',
                      style: styleW500S12.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
