// To parse this JSON data, do
//
//     final authenticationRequestModel = authenticationRequestModelFromJson(jsonString);

import 'dart:convert';

AuthenticationRequestModel authenticationRequestModelFromJson(String str) => AuthenticationRequestModel.fromJson(json.decode(str));

String authenticationRequestModelToJson(AuthenticationRequestModel data) => json.encode(data.toJson());

class AuthenticationRequestModel {

  String token;

  AuthenticationRequestModel({

    required this.token,
  });

  factory AuthenticationRequestModel.fromJson(Map<String, dynamic> json) => AuthenticationRequestModel(
     token: json["token"],
  );

  Map<String, dynamic> toJson() => {
     "token": token,
  };
}


