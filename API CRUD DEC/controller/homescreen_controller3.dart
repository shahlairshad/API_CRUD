import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/employeelist_res_model.dart';

class HomeScreenController extends ChangeNotifier {
  List<EmployeeDetails> employeeList = [];
  bool isLoading = false;

  final baseUrl = "http://3.93.46.140";

// getData method
  Future<void> getData() async {
    isLoading = true;
    notifyListeners();

    final url = "$baseUrl/employees/";
    final parsedUrl = Uri.parse(url);

    final response = await http.get(parsedUrl);
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      EmployeessListResModel resModel =
      EmployeessListResModel.fromJson(decodedResponse);

      employeeList = resModel.employeeList ?? [];
      isLoading = false;
      notifyListeners(); // Notify listeners after updating employeeList
    } else {
      isLoading = false;
      notifyListeners();
    }
  }

// addData method
  Future<bool> addData({
    required String name,
    required String role,
  }) async {
    isLoading = true;
    notifyListeners();

    final url = "$baseUrl/employees/create/";
    final parsedUrl = Uri.parse(url);

    final response = await http.post(parsedUrl, body: {
      "name": name,
      "role": role,
    });
    if (response.statusCode == 200) {
      print("Employee added successfully");
      await getData(); // Wait for data to be fetched before notifying listeners
      isLoading = false;
      notifyListeners(); // Notify listeners after adding data
      return true;
    } else {
      print("Failed to add employee");
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

// editData method
  Future<bool> editData({
    required String id,
    required String name,
    required String role,
  }) async {
    isLoading = true;
    notifyListeners();

    final url = "$baseUrl/employees/update/$id/";
    final parsedUrl = Uri.parse(url);

    final response = await http.put(parsedUrl, body: {
      "name": name,
      "role": role,
    });
    if (response.statusCode == 200) {
      print("Employee updated successfully");
      await getData(); // Wait for data to be fetched before notifying listeners
      isLoading = false;
      notifyListeners(); // Notify listeners after editing data
      return true;
    } else {
      print("Failed to edit employee");
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

// deleteData method
  Future<void> deleteData(String id) async {
    isLoading = true;
    notifyListeners();

    final url = "$baseUrl/employees/$id/";
    final parsedUrl = Uri.parse(url);

    final response = await http.delete(parsedUrl);
    if (response.statusCode == 200) {
      print("Employee deleted");
      await getData(); // Wait for data to be fetched before notifying listeners
    } else {
      print("Failed to delete employee");
    }
    isLoading = false;
    notifyListeners(); // Notify listeners after deleting data
  }
}

  //get data
//   Future getData() async {
//     isLoading = true;
//     notifyListeners();
//
//     final url = "$baseUrl/employees/";
//     print(url);
//     final parsedUrl = Uri.parse(url);
//
//     final response = await http.get(parsedUrl);
//     if (response.statusCode == 201) {
//       final decodedResponse = jsonDecode(response.body);
//       EmployeessListResModel resModel =
//       EmployeessListResModel.fromJson(decodedResponse);
//
//       employeeList = resModel.employeeList ?? [];
//       isLoading = false;
//     } else {
//       isLoading = false;
//     }
//     notifyListeners();
//   }
//
//   // add data
//   Future<bool> addData({
//     required String name,
//     required String role,
//   }) async {
//     isLoading = true;
//     notifyListeners();
//
//     final url = "$baseUrl/employees/create/";
//
//     final parsedUrl = Uri.parse(url);
//
//     final response = await http.post(parsedUrl, body: {
//       "name": name,
//       "role": role,
//     });
//     if (response.statusCode == 200) {
//       print("Employee added successfully");
//       getData();
//       isLoading = false;
//       notifyListeners();
//       return true;
//     } else {
//       print("failed to add employee");
//       isLoading = false;
//       notifyListeners();
//       return false;
//     }
//   }
//
//   // edit data
//   Future editData({
//     required String id,
//     required String name,
//     required String role,
//   }) async {
//     isLoading = true;
//     notifyListeners();
//
//     final url = "$baseUrl/employees/update/$id/";
//
//     final parsedUrl = Uri.parse(url);
//
//     final response = await http.put(parsedUrl, body: {
//       "name": name,
//       "role": role,
//     });
//     if (response.statusCode == 200) {
//       print("Employee updated successfully");
//       getData();
//       isLoading = false;
//       notifyListeners();
//       return true;
//     } else {
//       print("failed to edit employee");
//       isLoading = false;
//       notifyListeners();
//       return false;
//     }
//   }
//
//   // delete data
//   Future deleteData(String id) async {
//     isLoading = true;
//     notifyListeners();
//
//     final url = "$baseUrl/employees/$id/";
//     print(url);
//     final parsedUrl = Uri.parse(url);
//
//     final response = await http.delete(parsedUrl);
//     if (response.statusCode == 200) {
//       print("Employee deleted");
//       getData();
//       isLoading = false;
//     } else {
//       print("failed to delete employee");
//       isLoading = false;
//     }
//     notifyListeners();
//   }
// }