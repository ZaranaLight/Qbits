import 'package:qbits/qbits.dart';

class EndUserListWidget extends StatelessWidget {
  const EndUserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.pw),
        color: ColorRes.white,
      ),
      child: Material(
        color: ColorRes.transparent,
        child: InkWell(
          onTap: () {
            context.navigator.pushNamed(
              GuestScreen.routeName,
            );
          },
          borderRadius: BorderRadius.circular(8.pw),
          child: Padding(
            padding: EdgeInsets.all(12.pw),
            child: Row(
              children: [
                /// User Image
                AssetsImg(
                  imagePath: AssetRes.profileImg,
                  width: 96.pw,
                  height: 96.pw,
                ),

                /// Space
                10.pw.spaceHorizontal,

                /// User Details
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    /// User Name
                    Text(
                      'Guest',
                      style: styleW700S17.copyWith(
                        fontSize: 16,
                      ),
                    ),

                    ///Space
                    4.ph.spaceVertical,

                    ///Password
                    Text(
                      'Password: 1234',
                      style: styleW500S12.copyWith(
                        color: ColorRes.black.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),

                    ///Space
                    4.ph.spaceVertical,

                    ///Phone
                    Text(
                      'Phone:',
                      style: styleW500S12.copyWith(
                        color: ColorRes.black.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),

                    ///Space
                    4.ph.spaceVertical,

                    ///Mail
                    Text(
                      'Mail:',
                      style: styleW500S12.copyWith(
                        color: ColorRes.black.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
