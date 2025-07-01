import 'package:qbits/qbits.dart';

class MyWatchlistCellListView extends StatelessWidget {
  const MyWatchlistCellListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyWatchlistProvider>(
      builder: (context, state, child) {
        return StackedLoader(
          loading: state.loader,
          child: CustomListView(
            itemCount: 10,
            padding: EdgeInsets.only(
              bottom: Constants.safeAreaPadding.bottom + 15.ph,
            ),
            separatorBuilder: (ctx, ind) {
              return Container(
                height: 1.ph,
                width: 100.pw,
                color: ColorRes.black.withValues(alpha: 0.1),
              );
            },
            itemBuilder: (ctx, ind) {
              return Column(
                children: [
                  MyWatchlistCell(),
                  if (ind + 1 == 10)
                    Column(
                      children: [
                        Container(
                          height: 1.ph,
                          color: ColorRes.black.withValues(alpha: 0.1),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'No More Data',
                            style: styleW400S14.copyWith(
                              color: ColorRes.black.withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class MyWatchlistCell extends StatelessWidget {
  const MyWatchlistCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorRes.transparent,
      child: InkWell(
        onTap: () {
          context.navigator.pushNamed(PlantDetailScreen.routeName);
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Constants.horizontalPadding,
          ),
          margin: EdgeInsets.symmetric(vertical: 20.ph),
          width: 100.w,
          child: Row(
            children: [
              /// Image
              AssetsImg(
                imagePath: AssetRes.tempSolarImg,
                height: 80.ph,
                width: 100.pw,
              ),

              /// Space
              10.pw.spaceHorizontal,

              /// Expanded Column
              Expanded(
                child: Column(
                  spacing: 14,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              "What is Lorem Ipsum?",
                              style: styleW600S14,
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(5.pw),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgAsset(
                              imagePath: AssetRes.starIcon,
                              width: 20.pw,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildData(
                          title: context.l10n?.day ?? "",
                          value: "37.75kwh",
                        ),
                        _buildData(
                          title: context.l10n?.power ?? "",
                          value: "37.75kwh",
                        ),
                        _buildData(
                          title: context.l10n?.total ?? "",
                          value: "37.75kwh",
                        ),
                      ],
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

  Widget _buildData({required String title, required String value}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Text(
            title,
            style: styleW500S12.copyWith(
              color: ColorRes.black.withValues(alpha: 0.5),
            ),
          ),

          /// Space
          4.ph.spaceVertical,

          /// Value
          Text(value, style: styleW600S14),
        ],
      ),
    );
  }
}
