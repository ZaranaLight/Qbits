import 'package:qbits/qbits.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  static const routeName = "alarm";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AlarmProvider>(
      create: (c) => AlarmProvider(),
      child: AlarmScreen(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.l10n?.alarm??""),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
