import 'package:qbits/qbits.dart';

LoginRes loginResFromJson(String str) => LoginRes.fromJson(json.decode(str));

String loginResToJson(LoginRes data) => json.encode(data.toJson());

class LoginRes {
  int? id;
  String? userName;
  String? password;
  String? rights;
  String? remark1;
  String? remark2;
  String? phone;
  String? qq;
  String? email;
  String? collectorNo;
  String? remark3;
  String? remark4;
  String? remark5;
  String? remark6;
  String? recordTime;
  Token? token;

  LoginRes({
    this.id,
    this.userName,
    this.password,
    this.rights,
    this.remark1,
    this.remark2,
    this.phone,
    this.qq,
    this.email,
    this.collectorNo,
    this.remark3,
    this.remark4,
    this.remark5,
    this.remark6,
    this.recordTime,
    this.token,
  });

  LoginRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    password = json['password'];
    rights = json['rights'];
    remark1 = json['remark1'];
    remark2 = json['remark2'];
    phone = json['phone'];
    qq = json['qq'];
    email = json['email'];
    collectorNo = json['collectorNo'];
    remark3 = json['remark3'];
    remark4 = json['remark4'];
    remark5 = json['remark5'];
    remark6 = json['remark6'];
    recordTime = json['recordTime'];
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['password'] = password;
    data['rights'] = rights;
    data['remark1'] = remark1;
    data['remark2'] = remark2;
    data['phone'] = phone;
    data['qq'] = qq;
    data['email'] = email;
    data['collectorNo'] = collectorNo;
    data['remark3'] = remark3;
    data['remark4'] = remark4;
    data['remark5'] = remark5;
    data['remark6'] = remark6;
    data['recordTime'] = recordTime;
    if (token != null) {
      data['token'] = token!.toJson();
    }
    return data;
  }
}

class Token {
  int? uid;
  String? appSecret;
  String? token;
  String? iplist;
  int? rate;
  String? ip;

  Token({
    this.uid,
    this.appSecret,
    this.token,
    this.iplist,
    this.rate,
    this.ip,
  });

  Token.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    appSecret = json['appSecret'];
    token = json['token'];
    iplist = json['iplist'];
    rate = json['rate'];
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['appSecret'] = appSecret;
    data['token'] = token;
    data['iplist'] = iplist;
    data['rate'] = rate;
    data['ip'] = ip;
    return data;
  }
}
