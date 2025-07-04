import 'package:qbits/qbits.dart';

class AuthApis {
  static Future<bool> getLoginCredential({
    required String email,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> body = {"atun": email, "atpd": password};
      final response = await ApiService.postApi(
        url: EndPoints.loginAPI,
        body: body,
        addMD5: true,
      );
      if (response == null) {
        showCatchToast('Login failed: No response from server', null);
        return false;
      }
      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (responseBody['data'] != null && responseBody != null) {
          await PrefService.set(
            PrefKeys.sessionToken,
            jsonEncode(responseBody['data']['token']['token']),
          );
          await PrefService.set(
            PrefKeys.appSecret,
            jsonEncode(responseBody['data']['token']['appSecret']),
          );
          LoginRes.fromJson(responseBody['data']);
          showSuccessToast('Login successful');
          return true;
        } else {
          showCatchToast(jsonDecode(response.body)['msg'], null);
          return false;
        }
      }
    } catch (exception, stack) {
      showCatchToast(exception, stack);
    }
    return false;
  }

  static Future<bool> getMailCodeForForgetPasswordAPI({
    required String email,
  }) async {
    try {
      final response = await ApiService.getApi(
        url: EndPoints.forgotAPI,
        queryParams: {
          "email": email,
          "language": "en-us",
          "atun": "4gceshi",
          "atpd": "123456",
        },
      );
      if (response == null) {
        showCatchToast('Login failed: No response from server', null);
        return false;
      }
      if (response.code == 0) {
        showSuccessToast('Otp sent successfully');
        return true;
      } else {
        return false;
      }
    } catch (exception, stack) {
      showCatchToast(exception, stack);
    }
    return false;
  }
}
