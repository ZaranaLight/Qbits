import 'package:http/http.dart' as http;
import 'package:qbits/qbits.dart';

class ApiService {
  static String? sessionTokenForFirstCall;

  static Future<AppResponse?> getApi({
    required String url,
    Map<String, String>? header,
    bool isRecall = false,
  }) async {
    try {
      header = header ?? appHeader();
      debugPrint("Url = $url");
      debugPrint("Header = $header");
      final response = await http.get(Uri.parse(url), headers: header);
      if (isTokenExpire(response)) {
        await handleTokenExpire();
        if (!isRecall) {
          return await getApi(url: url, header: header, isRecall: true);
        }
      } else {
        if (handleError(response)) {
          return appResponseFromJson(response.body);
        }
      }
    } catch (e, stack) {
      recordError(e, stack);
    }
    return null;
  }

  static Future<AppResponse?> postApi({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    Map<String, dynamic> extraBody = const {},
    bool storeCookieInLocal = false,
    bool isRecall = false,
  }) async {
    try {
      header = header ?? appHeader();
      header.addAll({"Content-Type": "application/json"});

      if (isRecall && sessionTokenForFirstCall != null) {
        header["Cookie"] = sessionTokenForFirstCall ?? "";
      }

      final Map<String, dynamic> updateBody = {
        "jsonrpc": "2.0",
        "method": "call",
        "params": body,
      }..addAll(extraBody);

      debugPrint("Url = $url");
      debugPrint("Header = $header");
      debugPrint("Body = $updateBody");

      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(updateBody),
      );
      if (isTokenExpire(response)) {
        if (!isRecall) {
          await handleTokenExpire();
          return await postApi(
            url: url,
            header: header,
            body: body,
            extraBody: extraBody,
            storeCookieInLocal: storeCookieInLocal,
            isRecall: true,
          );
        }
      } else {
        if (handleError(response)) {
          if (storeCookieInLocal) {
            final headers = response.headers;
            final setCookie = headers['set-cookie'];

            if (setCookie != null) {
              final cookies = setCookie.split(';');
              final sessionCookie = cookies[0];
              sessionTokenForFirstCall = sessionCookie;
              await PrefService.set(PrefKeys.sessionToken, sessionCookie);
            }
          }
          return appResponseFromJson(response.body);
        }
      }
    } catch (e, stack) {
      recordError(e, stack);
    }
    return null;
  }

  static Future<AppResponse?> putApi({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    Map<String, dynamic> extraBody = const {},
    bool isRecall = false,
  }) async {
    try {
      header = header ?? appHeader();
      header.addAll({"Content-Type": "application/json"});

      final Map<String, dynamic> updateBody = {
        "jsonrpc": "2.0",
        "method": "call",
        "params": body,
      }..addAll(extraBody);

      debugPrint("Url = $url");
      debugPrint("Header = $header");
      debugPrint("Body = $updateBody");

      final response = await http.put(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(updateBody),
      );
      if (isTokenExpire(response)) {
        await handleTokenExpire();
        if (!isRecall) {
          return await putApi(
            url: url,
            header: header,
            body: body,
            extraBody: extraBody,
            isRecall: true,
          );
        }
      } else {
        if (handleError(response)) {
          return appResponseFromJson(response.body);
        }
      }
    } catch (e, stack) {
      recordError(e, stack);
    }
    return null;
  }

  static Future<AppResponse?> deleteApi({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    Map<String, dynamic> extraBody = const {},
    bool isRecall = false,
  }) async {
    try {
      header = header ?? appHeader();
      header.addAll({"Content-Type": "application/json"});

      final Map<String, dynamic> updateBody = {
        "jsonrpc": "2.0",
        "method": "call",
        "params": body,
      }..addAll(extraBody);

      debugPrint("Url = $url");
      debugPrint("Header = $header");
      debugPrint("Body = $updateBody");

      final response = await http.delete(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(updateBody),
      );
      if (isTokenExpire(response)) {
        await handleTokenExpire();
        if (!isRecall) {
          return await deleteApi(
            url: url,
            header: header,
            body: body,
            extraBody: extraBody,
            isRecall: true,
          );
        }
      } else {
        if (handleError(response)) {
          return appResponseFromJson(response.body);
        }
      }
    } catch (e, stack) {
      recordError(e, stack);
    }
    return null;
  }

  static Future<AppResponse?> uploadFileWithDataApi({
    required String url,
    String type = "POST",
    Map<String, String>? header,
    Map<String, String>? body,
    List<FileDataModel> fileData = const [],
    bool isRecall = false,
  }) async {
    header ??= {};
    body ??= {};
    header.addAll(appHeader());
    debugPrint("Url = $url");
    debugPrint("Header = $header");
    debugPrint("Body = $body");
    debugPrint("fileData = $fileData");
    try {
      var request = http.MultipartRequest(type, Uri.parse(url));
      request.fields.addAll(body);
      request.headers.addAll(header);
      for (FileDataModel element in fileData) {
        if (element.filePath == null || element.keyName == null) {
          continue;
        }
        request.files.add(
          http.MultipartFile(
            element.keyName ?? '',
            File(element.filePath!).readAsBytes().asStream(),
            File(element.filePath!).lengthSync(),
            // filename: File(element.filePath!).getFileName,
          ),
        );
      }

      final http.StreamedResponse streamedResponse = await request.send();
      final response = await http.Response.fromStream(
        streamedResponse,
      ).timeout(const Duration(seconds: 120));
      if (isTokenExpire(response)) {
        await handleTokenExpire();
        if (!isRecall) {
          return await uploadFileWithDataApi(
            url: url,
            type: type,
            header: header,
            body: body,
            fileData: fileData,
            isRecall: true,
          );
        }
      } else {
        if (handleError(response)) {
          return appResponseFromJson(response.body);
        }
      }
    } catch (e, stack) {
      recordError(e, stack);
    }
    return null;
  }

  static Map<String, String> appHeader() {
    if (PrefService.getString(PrefKeys.sessionToken).isEmpty) {
      return {};
    } else {
      return {"Cookie": PrefService.getString(PrefKeys.sessionToken)};
    }
  }

  static bool handleError(http.Response response) {
    if (response.statusCode == 200) {
      final model = appResponseFromJson(response.body);
      if (model.error != null) {
        showErrorMsg(model.error?.data?.message ?? "Something went wrong!");
      } else if (model.result != null) {
        return true;
      }
    } else {
      showErrorMsg("Something went wrong!");
    }
    return false;
  }

  static bool isTokenExpire(http.Response response) {
    if (response.statusCode == 200) {
      final model = appResponseFromJson(response.body);
      if (model.error != null) {
        return model.error?.data?.name == "odoo.http.SessionExpiredException";
      }
    }
    return false;
  }

  static Future<void> handleTokenExpire() async {
    // await AuthApis.getAdminCredential();
  }
}
