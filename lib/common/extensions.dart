import 'package:intl/intl.dart';
import 'package:qbits/qbits.dart';

extension ValidationExt on String {
  bool isEmailValid() {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(this);
  }

  bool isPhoneValid() {
    return RegExp(r"(^(?:[+0]9)?[0-9]{10,12}$)").hasMatch(this);
  }
}

extension StringFormatingExt on String {
  Color? get toColor {
    try {
      String colorString = this;
      // Remove the '#' if it exists
      colorString = colorString.replaceFirst('#', '');

      // If it's a 6-character color, add full opacity (FF)
      if (colorString.length == 6) {
        colorString = 'FF$colorString';
      }

      // Convert hex to integer and create a Color object
      return Color(int.parse(colorString, radix: 16));
    } catch (e) {
      return null;
    }
  }

  double? get tryDouble {
    try {
      final value = double.tryParse(this);
      if (value != null && !value.isNaN) {
        return value;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  DateTime? get tryDateTimeFromUtc {
    try {
      return DateFormat("yyyy-MM-dd hh:mm:ss").tryParse(this, true);
    } catch (e) {
      return null;
    }
  }

  DateTime? get tryDate {
    try {
      return DateFormat("yyyy-MM-dd").tryParse(this);
    } catch (e) {
      return null;
    }
  }

  DateTime? get tryDateDdMmmmYyyy {
    try {
      return DateFormat("dd MMMM yyyy").tryParse(this);
    } catch (e) {
      return null;
    }
  }

  String? get getLeaveTypeLabel {
    try {
      if (toLowerCase() == "confirm") {
        return "To Approve";
      } else if (toLowerCase() == "refuse") {
        return "Refused";
      } else if (toLowerCase() == "validate1") {
        return "Second Approval";
      } else if (toLowerCase() == "validate") {
        return "Approved";
      } else if (toLowerCase() == "cancel") {
        return "Cancelled";
      }
      return "-";
    } catch (e) {
      return null;
    }
  }
}

extension NumFormatingExt on num {
  String? get toAmount {
    try {
      final formatter = NumberFormat('#,##,###');
      return formatter.format(this);
    } catch (e) {
      return null;
    }
  }

  String? get toHoursTime {
    try {
      final totalMinutes = (this * 60).round();
      final h = (totalMinutes ~/ 60).toString().padLeft(2, '0');
      final m = (totalMinutes % 60).toString().padLeft(2, '0');
      return "$h:$m Hrs";
    } catch (e) {
      return null;
    }
  }
}

extension DateFormatingExt on DateTime {
  String? get toDdMmYyyy {
    try {
      return DateFormat("dd/MM/yyyy").format(this);
    } catch (e) {
      return null;
    }
  }

  String? get toDdMmmmYyyy {
    try {
      return DateFormat("dd MMMM yyyy").format(this);
    } catch (e) {
      return null;
    }
  }

  String? get toMmmDdYyyy {
    try {
      return DateFormat("MMM dd, yyyy").format(this);
    } catch (e) {
      return null;
    }
  }

  String? get toHhMmA {
    try {
      return DateFormat("hh:mm a").format(this);
    } catch (e) {
      return null;
    }
  }

  String? get toYyyyMmDd {
    try {
      return DateFormat("yyyy-MM-dd").format(this);
    } catch (e) {
      return null;
    }
  }

  String? get toYyyyMmDdHhMmSsUtc {
    try {
      return DateFormat("yyyy-MM-dd HH:mm:ss").format(toUtc());
    } catch (e) {
      return null;
    }
  }

  String? get toDdMmm {
    try {
      return DateFormat("dd MMM").format(this);
    } catch (e) {
      return null;
    }
  }

  double get toDecimalHours {
    return hour + (minute / 60) + (second / 3600);
  }
}

extension NavigatorExtention on BuildContext {
  AppLocalizations? get l10n => AppLocalizations.of(this);

  NavigatorState get navigator => Navigator.of(this);

  Object? get args => ModalRoute.of(this)?.settings.arguments;
}

extension NumUtils on num {
  Duration get milliseconds => Duration(microseconds: (this * 1000).round());

  Duration get seconds => Duration(milliseconds: (this * 1000).round());

  Duration get minutes =>
      Duration(seconds: (this * Duration.secondsPerMinute).round());

  Duration get hours =>
      Duration(minutes: (this * Duration.minutesPerHour).round());

  Duration get days => Duration(hours: (this * Duration.hoursPerDay).round());
}

extension SpaceExtention on num {
  /// Vertical Space
  Widget get spaceVertical => SizedBox(height: toDouble());

  /// Horizontal Space
  Widget get spaceHorizontal => SizedBox(width: toDouble());
}

extension ThemeExtention on int {
  /// Vertical Space
  Color get indexedColor {
    List<Color> colors = [ColorRes.purple, ColorRes.blue];

    return colors[this % colors.length];
  }
}

/// IterableExtension
extension IterableExtension<T> on Iterable<T> {
  /// The first element satisfying [test], or `null` if there are none.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

/// DoubleExtension
extension DoubleExtension on double {
  /// prettify
  String get prettify =>
  // toStringAsFixed guarantees the specified number of fractional
  // digits, so the regular expression is simpler than it would need to
  // be for more general cases.
  toStringAsFixed(2).replaceFirst(RegExp(r'\.?0*$'), '');
}

extension FileExtension on File {
  /// prettify
  String get getFileName => path.split('/').last;

  String get getDirectoryPath {
    final pathList = path.split("/");
    return pathList.sublist(0, pathList.length - 1).join("/");
  }
}

extension DurationExt on Duration {
  /// Converts a Duration to decimal hour format
  /// Example: Duration(hours: 8, minutes: 7) => 8.11666
  double get toDecimalHours {
    return inSeconds / 3600;
  }
}
