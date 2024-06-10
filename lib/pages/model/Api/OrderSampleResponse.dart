import 'package:american_quartz/Services/BaseResponse.dart';

class OrderSampleResponse extends BaseResponse{
  String? code;
  String? message;
  Data? data;
  bool? status;

  OrderSampleResponse({this.code, this.message, this.data});

  OrderSampleResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  @override
  String getMessage() {
    return message!;
  }

  @override
  bool isSuccess() {
    return status == true;
  }
}

class Data {
  int? status;
  Errors? errors;

  Data({this.status, this.errors});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Errors {
  String? color1;
  String? color2;
  String? color3;
  String? firstName;
  String? lastName;
  String? email;

  Errors(
      {this.color1,
        this.color2,
        this.color3,
        this.firstName,
        this.lastName,
        this.email});

  Errors.fromJson(Map<String, dynamic> json) {
    color1 = json['color1'];
    color2 = json['color2'];
    color3 = json['color3'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color1'] = this.color1;
    data['color2'] = this.color2;
    data['color3'] = this.color3;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}
