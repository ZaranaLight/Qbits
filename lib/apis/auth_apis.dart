import 'package:qbits/qbits.dart';

class AuthApis {
  static Future<LoginRes?> getLoginCredential({
    String email = "",
    String password = "",
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
        return null;
      }
      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (responseBody['data'] != null && responseBody != null) {
          await PrefService.set(
            PrefKeys.emailId,
            jsonEncode(responseBody['data']['token']['token']),
          );
          await PrefService.set(
            PrefKeys.sessionToken,
            jsonEncode(responseBody['data']['token']['token']),
          );
          await PrefService.set(
            PrefKeys.appSecret,
            jsonEncode(responseBody['data']['token']['appSecret']),
          );
          await PrefService.set(
            PrefKeys.userData,
            jsonEncode(responseBody['data']),
          );
          showSuccessToast('Login successful');
          return LoginRes.fromJson(responseBody['data']);
        }
      }
    } catch (exception, stack) {
      showCatchToast(exception, stack);
    }
    return null;
  }

  ///Forgot Password API to send OTP to user's email.
  static Future<bool> getForgetPasswordForSendMailCodeAPI({
    required String email,
  }) async {
    try {
      final response = await ApiService.getApi(
        url: EndPoints.sendMailCodeAPIForForgotPassword,
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
      final model = appResponseFromJson(response.body);
      if (model != null && model.code == 0) {
        showSuccessToast('Otp sent successfully');
        return true;
      }
    } catch (exception, stack) {
      showCatchToast(exception, stack);
    }
    return false;
  }

  ///Verify OTP Code API to validate the OTP sent to user's email.
  static Future<bool> verifyOTPCodeAPI({
    required String email,
    required String code,
  }) async {
    try {
      final response = await ApiService.postApi(
        url: EndPoints.queryUserByEmailAPI,
        body: {'email': email, 'code': code},
        isFormData: true,
      );

      if (response == null) {
        showCatchToast('Login failed: No response from server', null);
        return false;
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        showSuccessToast('Otp verified successfully');
        return true;
      }
    } catch (exception, stack) {
      showCatchToast(exception, stack);
    }
    return false;
  }

  ///Comany Register API to register a new company account.
  static Future<bool> companyRegisterAPI({
    required String accountName,
    required String password,
    required String email,
    required String mailOtp,
  }) async {
    try {
      final response = await ApiService.getApi(
        url: EndPoints.registerAPI,
        queryParams: {
          "atun": accountName,
          "atpd": password,
          "code": "AZKE342T",
          "email": email,
          "phone": "",
          "checkcode": mailOtp,
        },
      );
      if (response == null) {
        showCatchToast('Login failed: No response from server', null);
        return false;
      }
      final model = appResponseFromJson(response.body);
      if (model != null && model.code == 0) {
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

  ///Comany Register API to register a new company account.
  static Future<bool> individualRegisterAPI({
    required String accountName,
    required String password,
    required String phone,
    required String collector,
    required String plantName,
    required String invertertype,
    required String cityname,
    required String longitude,
    required String latitude,
    required int plantType,
  }) async {
    try {
      final response = await ApiService.postApi(
        url: EndPoints.individualRegisterAPI,
        body: {
          "userName": accountName,
          "password": password,
          "phone": phone,
          "QQ": "",
          "email": "",
          "collector": collector,
          "plantName": plantName,
          "invertertype": invertertype,
          "cityname": cityname,
          "longitude": longitude,
          "latitude": latitude,
          "parent": "",
          // "gmt": "8",
          // "plantType": plantType,
          "iSerial": "",
        },
      );
      print("body-- ${response?.body}");
      if (response == null) {
        showCatchToast('Login failed: No response from server', null);
        return false;
      }

      final model = appResponseFromJson>(
        response.body,
        converter: PlanListResponseModel.fromJson,
      );
      if (jsonDecode(response.body)['message'] == "success") {
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

  ///Send Mail Code with Check API to send an OTP for email verification.
  static Future<bool> sendMailCodeWithCheckAPI({required String email}) async {
    try {
      final response = await ApiService.getApi(
        url: EndPoints.sendMailCodeWithCheckAPI,
        queryParams: {
          "email": email,
          "atun": "4gceshi",
          "atpd": "123456",
          "language": "en-us",
        },
      );

      if (response == null) {
        showCatchToast('Login failed: No response from server', null);
        return false;
      }
      final model = appResponseFromJson(response.body);
      if (model != null && model.code == 0) {
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

  ///App Search Organization API to search for an organization.
  static Future<bool> appSearchOrganizationAPI({
    required String organization,
  }) async {
    try {
      final response = await ApiService.getApi(
        url: EndPoints.appSearchOrganizationAPI,
        queryParams: {"organization": organization},
      );

      if (response == null) {
        showCatchToast('Login failed: No response from server', null);
        return false;
      }
      final model = appResponseFromJson(response.body);
      if (model != null && model.code == 0) {
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
