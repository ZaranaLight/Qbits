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
              EditableInfoField(
                title: 'My Profit',
                value: provider.plantInfoPart2Class.myProfit,
                isEditing: provider.isEditing,
                onTap: () => provider.onMyProfitTap(context),
              ),

              ///My Profit
              EditableInfoField(
                title: 'Total Energy:',
                value: provider.plantInfoPart2Class.totalEnergy,
                isEditing: provider.isEditing,
                onTap: () => provider.onTotalEnergyTap(context),
              ),

              ///Average Electric Price
              EditableInfoField(
                title: 'Average Electric Price:',
                value: provider.plantInfoPart2Class.averageElectricityPrice,
                isEditing: provider.isEditing,
                onTap: () => provider.onAverageElectricPriceTap(context),
              ),

              ///Average Electric Price
              EditableInfoField(
                title: 'Energy Subsidized Price:',
                value: provider.plantInfoPart2Class.energySubsidizedPrice,
                isEditing: provider.isEditing,
                onTap: () => provider.onEnergySubsidizedPriceTap(context),
              ),

              ///Average Electric Price
              EditableInfoField(
                title: 'On- grid Electric Price:',
                value: provider.plantInfoPart2Class.onGridElectricPrice,
                isEditing: provider.isEditing,
                onTap: () => provider.onOnGridElectricPriceTap(context),
              ),

              ///Average Electric Price
              EditableInfoField(
                title: 'Self-use Electric Price:',
                value: provider.plantInfoPart2Class.selfUseElectricPrice,
                isEditing: provider.isEditing,
                onTap: () => provider.onSelfUseElectricPriceTap(context),
              ),

              ///Average Electric Price
              EditableInfoField(
                title: 'On-grid Electric Occupy:(%)',
                value: provider.plantInfoPart2Class.onGridElectricOccupy,
                isEditing: provider.isEditing,
                onTap: () => provider.onGridElectricOccupyTap(context),
              ),

              ///Self-use Electric Occupy:(%)
              EditableInfoField(
                title: 'Self-use Electric Occupy:(%)',
                value: provider.plantInfoPart2Class.selfUseElectricOccupy,
                isEditing: provider.isEditing,
                onTap: () => provider.onSelfUseElectricOccupyTap(context),
                isLastItem: true,
              ),

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
