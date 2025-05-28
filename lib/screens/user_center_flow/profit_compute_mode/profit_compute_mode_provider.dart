import 'package:qbits/qbits.dart';

class ProfitComputeModeProvider extends ChangeNotifier {
  bool loader = false;
  TextEditingController energySubsidizedPriceController = TextEditingController();
  TextEditingController loremIpsumController1 = TextEditingController();
  TextEditingController loremIpsumController2 = TextEditingController();
  TextEditingController loremIpsumController3 = TextEditingController();
  TextEditingController loremIpsumController4 = TextEditingController();

  String energySubsidizedPriceError = "";
  String loremIpsumError1 = "";
  String loremIpsumError2 = "";
  String loremIpsumError3 = "";
  String loremIpsumError4 = "";
}
