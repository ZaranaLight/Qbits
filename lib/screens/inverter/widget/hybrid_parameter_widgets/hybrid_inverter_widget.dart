import 'package:qbits/qbits.dart';

class HybridInverterWidget extends StatelessWidget {
  const HybridInverterWidget({super.key});

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
                  'Ac Info',
                  style: styleW400S14.copyWith(color: ColorRes.white),
                ),
              ),
              Text(
                'Voltage',
                style: styleW500S14.copyWith(
                  color: ColorRes.black.withValues(alpha: 0.6),
                ),
              ),
              Text(
                'Current',
                style: styleW500S14.copyWith(
                  color: ColorRes.black.withValues(alpha: 0.6),
                ),
              ),

              Text(
                'Frequency',
                style: styleW500S14.copyWith(
                  color: ColorRes.black.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),

          ///Space
          30.ph.spaceVertical,

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
                    8.ph.spaceVertical,
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
                    8.ph.spaceVertical,
                    Text('0kWh', style: styleW700S14),
                  ],
                ),
              ),
            ],
          ),

          ///Space
          20.ph.spaceVertical,

          /// Data Row
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status:',
                      style: styleW400S14.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.6),
                      ),
                    ),

                    /// Space
                    8.ph.spaceVertical,
                    Text('Text', style: styleW700S14),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'M_Ubus:',
                      style: styleW400S14.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.6),
                      ),
                    ),

                    /// Space
                    8.ph.spaceVertical,
                    Text('0V', style: styleW700S14),
                  ],
                ),
              ),
            ],
          ),

          ///Space
          20.ph.spaceVertical,

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'S_Ubus:',
                style: styleW400S14.copyWith(
                  color: ColorRes.black.withValues(alpha: 0.6),
                ),
              ),

              /// Space
              8.ph.spaceVertical,
              Text('Text', style: styleW700S14),
            ],
          ),
        ],
      ),
    );
  }
}
