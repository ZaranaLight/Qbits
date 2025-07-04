import 'package:qbits/qbits.dart';


LoginRes loginResFromJson(String str) =>
    LoginRes.fromJson(json.decode(str));

String loginResToJson(LoginRes data) =>
    json.encode(data.toJson());

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

  LoginRes(
      {this.id,
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
        this.token});

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
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['rights'] = this.rights;
    data['remark1'] = this.remark1;
    data['remark2'] = this.remark2;
    data['phone'] = this.phone;
    data['qq'] = this.qq;
    data['email'] = this.email;
    data['collectorNo'] = this.collectorNo;
    data['remark3'] = this.remark3;
    data['remark4'] = this.remark4;
    data['remark5'] = this.remark5;
    data['remark6'] = this.remark6;
    data['recordTime'] = this.recordTime;
    if (this.token != null) {
      data['token'] = this.token!.toJson();
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

  Token(
      {this.uid, this.appSecret, this.token, this.iplist, this.rate, this.ip});

  Token.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    appSecret = json['appSecret'];
    token = json['token'];
    iplist = json['iplist'];
    rate = json['rate'];
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['appSecret'] = this.appSecret;
    data['token'] = this.token;
    data['iplist'] = this.iplist;
    data['rate'] = this.rate;
    data['ip'] = this.ip;
    return data;
  }
}

