import 'package:qbits/qbits.dart';

AppResponse<T> appResponseFromJson<T>(
  String str, {
  T Function(Map<String, dynamic>)? converter,
}) => AppResponse.fromJson(json.decode(str), converter: converter);

String appResponseToJson<T>(
  AppResponse<T> data, {
  Map<String, dynamic> Function(T)? converter,
}) => json.encode(data.toJson(converter: converter));

class AppResponse<T> {
  int? code;
  int? count;
  String? msg;
  T? data;

  AppResponse({this.count, this.code, this.data, this.msg});

  AppResponse copyWith({int? count, int? code, T? data, String? msg}) =>
      AppResponse(
        count: count ?? this.count,
        code: code ?? this.code,
        data: data ?? this.data,
        msg: msg ?? this.msg,
      );

  factory AppResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(Map<String, dynamic>)? converter,
  }) => AppResponse(
    count: json["count"],
    code: json["code"],
    data:
        json["data"] is T
            ? json["data"]
            : converter != null
            ? converter(json['data'])
            : null,
    msg: json["msg"],
  );

  Map<String, dynamic> toJson({Map<String, dynamic> Function(T)? converter}) =>
      {
        "int": int,
        "code": code,
        "data":
            data is Map
                ? data
                : converter != null && data != null
                ? converter(data as T)
                : null,
        "msg": msg,
      };
}
