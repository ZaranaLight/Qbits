import 'package:qbits/qbits.dart';

class BasicWidget extends StatelessWidget {
  const BasicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CollectorProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(color: ColorRes.white),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoRow(
                "${context.l10n?.collectorModel}:",
                provider.collectorModel.model,
              ),
              _infoRow(
                context.l10n?.runningStatus ?? "",
                provider.collectorModel.status,
                isStatus: true,
              ),
              _infoRow(
                "${context.l10n?.collectorSN}:",
                provider.collectorModel.sn,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _infoRow(String label, String value, {bool isStatus = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.pw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: styleW600S14.copyWith(
                color: ColorRes.black.withValues(alpha: 0.5),
              ),
            ),
          ),
          Row(
            children: [
              Text(value, style: styleW500S14),
              if (isStatus)
                Padding(
                  padding: EdgeInsets.only(left: 4.pw),
                  child: SvgAsset(
                    imagePath: AssetRes.offlineIcon,
                    width: 18.pw,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
