import 'package:qbits/qbits.dart';

class DeviceLibraryWidget extends StatelessWidget {
  const DeviceLibraryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Material(
            color: ColorRes.transparent,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(5.pw),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.pw,
                      vertical: 16.ph,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.l10n?.deviceLibrary ?? "",
                          style: styleW500S16.copyWith(
                            color: ColorRes.black.withValues(alpha: 0.6),
                          ),
                        ),

                        /// Forward Icon
                        SvgAsset(
                          imagePath: AssetRes.forwardIcon,
                          color: ColorRes.black.withValues(alpha: 0.3),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: 1,
                    color: ColorRes.black.withValues(alpha: 0.10),
                  ),

                  /// Space
                  14.ph.spaceVertical,

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.pw),
                    child: Row(
                      children: [
                        Text(
                          "${context.l10n?.allQuantity ?? ""}: ",
                          style: styleW500S16.copyWith(
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.deviceLibraryResponseModel?.count
                                  .toString() ??
                              "0",
                          style: styleW600S16.copyWith(
                            color: ColorRes.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Space
                  13.ph.spaceVertical,

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.pw,
                      vertical: 20.ph,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _dotWidget(
                          color: ColorRes.parrot,
                          title: context.l10n?.online ?? "",
                          value:
                              provider.deviceLibraryResponseModel?.online
                                  .toString() ??
                              "0",
                          isRightSide: false,
                        ),
                        _dotWidget(
                          color: ColorRes.orange,
                          title: context.l10n?.offline ?? "",
                          value:
                              provider.deviceLibraryResponseModel?.offline
                                  .toString() ??
                              "0",
                          isRightSide: false,
                        ),
                        _dotWidget(
                          color: ColorRes.pinkish,
                          title: context.l10n?.alarm ?? "",
                          value:
                              provider.deviceLibraryResponseModel?.alarm
                                  .toString() ??
                              "0",
                          isRightSide: true,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.pw),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _dotWidget(
                          color: ColorRes.azureBlue,
                          title: context.l10n?.correlate ?? "",
                          value:
                              provider.deviceLibraryResponseModel?.plant
                                  .toString() ??
                              "0",
                          isRightSide: false,
                        ),
                        _dotWidget(
                          color: ColorRes.mintBlue,
                          title: context.l10n?.uncorrelate ?? "",
                          value:
                              provider.deviceLibraryResponseModel?.unPlant
                                  .toString() ??
                              "0",
                          isRightSide: true,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                      right: 6.pw,
                      left: 6.pw,
                      bottom: 20.ph,
                      top: 11.ph,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20.ph),
                    decoration: BoxDecoration(
                      color: ColorRes.primaryColor.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      spacing: 6.pw,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _activityWidget(
                          title: context.l10n?.dailyActivity ?? "",
                          value:
                              provider.deviceLibraryResponseModel?.dayLive
                                  .toString() ??
                              "0",
                        ),
                        _activityWidget(
                          title: context.l10n?.monthlyActivity ?? "",
                          value:
                              provider.deviceLibraryResponseModel?.monthLive
                                  .toString() ??
                              "0",
                        ),
                        _activityWidget(
                          title: context.l10n?.yearlyActivity ?? "",
                          value:
                              provider.deviceLibraryResponseModel?.yearLive
                                  .toString() ??
                              "0",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _dotWidget({
    required String title,
    required String value,
    required bool isRightSide,
    required Color color,
  }) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            isRightSide ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            textDirection: isRightSide ? TextDirection.rtl : TextDirection.ltr,
            children: [
              /// Dot
              Container(
                height: 14.ph,
                width: 14.ph,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: color.withAlpha(20),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              /// Space
              4.pw.spaceHorizontal,

              /// Title
              Text(
                title,
                style: styleW500S14.copyWith(
                  color: ColorRes.black.withValues(alpha: 0.5),
                  height: 1,
                ),
              ),
            ],
          ),

          /// Space
          4.ph.spaceVertical,

          /// Value
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.pw),
            child: Text(
              value,
              style: styleW400S14.copyWith(
                color: ColorRes.black.withValues(alpha: 0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _activityWidget({required String title, required String value}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Activity Title Text
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: styleW500S14.copyWith(
                color: ColorRes.black.withValues(alpha: 0.5),
              ),
            ),
          ),

          /// Space
          4.ph.spaceVertical,

          /// Activity Value Text
          Text(
            value,
            style: styleW500S18.copyWith(
              color: ColorRes.black.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}
