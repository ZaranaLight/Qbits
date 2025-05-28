import 'package:qbits/qbits.dart';

class MyWatchlistScreen extends StatelessWidget {
  const MyWatchlistScreen({super.key});

  static const routeName = "my_watchlist";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<MyWatchlistProvider>(
      create: (c) => MyWatchlistProvider(),
      child: MyWatchlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyWatchlistProvider>(
      builder: (context, state, child) {
        return Scaffold(
          body: Column(
            children: [
              CustomAppBar(title: context.l10n?.myWatchlist ?? ""),

              Expanded(child: MyWatchlistCellListView()),

              /// Space
              20.ph.spaceVertical,
            ],
          ),
        );
      },
    );
  }
}
