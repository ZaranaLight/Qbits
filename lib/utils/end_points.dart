import 'package:qbits/qbits.dart';

class EndPoints {
  /// Live URL
  static const domain = "http://www.aotaisolarcloud.com/solarweb/";

  /// Test URL
  // static const domain = "http://13.200.222.124/";
  static const baseUrl = "${domain}api/";

  /// ------------------------------------ Auth -------------------------------
  static const loginAPI = "${baseUrl}login";
  static const forgotAPI = "${domain}auth/sendMailCode";
}
