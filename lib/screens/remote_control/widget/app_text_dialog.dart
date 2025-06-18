import 'package:qbits/qbits.dart';

Future<String?> openTextFieldDialog(
  BuildContext context, {
  String? header,
  String? initialValue,
  VoidCallback? onCancelTap,
  String? cancelBtnTitle,
  String? yesBtnTitle,
}) async {
  final controller = TextEditingController(text: initialValue);

  final result = await showDialog<String>(
    context: context,
    builder: (context) {
      return AppAlertDialog(
        header: header,
        textEditingController: controller,
        onCancelTap: onCancelTap,
        cancelBtnTitle: cancelBtnTitle ?? context.l10n?.cancel ?? 'Cancel',
        yesBtnTitle: yesBtnTitle ?? context.l10n?.ok ?? 'OK',
      );
    },
  );

  return result; // result will be the text user entered
}

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    super.key,
    this.header,
    required this.textEditingController,
    this.onCancelTap,
    required this.cancelBtnTitle,
    required this.yesBtnTitle,
  });

  final String? header;
  final TextEditingController textEditingController;
  final VoidCallback? onCancelTap;
  final String cancelBtnTitle;
  final String yesBtnTitle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (header != null) ...[
                Text(
                  header!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
              ],
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter text',
                ),
                autofocus: true,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        onCancelTap?.call();
                        Navigator.pop(context);
                      },
                      child: Text(cancelBtnTitle),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final text = textEditingController.text.trim();
                        Navigator.pop(context, text); // Return the entered text
                      },
                      child: Text(yesBtnTitle),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
