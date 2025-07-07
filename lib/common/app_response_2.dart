
import 'package:qbits/qbits.dart';

AppResponse2<T, L> appResponse2FromJson<T, L>(
    String str, {
      T Function(Map<String, dynamic>)? dataConverter,
      L Function(Map<String, dynamic>)? listConverter,
    }) =>
    AppResponse2<T, L>.fromJson(
      json.decode(str),
      dataConverter: dataConverter,
      listConverter: listConverter,
    );

String appResponse2ToJson<T, L>(
    AppResponse2<T, L> data, {
      Map<String, dynamic> Function(T)? dataConverter,
      Map<String, dynamic> Function(L)? listConverter,
    }) =>
    json.encode(
      data.toJson(
        dataConverter: dataConverter,
        listConverter: listConverter,
      ),
    );
class AppResponse2<T, L> {
  int? code;
  int? count;
  String? msg;
  T? data;
  List<L>? list;

  AppResponse2({
    this.count,
    this.code,
    this.data,
    this.msg,
    this.list,
  });

  AppResponse2<T, L> copyWith({
    int? count,
    int? code,
    T? data,
    String? msg,
    List<L>? list,
  }) =>
      AppResponse2(
        count: count ?? this.count,
        code: code ?? this.code,
        data: data ?? this.data,
        msg: msg ?? this.msg,
        list: list ?? this.list,
      );

  factory AppResponse2.fromJson(
      Map<String, dynamic> json, {
        T Function(Map<String, dynamic>)? dataConverter,
        L Function(Map<String, dynamic>)? listConverter,
      }) =>
      AppResponse2(
        count: json["count"],
        code: json["code"],
        msg: json["msg"],
        data: json["data"] is T
            ? json["data"]
            : dataConverter != null && json["data"] != null
            ? dataConverter(json["data"])
            : null,
        list: json["list"] is List && listConverter != null
            ? List<L>.from(
          json["list"].map((x) => listConverter(x)),
        )
            : null,
      );

  Map<String, dynamic> toJson({
    Map<String, dynamic> Function(T)? dataConverter,
    Map<String, dynamic> Function(L)? listConverter,
  }) =>
      {
        "code": code,
        "count": count,
        "msg": msg,
        "data": data is Map
            ? data
            : dataConverter != null && data != null
            ? dataConverter(data as T)
            : null,
        "list": list != null && listConverter != null
            ? list!.map((x) => listConverter(x)).toList()
            : null,
      };
}
