import 'package:qbits/qbits.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    this.title,
    this.onTap,
    this.bgColor,
    this.enable = true,
    this.loading = false,
    this.style,
    this.height,
  });

  final String? title;
  final VoidCallback? onTap;
  final double? height;
  final TextStyle? style;
  final Color? bgColor;
  final bool enable;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 200.milliseconds,
      width: 100.w,
      height: height ?? 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.pw),
        color:
            enable
                ? bgColor ?? ColorRes.primaryColor
                : bgColor?.withValues(alpha: 0.6) ??
                    ColorRes.primaryColor.withValues(alpha: 0.6),
      ),
      child: AnimatedSwitcher(
        duration: 300.milliseconds,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Builder(
          key: ValueKey<bool>(loading),
          builder: (context) {
            if (loading) {
              return Center(
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(color: ColorRes.white),
                ),
              );
            }
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: enable ? onTap : null,
                borderRadius: BorderRadius.circular(4),
                child: Center(
                  child: Text(
                    title ?? '',
                    style:
                        style ??
                        styleW700S17.copyWith(
                          color: ColorRes.white,
                          fontSize: Constants.horizontalPadding,
                        ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class EmptyButton extends StatelessWidget {
  const EmptyButton({
    super.key,
    this.title,
    this.onTap,
    this.enable = true,
    this.loading = false,
  });

  final String? title;
  final VoidCallback? onTap;
  final bool enable;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 48,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: AnimatedSwitcher(
        duration: 300.milliseconds,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Builder(
          key: ValueKey<bool>(loading),
          builder: (context) {
            if (loading) {
              return Center(
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(color: ColorRes.black),
                ),
              );
            }
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: enable ? onTap : null,
                borderRadius: BorderRadius.circular(4),
                child: Center(
                  child: Text(
                    title ?? '',
                    style: styleW700S17.copyWith(
                      color: enable ? null : ColorRes.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
