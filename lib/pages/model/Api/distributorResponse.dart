import '../../../Services/BaseResponse.dart';

class DistributorResponse extends BaseResponse{
  String? code;
  String? message;
  Data? data;
  bool? status;

  DistributorResponse({this.code, this.message, this.data});

  DistributorResponse.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? email;
  String? subject;
  String? message;

  Errors({this.name, this.email, this.subject, this.message});

  Errors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    subject = json['subject'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['subject'] = this.subject;
    data['message'] = this.message;
    return data;
  }
}
