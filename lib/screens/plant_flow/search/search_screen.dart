import 'package:qbits/qbits.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static const routeName = "search";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SearchProvider>(
      create: (c) => SearchProvider(),
      child: SearchScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, state, child) {
        return Scaffold(
          body: Column(
            children: [
              AppBar(
                backgroundColor: ColorRes.primaryColor,
                toolbarHeight: 80.pw,
                title: SearchTextField(
                  hintText: context.l10n?.search,
                  controller: state.searchController,
                  prefixIcon: SvgAsset(
                    imagePath: AssetRes.searchIcon,
                    width: 14.pw,
                    height: 14.ph,
                    color: ColorRes.white.withValues(alpha: 0.8),
                  ),
                ),
                // leadingWidth: ,
                centerTitle: true,
                titleSpacing: 0,
                leading: Padding(
                  padding: EdgeInsets.only(right: 2.pw),
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
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      final query = state.searchController.text.trim();
                      if (query.isNotEmpty) {
                        context.read<SearchProvider>().addQuery(query);
                        // Navigate or show results
                      }
                    },
                    borderRadius: BorderRadius.circular(8.pw),
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: Constants.horizontalPadding,
                        left: 10.pw,
                        bottom: 16.ph,
                        top: 16.ph,
                      ),
                      child: Text(
                        context.l10n?.search ?? "",
                        style: styleW500S14.copyWith(color: ColorRes.white),
                      ),
                    ),
                  ),
                ],
                elevation: 0,
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: ColorRes.white),
                  child: CustomListView(
                    itemCount: 2,
                    padding: EdgeInsets.zero,
                    separatorBuilder:
                        (ctx, ind) => Container(
                          height: 1.ph,
                          width: 100.pw,
                          margin: EdgeInsets.symmetric(
                            horizontal: Constants.horizontalPadding,
                          ),
                          color: ColorRes.black.withValues(alpha: 0.1),
                        ),
                    itemBuilder: (context, index) => MyWatchlistCell(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
