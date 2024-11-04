// To parse this JSON data, do
//
//     final customerResponse = customerResponseFromJson(jsonString);

import 'dart:convert';

CustomerResponse customerResponseFromJson(String str) => CustomerResponse.fromJson(json.decode(str));

String customerResponseToJson(CustomerResponse data) => json.encode(data.toJson());

class CustomerResponse {
  bool? success;
  List<Result>? result;

  CustomerResponse({
     this.success,
     this.result,
  });

  factory CustomerResponse.fromJson(Map<String, dynamic> json) => CustomerResponse(
    success: json["success"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  int id;
  String name;
  String mobile;
  String email;
  String address;
  String alremobile;

  Result({
    required this.id,
    required this.name,
    required this.mobile,
    required this.email,
    required this.address,
    required this.alremobile,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    address: json["address"],
    alremobile: json["alremobile"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "address": address,
    "alremobile": alremobile,
  };
}
