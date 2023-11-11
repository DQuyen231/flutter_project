import 'dart:convert';

import 'base_data_source.dart';

Future<BuildingModel?> postBuilding(
    String name, String address, String description) async {
  try {
    final response = await BaseDataSource()
        .post("https://13.212.24.193/api/v1/building", data: {
      "name": "string",
      "address": "string",
      "description": "string",
    });
    Map<String, dynamic> responseData = json.decode(response.data);

    final result = BuildingModel.fromJson(responseData);

    return result;
  } catch (e) {
    //TODO(levi) : trả về lỗi
    return null;
  }
}

class BuildingModel {
  String? type;
  String? title;
  int? status;
  String? detail;
  String? instance;
  String? additionalProp1;
  String? additionalProp2;
  String? additionalProp3;

  BuildingModel(
      {this.type,
      this.title,
      this.status,
      this.detail,
      this.instance,
      this.additionalProp1,
      this.additionalProp2,
      this.additionalProp3});

  BuildingModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    status = json['status'];
    detail = json['detail'];
    instance = json['instance'];
    additionalProp1 = json['additionalProp1'];
    additionalProp2 = json['additionalProp2'];
    additionalProp3 = json['additionalProp3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    data['status'] = this.status;
    data['detail'] = this.detail;
    data['instance'] = this.instance;
    data['additionalProp1'] = this.additionalProp1;
    data['additionalProp2'] = this.additionalProp2;
    data['additionalProp3'] = this.additionalProp3;
    return data;
  }
}
