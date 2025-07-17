// To parse this JSON data, do
//
//     final chatsModel = chatsModelFromJson(jsonString);

import 'dart:convert';

List<ChatsModel> chatsModelFromJson(String str) =>
    List<ChatsModel>.from(json.decode(str).map((x) => ChatsModel.fromJson(x)));

String chatsModelToJson(List<ChatsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatsModel {
  String? id;
  bool? isGroupChat;
  List<Participant>? participants;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  LastMessage? lastMessage;

  ChatsModel({
    this.id,
    this.isGroupChat,
    this.participants,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.lastMessage,
  });

  factory ChatsModel.fromJson(Map<String, dynamic> json) => ChatsModel(
        id: json["_id"],
        isGroupChat: json["isGroupChat"],
        participants: json["participants"] == null
            ? []
            : List<Participant>.from(
                json["participants"].map((x) => Participant.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        lastMessage: json["lastMessage"] == null
            ? null
            : LastMessage.fromJson(json["lastMessage"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "isGroupChat": isGroupChat,
        "participants": participants == null
            ? []
            : List<dynamic>.from((participants ?? []).map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "lastMessage": lastMessage?.toJson(),
      };
}

class LastMessage {
  String? id;
  SenderId? senderId;
  String? content;
  MessageType? messageType;
  String? fileUrl;
  DateTime? createdAt;

  LastMessage({
    this.id,
    this.senderId,
    this.content,
    this.messageType,
    this.fileUrl,
    this.createdAt,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        id: json["_id"],
        senderId: senderIdValues.map[json["senderId"]],
        content: json["content"],
        messageType: messageTypeValues.map[json["messageType"]],
        fileUrl: json["fileUrl"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "senderId": senderIdValues.reverse[senderId],
        "content": content,
        "messageType": messageTypeValues.reverse[messageType],
        "fileUrl": fileUrl,
        "createdAt": createdAt?.toIso8601String(),
      };
}

enum MessageType { TEXT }

final messageTypeValues = EnumValues({"text": MessageType.TEXT});

enum SenderId { THE_673_D80_BC2330_E08_C323_F4393 }

final senderIdValues = EnumValues(
    {"673d80bc2330e08c323f4393": SenderId.THE_673_D80_BC2330_E08_C323_F4393});

class Participant {
  Location? location;
  String? id;
  String? name;
  String? email;
  String? password;
  Gender? gender;
  String? phone;
  String? addressLane1;
  String? addressLane2;
  String? city;
  State? state;
  String? postalCode;
  Country? country;
  bool? isOnline;
  List<dynamic>? blockedUsers;
  Role? role;
  bool? isVerified;
  bool? isDeleted;
  DeletedMessage? deletedMessage;
  bool? isDisabled;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  DateTime? lastSeen;
  String? profile;
  DateTime? deletedTime;
  Plan? plan;
  PreviousPlan? previousPlan;
  DateTime? createdForTtl;
  List<PaymentHistory>? paymentHistory;
  String? referralCode;
  DateTime? planEndDate;
  List<String>? fcmTokens;
  String? referralId;

  Participant({
    this.location,
    this.id,
    this.name,
    this.email,
    this.password,
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
    this.referralId,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        gender: genderValues.map[json["gender"]],
        phone: json["phone"],
        addressLane1: json["addressLane1"],
        addressLane2: json["addressLane2"],
        city: json["city"],
        state: stateValues.map[json["state"]],
        postalCode: json["postalCode"],
        country: countryValues.map[json["country"]],
        isOnline: json["isOnline"],
        blockedUsers: json["blockedUsers"] == null
            ? []
            : List<dynamic>.from(json["blockedUsers"].map((x) => x)),
        role: roleValues.map[json["role"]],
        isVerified: json["isVerified"],
        isDeleted: json["isDeleted"],
        deletedMessage: deletedMessageValues.map[json["deletedMessage"]],
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
        plan: planValues.map[json["plan"]],
        previousPlan: previousPlanValues.map[json["previousPlan"]],
        createdForTtl: json["createdForTTL"] == null
            ? null
            : DateTime.parse(json["createdForTTL"]),
        paymentHistory: json["paymentHistory"] == null
            ? []
            : List<PaymentHistory>.from(
                json["paymentHistory"].map((x) => PaymentHistory.fromJson(x))),
        referralCode: json["referralCode"],
        planEndDate: json["planEndDate"] == null
            ? null
            : DateTime.parse(json["planEndDate"]),
        fcmTokens: json["fcmTokens"] == null
            ? []
            : List<String>.from(json["fcmTokens"].map((x) => x)),
        referralId: json[" referralId"],
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "gender": genderValues.reverse[gender],
        "phone": phone,
        "addressLane1": addressLane1,
        "addressLane2": addressLane2,
        "city": city,
        "state": stateValues.reverse[state],
        "postalCode": postalCode,
        "country": countryValues.reverse[country],
        "isOnline": isOnline,
        "blockedUsers": blockedUsers == null
            ? []
            : List<dynamic>.from((blockedUsers ?? []).map((x) => x)),
        "role": roleValues.reverse[role],
        "isVerified": isVerified,
        "isDeleted": isDeleted,
        "deletedMessage": deletedMessageValues.reverse[deletedMessage],
        "isDisabled": isDisabled,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "lastSeen": lastSeen?.toIso8601String(),
        "profile": profile,
        "deletedTime": deletedTime?.toIso8601String(),
        "plan": planValues.reverse[plan],
        "previousPlan": previousPlanValues.reverse[previousPlan],
        "createdForTTL": createdForTtl?.toIso8601String(),
        "paymentHistory": paymentHistory == null
            ? []
            : List<dynamic>.from((paymentHistory ?? []).map((x) => x.toJson())),
        "referralCode": referralCode,
        "planEndDate": planEndDate?.toIso8601String(),
        "fcmTokens": fcmTokens == null
            ? []
            : List<dynamic>.from((fcmTokens ?? []).map((x) => x)),
        " referralId": referralId,
      };
}

enum Country { ALBANIA, INDIA }

final countryValues =
    EnumValues({"Albania": Country.ALBANIA, "India": Country.INDIA});

enum DeletedMessage { EMPTY, USER_REQUESTED_DELETE }

final deletedMessageValues = EnumValues({
  "": DeletedMessage.EMPTY,
  "User requested Delete": DeletedMessage.USER_REQUESTED_DELETE
});

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

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
  OrderId? orderId;
  int? amount;
  Currency? currency;
  Status? status;
  Method? method;
  DateTime? paidAt;
  Id? id;

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
        orderId: orderIdValues.map[json["orderId"]],
        amount: json["amount"],
        currency: currencyValues.map[json["currency"]],
        status: statusValues.map[json["status"]],
        method: json["method"] == null ? null : Method.fromJson(json["method"]),
        paidAt: json["paidAt"] == null ? null : DateTime.parse(json["paidAt"]),
        id: idValues.map[json["_id"]],
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderIdValues.reverse[orderId],
        "amount": amount,
        "currency": currencyValues.reverse[currency],
        "status": statusValues.reverse[status],
        "method": method?.toJson(),
        "paidAt": paidAt?.toIso8601String(),
        "_id": idValues.reverse[id],
      };
}

enum Currency { INR }

final currencyValues = EnumValues({"INR": Currency.INR});

enum Id {
  THE_6821_E3187_ECD4312_AD91_A007,
  THE_68244_C2_DF9127_E5_F753_A5_FCE,
  THE_6825678_F7190_B95_D91_D3_ECBE,
  THE_6825739_DAF8_B99_A05_ADEE71_C
}

final idValues = EnumValues({
  "6821e3187ecd4312ad91a007": Id.THE_6821_E3187_ECD4312_AD91_A007,
  "68244c2df9127e5f753a5fce": Id.THE_68244_C2_DF9127_E5_F753_A5_FCE,
  "6825678f7190b95d91d3ecbe": Id.THE_6825678_F7190_B95_D91_D3_ECBE,
  "6825739daf8b99a05adee71c": Id.THE_6825739_DAF8_B99_A05_ADEE71_C
});

class Method {
  Upi? upi;
  Card? card;

  Method({
    this.upi,
    this.card,
  });

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        upi: json["upi"] == null ? null : Upi.fromJson(json["upi"]),
        card: json["card"] == null ? null : Card.fromJson(json["card"]),
      );

  Map<String, dynamic> toJson() => {
        "upi": upi?.toJson(),
        "card": card?.toJson(),
      };
}

class Card {
  String? cardBankName;
  String? cardCountry;
  String? cardNetwork;
  dynamic cardNetworkReferenceId;
  String? cardNumber;
  String? cardSubType;
  String? cardType;
  String? channel;

  Card({
    this.cardBankName,
    this.cardCountry,
    this.cardNetwork,
    this.cardNetworkReferenceId,
    this.cardNumber,
    this.cardSubType,
    this.cardType,
    this.channel,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        cardBankName: json["card_bank_name"],
        cardCountry: json["card_country"],
        cardNetwork: json["card_network"],
        cardNetworkReferenceId: json["card_network_reference_id"],
        cardNumber: json["card_number"],
        cardSubType: json["card_sub_type"],
        cardType: json["card_type"],
        channel: json["channel"],
      );

  Map<String, dynamic> toJson() => {
        "card_bank_name": cardBankName,
        "card_country": cardCountry,
        "card_network": cardNetwork,
        "card_network_reference_id": cardNetworkReferenceId,
        "card_number": cardNumber,
        "card_sub_type": cardSubType,
        "card_type": cardType,
        "channel": channel,
      };
}

class Upi {
  Channel? channel;
  UpiId? upiId;

  Upi({
    this.channel,
    this.upiId,
  });

  factory Upi.fromJson(Map<String, dynamic> json) => Upi(
        channel: channelValues.map[json["channel"]],
        upiId: upiIdValues.map[json["upi_id"]],
      );

  Map<String, dynamic> toJson() => {
        "channel": channelValues.reverse[channel],
        "upi_id": upiIdValues.reverse[upiId],
      };
}

enum Channel { COLLECT }

final channelValues = EnumValues({"collect": Channel.COLLECT});

enum UpiId { TESTSUCCESS_GOCASH }

final upiIdValues =
    EnumValues({"testsuccess@gocash": UpiId.TESTSUCCESS_GOCASH});

enum OrderId {
  ORDER_1747051251357,
  ORDER_1747209186190,
  ORDER_1747281773884,
  ORDER_1747284859532
}

final orderIdValues = EnumValues({
  "ORDER_1747051251357": OrderId.ORDER_1747051251357,
  "ORDER_1747209186190": OrderId.ORDER_1747209186190,
  "ORDER_1747281773884": OrderId.ORDER_1747281773884,
  "ORDER_1747284859532": OrderId.ORDER_1747284859532
});

enum Status { SUCCESS }

final statusValues = EnumValues({"SUCCESS": Status.SUCCESS});

enum Plan { EMPTY, ULTIMATE }

final planValues = EnumValues({"": Plan.EMPTY, "Ultimate": Plan.ULTIMATE});

enum PreviousPlan { FREE_PLAN, STANDARD, ULTIMATE }

final previousPlanValues = EnumValues({
  "FreePlan": PreviousPlan.FREE_PLAN,
  "Standard": PreviousPlan.STANDARD,
  "Ultimate": PreviousPlan.ULTIMATE
});

enum Role { CUSTOMER, VENDOR }

final roleValues =
    EnumValues({"customer": Role.CUSTOMER, "vendor": Role.VENDOR});

enum State { ANDHRA_PRADESH, BERAT_DISTRICT, TELANGANA }

final stateValues = EnumValues({
  "Andhra Pradesh": State.ANDHRA_PRADESH,
  "Berat District": State.BERAT_DISTRICT,
  "Telangana": State.TELANGANA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
