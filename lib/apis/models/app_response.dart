import 'package:qbits/qbits.dart';

AppResponse<T>? appResponseFromJson<T>(
  String str, {
  T Function(Map<String, dynamic>)? converter,
}) {
  try {
    return AppResponse.fromJson(json.decode(str), converter: converter);
  } catch (e) {
    return null;
  }
}

String appResponseToJson<T>(
  AppResponse<T> data, {
  Map<String, dynamic> Function(T)? converter,
}) => json.encode(data.toJson(converter: converter));

class AppResponse<T> {
  int? code;
  int? count;
  String? msg;
  T? data;
  List<T>? list;

  AppResponse({this.count, this.code, this.data, this.msg, this.list});

  AppResponse<T> copyWith({
    int? count,
    int? code,
    T? data,
    String? msg,
    List<T>? list,
  }) => AppResponse(
    count: count ?? this.count,
    code: code ?? this.code,
    data: data ?? this.data,
    msg: msg ?? this.msg,
    list: list ?? this.list,
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
            : converter != null && json["list"] == null
            ? converter(json['data'])
            : null,
    msg: json["msg"],
    list:
        json["list"] is List<T>
            ? json["list"]
            : converter != null && json['list'] != null && json['data'] == null
            ? List<T>.from(json['list'].map((item) => converter(item)))
            : null,
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
        "list":
            list is List
                ? list
                : list
                    ?.map((item) => converter != null ? converter(item) : item)
                    .toList(),
      };
}
