import 'package:qbits/qbits.dart';

AppResponse appResponseFromJson(String str) =>
    AppResponse.fromJson(json.decode(str));

String appResponseToJson(AppResponse data) => json.encode(data.toJson());

class AppResponse {
  final String? jsonrpc;
  final int? id;
  final dynamic result;
  final ErrorModel? error;

  AppResponse({this.jsonrpc, this.id, this.result, this.error});

  AppResponse copyWith({
    String? jsonrpc,
    int? id,
    dynamic result,
    ErrorModel? error,
  }) => AppResponse(
    jsonrpc: jsonrpc ?? this.jsonrpc,
    id: id ?? this.id,
    result: result ?? this.result,
    error: error ?? this.error,
  );

  factory AppResponse.fromJson(Map<dynamic, dynamic> json) {
    return AppResponse(
      jsonrpc: json["jsonrpc"],
      id: json["id"],
      result: normalizeFalseToNull(json["result"]),
      error: json["error"] == null ? null : ErrorModel.fromJson(json["error"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "jsonrpc": jsonrpc,
    "id": id,
    "result": result,
    "error": error?.toJson(),
  };
}

class ErrorModel {
  final int? code;
  final String? message;
  final ErrorData? data;

  ErrorModel({this.code, this.message, this.data});

  ErrorModel copyWith({int? code, String? message, ErrorData? data}) =>
      ErrorModel(
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ErrorModel.fromJson(Map<dynamic, dynamic> json) => ErrorModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : ErrorData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class ErrorData {
  final String? name;
  final String? debug;
  final String? message;
  final List<String>? arguments;
  final ErrorContext? context;

  ErrorData({
    this.name,
    this.debug,
    this.message,
    this.arguments,
    this.context,
  });

  ErrorData copyWith({
    String? name,
    String? debug,
    String? message,
    List<String>? arguments,
    ErrorContext? context,
  }) => ErrorData(
    name: name ?? this.name,
    debug: debug ?? this.debug,
    message: message ?? this.message,
    arguments: arguments ?? this.arguments,
    context: context ?? this.context,
  );

  factory ErrorData.fromJson(Map<dynamic, dynamic> json) => ErrorData(
    name: json["name"],
    debug: json["debug"],
    message: json["message"],
    arguments:
        json["arguments"] == null
            ? []
            : List<String>.from(json["arguments"]!.map((x) => x)),
    context:
        json["context"] == null ? null : ErrorContext.fromJson(json["context"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "debug": debug,
    "message": message,
    "arguments":
        arguments == null ? [] : List<dynamic>.from(arguments!.map((x) => x)),
    "context": context?.toJson(),
  };
}

class ErrorContext {
  ErrorContext();

  ErrorContext copyWith() => ErrorContext();

  factory ErrorContext.fromJson(Map<dynamic, dynamic> json) => ErrorContext();

  Map<String, dynamic> toJson() => {};
}
