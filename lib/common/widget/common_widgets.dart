import 'package:qbits/qbits.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, this.error, this.topPadding = 0});

  final String? error;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Padding(
        padding: EdgeInsets.only(top: topPadding, left: 10.pw),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Error Icon
            Padding(
              padding: EdgeInsets.only(top: 1),
              child: SvgAsset(imagePath: AssetRes.errorIcon, height: 16.pw),
            ),

            /// Space
            SizedBox(width: 4.pw),

            Expanded(
              child: Text(
                error.toString(),
                style: styleW400S12.copyWith(color: ColorRes.red),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
      secondChild: 100.w.spaceHorizontal,
      alignment: Alignment.center,
      sizeCurve: Curves.bounceOut,
      firstCurve: Curves.bounceOut,
      secondCurve: Curves.bounceOut,
      crossFadeState:
          (error ?? '').isNotEmpty
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
      duration: 300.milliseconds,
    );
  }
}

class AppRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function()? onRefresh;

  const AppRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (onRefresh == null) return child;
    return RefreshIndicator(
      onRefresh: onRefresh!,
      backgroundColor: ColorRes.white,
      color: ColorRes.primaryColor,
      child: child,
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({super.key, required this.icon, this.onTap});

  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.pw,
      width: 40.pw,
      decoration: BoxDecoration(
        color: ColorRes.grey,
        shape: BoxShape.circle,
        border: Border.all(color: ColorRes.grey),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(500),
          child: Center(child: SvgAsset(imagePath: icon, height: 20.pw)),
        ),
      ),
    );
  }
}

class EmptyDataBox extends StatelessWidget {
  const EmptyDataBox({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.ph,
      child: Center(child: Text(text ?? "No Data Found!")),
    );
  }
}

class RadioButtonCell extends StatelessWidget {
  const RadioButtonCell({
    super.key,
    this.title = "",
    this.isSelected = false,
    this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: Padding(
          padding: EdgeInsets.only(top: 5.ph, bottom: 5.ph),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Radio Button
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: AnimatedSwitcher(
                  duration: 300.milliseconds,
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Container(
                    key: ValueKey<bool>(isSelected),
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            isSelected
                                ? ColorRes.primaryColor
                                : ColorRes.grey.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Center(
                      child: Builder(
                        builder: (context) {
                          if (isSelected) {
                            return Container(
                              height: 8.28,
                              width: 8.28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorRes.primaryColor,
                              ),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),

              /// Space
              10.pw.spaceHorizontal,

              /// Title
              Text(title, style: styleW400S14.copyWith(height: 0)),
            ],
          ),
        ),
      ),
    );
  }
}
