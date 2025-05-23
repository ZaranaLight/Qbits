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
                title: SearchTextField(
                  hintText: context.l10n?.search,
                  controller: state.searchController,
                  prefixIcon: SvgAsset(imagePath: AssetRes.searchIcon),
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
                          height: 16.pw,
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
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 16.pw,
                        left: 10.pw,
                        bottom: 10.ph,
                        top: 10.ph,
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
                child: CustomSingleChildScroll(
                  padding: EdgeInsets.all(Constants.horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Show only if search is empty
                      if (state.searchController.text.isEmpty) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context.l10n?.searchHistory ?? "",
                              style: styleW500S14,
                            ),
                            InkWell(
                              onTap: () {
                                context.read<SearchProvider>().clearHistory();
                              },
                              child: SvgAsset(imagePath: AssetRes.deleteIcon),
                            ),
                          ],
                        ),
                        10.ph.spaceVertical,

                        /// History List
                        ...state.history.map((item) {
                          return InkWell(
                            onTap: () {
                              state.searchController.text = item;
                              context.read<SearchProvider>().addQuery(item);
                              // You can navigate or show results here if needed
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.ph),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.history,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  10.pw.spaceHorizontal,
                                  Expanded(
                                    child: Text(
                                      item,
                                      style: styleW400S14,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ],
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
