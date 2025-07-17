// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? encrypted;
  Data? data;

  LoginModel({
    this.encrypted,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        encrypted: json["encrypted"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "encrypted": encrypted,
        "data": data?.toJson(),
      };
}

class Data {
  String? token;
  User? user;

  Data({
    this.token,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
      };
}

class User {
  Location? location;
  String? id;
  String? name;
  String? email;
  String? gender;
  String? phone;
  String? addressLane1;
  String? addressLane2;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  bool? isOnline;
  List<dynamic>? blockedUsers;
  String? role;
  bool? isVerified;
  bool? isDeleted;
  String? deletedMessage;
  bool? isDisabled;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  DateTime? lastSeen;
  String? profile;
  DateTime? deletedTime;
  String? plan;
  String? previousPlan;
  DateTime? createdForTtl;
  List<PaymentHistory>? paymentHistory;
  String? referralCode;
  DateTime? planEndDate;
  List<String>? fcmTokens;

  User({
    this.location,
    this.id,
    this.name,
    this.email,
    this.gender,
    this.phone,
    this.addressLane1,
    this.addressLane2,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.isOnline,
    this.blockedUsers,
    this.role,
    this.isVerified,
    this.isDeleted,
    this.deletedMessage,
    this.isDisabled,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.lastSeen,
    this.profile,
    this.deletedTime,
    this.plan,
    this.previousPlan,
    this.createdForTtl,
    this.paymentHistory,
    this.referralCode,
    this.planEndDate,
    this.fcmTokens,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        phone: json["phone"],
        addressLane1: json["addressLane1"],
        addressLane2: json["addressLane2"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postalCode"],
        country: json["country"],
        isOnline: json["isOnline"],
        blockedUsers: json["blockedUsers"] == null
            ? []
            : List<dynamic>.from(json["blockedUsers"]!.map((x) => x)),
        role: json["role"],
        isVerified: json["isVerified"],
        isDeleted: json["isDeleted"],
        deletedMessage: json["deletedMessage"],
        isDisabled: json["isDisabled"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        lastSeen:
            json["lastSeen"] == null ? null : DateTime.parse(json["lastSeen"]),
        profile: json["profile"],
        deletedTime: json["deletedTime"] == null
            ? null
            : DateTime.parse(json["deletedTime"]),
        plan: json["plan"],
        previousPlan: json["previousPlan"],
        createdForTtl: json["createdForTTL"] == null
            ? null
            : DateTime.parse(json["createdForTTL"]),
        paymentHistory: json["paymentHistory"] == null
            ? []
            : List<PaymentHistory>.from(
                json["paymentHistory"]!.map((x) => PaymentHistory.fromJson(x))),
        referralCode: json["referralCode"],
        planEndDate: json["planEndDate"] == null
            ? null
            : DateTime.parse(json["planEndDate"]),
        fcmTokens: json["fcmTokens"] == null
            ? []
            : List<String>.from(json["fcmTokens"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "_id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "phone": phone,
        "addressLane1": addressLane1,
        "addressLane2": addressLane2,
        "city": city,
        "state": state,
        "postalCode": postalCode,
        "country": country,
        "isOnline": isOnline,
        "blockedUsers": blockedUsers == null
            ? []
            : List<dynamic>.from(blockedUsers!.map((x) => x)),
        "role": role,
        "isVerified": isVerified,
        "isDeleted": isDeleted,
        "deletedMessage": deletedMessage,
        "isDisabled": isDisabled,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "lastSeen": lastSeen?.toIso8601String(),
        "profile": profile,
        "deletedTime": deletedTime?.toIso8601String(),
        "plan": plan,
        "previousPlan": previousPlan,
        "createdForTTL": createdForTtl?.toIso8601String(),
        "paymentHistory": paymentHistory == null
            ? []
            : List<dynamic>.from(paymentHistory!.map((x) => x.toJson())),
        "referralCode": referralCode,
        "planEndDate": planEndDate?.toIso8601String(),
        "fcmTokens": fcmTokens == null
            ? []
            : List<dynamic>.from(fcmTokens!.map((x) => x)),
      };
}

class Location {
  double? latitude;
  double? longitude;

  Location({
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class PaymentHistory {
  String? orderId;
  int? amount;
  String? currency;
  String? status;
  Method? method;
  DateTime? paidAt;
  String? id;

  PaymentHistory({
    this.orderId,
    this.amount,
    this.currency,
    this.status,
    this.method,
    this.paidAt,
    this.id,
  });

  factory PaymentHistory.fromJson(Map<String, dynamic> json) => PaymentHistory(
        orderId: json["orderId"],
        amount: json["amount"],
        currency: json["currency"],
        status: json["status"],
        method: json["method"] == null ? null : Method.fromJson(json["method"]),
        paidAt: json["paidAt"] == null ? null : DateTime.parse(json["paidAt"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "amount": amount,
        "currency": currency,
        "status": status,
        "method": method?.toJson(),
        "paidAt": paidAt?.toIso8601String(),
        "_id": id,
      };
}

class Method {
  Upi? upi;

  Method({
    this.upi,
  });

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        upi: json["upi"] == null ? null : Upi.fromJson(json["upi"]),
      );

  Map<String, dynamic> toJson() => {
        "upi": upi?.toJson(),
      };
}

class Upi {
  String? channel;
  String? upiId;

  Upi({
    this.channel,
    this.upiId,
  });

  factory Upi.fromJson(Map<String, dynamic> json) => Upi(
        channel: json["channel"],
        upiId: json["upi_id"],
      );

  Map<String, dynamic> toJson() => {
        "channel": channel,
        "upi_id": upiId,
      };
}
