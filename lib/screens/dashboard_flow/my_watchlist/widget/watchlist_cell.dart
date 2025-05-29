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

            separatorBuilder: (ctx, ind) {
              return Container(
                height: 1.ph,
                width: 100.pw,
                color: ColorRes.black.withValues(alpha: 0.1),
              );
            },
            itemBuilder: (ctx, ind) {
              return MyWatchlistCell();
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
          padding: EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
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

              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("What is Lorem Ipsum?", style: styleW600S14),

                        SvgAsset(imagePath: AssetRes.starIcon),
                      ],
                    ),

                    /// Space
                    20.ph.spaceVertical,

                    Row(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: styleW500S12.copyWith(
            color: ColorRes.black.withValues(alpha: 50),
          ),
        ),
        Text(value, style: styleW600S14),
      ],
    );
  }
}
