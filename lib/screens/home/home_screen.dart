import 'package:qbits/qbits.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = "home";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (c) => HomeProvider(),
      child: HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, state, child) {
        return Column(
          children: [
            _AppBar(),

            Expanded(
              child: StackedLoader(
                loading: state.loader,
                child: CustomSingleChildScroll(
                  padding: EdgeInsets.all(Constants.horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Space
                      6.ph.spaceVertical,
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.primaryColor,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: Constants.horizontalPadding,
            right: Constants.horizontalPadding,
            top: 10.ph,
            bottom: 20.ph,
          ),
          child: Row(children: []),
        ),
      ),
    );
  }
}

class _UpcomingLeaveCell extends StatelessWidget {
  const _UpcomingLeaveCell();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: []);
  }
}
