import 'package:qbits/qbits.dart';

class BackUpWidget extends StatelessWidget {
  const BackUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorRes.white),
      margin: EdgeInsets.symmetric(horizontal: 14.pw),
      padding: EdgeInsets.symmetric(horizontal: 14.pw, vertical: 12.ph),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorRes.primaryColor,
                  borderRadius: BorderRadius.circular(4.pw),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.pw, vertical: 2.ph),
                child: Text(
                  context.l10n?.acInfo ?? "",
                  style: styleW400S14.copyWith(color: ColorRes.white),
                ),
              ),
              Text(
                context.l10n?.voltage ?? "",
                style: styleW500S14.copyWith(
                  color: ColorRes.black.withValues(alpha: 0.6),
                ),
              ),
              Text(
                context.l10n?.current ?? "",
                style: styleW500S14.copyWith(
                  color: ColorRes.black.withValues(alpha: 0.6),
                ),
              ),
              Text(
                context.l10n?.frequency ?? "",
                style: styleW500S14.copyWith(
                  color: ColorRes.black.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),

          ///Space
          30.pw.spaceVertical,

          /// Data Row
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Power:',
                      style: styleW400S14.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.6),
                      ),
                    ),

                    /// Space
                    8.pw.spaceVertical,
                    Text('0kW', style: styleW700S14),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Product:',
                      style: styleW400S14.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.6),
                      ),
                    ),

                    /// Space
                    8.pw.spaceVertical,
                    Text('0kWh', style: styleW700S14),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
