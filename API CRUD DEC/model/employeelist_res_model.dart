// To parse this JSON data, do
//
//     final employeessListResModel = employeessListResModelFromJson(jsonString);

import 'dart:convert';

EmployeessListResModel employeessListResModelFromJson(String str) => EmployeessListResModel.fromJson(json.decode(str));

String employeessListResModelToJson(EmployeessListResModel data) => json.encode(data.toJson());

class EmployeessListResModel {
  int? status;
  String? message;
  List<EmployeeDetails>? employeeList;

  EmployeessListResModel({
    this.status,
    this.message,
    this.employeeList,
  });

  factory EmployeessListResModel.fromJson(Map<String, dynamic> json) => EmployeessListResModel(
    status: json["status"],
    message: json["message"],
    employeeList: json["data"] == null ? [] : List<EmployeeDetails>.from(json["data"]!.map((x) => EmployeeDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": employeeList == null ? [] : List<dynamic>.from(employeeList!.map((x) => x.toJson())),
  };
}

class EmployeeDetails {
  int? id;
  String? name;
  String? role;

  EmployeeDetails({
    this.id,
    this.name,
    this.role,
  });

  factory EmployeeDetails.fromJson(Map<String, dynamic> json) => EmployeeDetails(
    id: json["id"],
    name: json["name"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "role": role,
  };
}
