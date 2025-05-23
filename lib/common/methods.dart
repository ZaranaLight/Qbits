import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qbits/common/widget/app_bottom_sheet.dart';
import 'package:qbits/qbits.dart';

dynamic normalizeFalseToNull(dynamic input) {
  if (input is Map) {
    return input.map(
      (key, value) => MapEntry(key, normalizeFalseToNull(value)),
    );
  } else if (input is List) {
    return input.map(normalizeFalseToNull).toList();
  } else if (input == false) {
    return null;
  } else {
    return input;
  }
}

void recordError(dynamic exception, StackTrace? stack) {
  debugPrint(exception.toString());
}

void hideKeyboard({BuildContext? context}) {
  context ??= navigatorKey.currentContext;
  if (context == null) {
    return;
  }
  if (FocusScope.of(context).hasFocus) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

Future<bool> checkCameraPermission(BuildContext context) async {
  final permission = await Permission.camera.request();

  if (!context.mounted) return false;

  if (permission.isGranted || permission.isLimited) {
    return true;
  } else if (permission.isDenied ||
      permission.isPermanentlyDenied ||
      permission.isRestricted) {
    openAppBottomShit(
      context: context,
      title: context.l10n?.cameraPermission,
      content: context.l10n?.cameraPermissionContent,
      btnText: context.l10n?.openSettings,
      image: AssetRes.cameraIcon,
      onBtnTap: () {
        openAppSettings();
        context.navigator.pop();
      },
    );
    return false;
  }
  return false;
}

Future<File?> compressImage(File? file, {double? requestedSize}) async {
  if (file == null) {
    return null;
  }
  Directory directory = await getTemporaryDirectory();
  double requiredSize = requestedSize ?? (1024 * 1024 * 2);
  int fileSize = file.lengthSync();
  int quality = ((100 * requiredSize) / fileSize).round();
  var byte = await FlutterImageCompress.compressWithList(
    file.absolute.readAsBytesSync(),
    quality: quality > 100 ? 95 : quality,
    rotate: 0,
  );

  debugPrint(file.lengthSync().toString());

  File result = File(
    "${directory.path}/${DateTime.now().microsecondsSinceEpoch}.jpg",
  );

  if (result.existsSync()) {
    await result.delete();
  }
  result.writeAsBytesSync(byte);
  debugPrint(result.lengthSync().toString());

  final size = result.lengthSync();
  debugPrint(size.toString());

  return result;
}
