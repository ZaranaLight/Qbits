import 'package:qbits/qbits.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  static const routeName = "preview_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SignInProvider>(
      create: (c) => SignInProvider(),
      child: PreviewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BluetoothProvider>(context);
    final image = provider.selectedImage;

    return Scaffold(
      appBar: AppBar(title: const Text('Preview Image')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [if (image != null) Image.file(image, height: 300)],
        ),
      ),
    );
  }
}
