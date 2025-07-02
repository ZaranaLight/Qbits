import 'package:qbits/qbits.dart';



class PlantInfoPart2 extends StatelessWidget {
  const PlantInfoPart2({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantInfoProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(color: ColorRes.white),
          padding: EdgeInsets.only(
            left: Constants.horizontalPadding,
            right: Constants.horizontalPadding,
          ),
          child: Column(
            children: [
              ///My Profit
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'My Profit',
                    value: provider.plantInfoPart2Class.myProfit,
                    onTap: () {
                      provider.onMyProfitTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Profit',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart2Class.myProfit.toString(),
                          style: styleW600S14.copyWith(
                            color: ColorRes.black,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

              ///Divider
              Divider(height: 0, color: ColorRes.black.withValues(alpha: 0.1)),

              ///My Profit
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Total Energy:',
                    value: provider.plantInfoPart2Class.totalEnergy,
                    onTap: () {
                      provider.onTotalEnergyTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Energy:',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart2Class.totalEnergy.toString(),
                          style: styleW600S14.copyWith(
                            color: ColorRes.black,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

              ///Divider
              Divider(height: 0, color: ColorRes.black.withValues(alpha: 0.1)),

              ///My Profit
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Average Electric Price:',
                    value: provider.plantInfoPart2Class.averageElectricityPrice,
                    onTap: () {
                      provider.onAverageElectricPriceTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Average Electric Price:',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart2Class.averageElectricityPrice
                              .toString(),
                          style: styleW600S14.copyWith(
                            color: ColorRes.black,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

              ///Divider
              Divider(height: 0, color: ColorRes.black.withValues(alpha: 0.1)),

              ///My Profit
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Energy Subsidized Price:',
                    value: provider.plantInfoPart2Class.energySubsidizedPrice,
                    onTap: () {
                      provider.onEnergySubsidizedPriceTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Energy Subsidized Price:',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart2Class.energySubsidizedPrice
                              .toString(),
                          style: styleW600S14.copyWith(
                            color: ColorRes.black,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

              ///Divider
              Divider(height: 0, color: ColorRes.black.withValues(alpha: 0.1)),

              ///My Profit
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'On- grid Electric Price:',
                    value: provider.plantInfoPart2Class.onGridElectricPrice,
                    onTap: () {
                      provider.onOnGridElectricPriceTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'On- grid Electric Price:',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart2Class.onGridElectricPrice
                              .toString(),
                          style: styleW600S14.copyWith(
                            color: ColorRes.black,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

              ///Divider
              Divider(height: 0, color: ColorRes.black.withValues(alpha: 0.1)),

              ///My Profit
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Self-use Electric Price:',
                    value: provider.plantInfoPart2Class.selfUseElectricPrice,
                    onTap: () {
                      provider.onSelfUseElectricPriceTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Self-use Electric Price:',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart2Class.selfUseElectricPrice
                              .toString(),
                          style: styleW600S14.copyWith(
                            color: ColorRes.black,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

              ///Divider
              Divider(height: 0, color: ColorRes.black.withValues(alpha: 0.1)),

              ///My Profit
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'On-grid Electric Occupy:(%)',
                    value: provider.plantInfoPart2Class.onGridElectricOccupy,
                    onTap: () {
                      provider.onGridElectricOccupyTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'On-grid Electric Occupy:(%)',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart2Class.onGridElectricOccupy
                              .toString(),
                          style: styleW600S14.copyWith(
                            color: ColorRes.black,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

              ///Divider
              Divider(height: 0, color: ColorRes.black.withValues(alpha: 0.1)),

              ///My Profit
              provider.isEditing
                  ? TextFieldDialog2(
                    title: 'Self-use Electric Occupy:(%)',
                    value: provider.plantInfoPart2Class.selfUseElectricOccupy,
                    onTap: () {
                      provider.onSelfUseElectricOccupyTap(context);
                    },
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.ph),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Self-use Electric Occupy:(%)',
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(
                            height: 2,
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          provider.plantInfoPart2Class.selfUseElectricOccupy
                              .toString(),
                          style: styleW600S14.copyWith(
                            color: ColorRes.black,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

              ///Divider
              provider.isEditing
                  ? Divider(
                    height: 0,
                    color: ColorRes.black.withValues(alpha: 0.1),
                  )
                  : SizedBox.shrink(),

              provider.isEditing
                  ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.ph),
                    child: SubmitButton(
                      onTap: () {},
                      title: context.l10n?.submit ?? "",
                    ),
                  )
                  : SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
