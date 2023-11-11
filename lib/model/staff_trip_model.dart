import 'package:laundry_middle_transportation/model/building_model.dart';
import 'package:laundry_middle_transportation/model/order_model.dart';
import 'package:laundry_middle_transportation/repository/building_api.dart';
import 'package:dio/dio.dart';

class staffTrip {
  final String id;
  final int tripCollect;
  final String buildingID;
  final String timeScheduleID;
  final String staffID;
  final int tripType;

  staffTrip({
    required this.tripCollect,
    required this.buildingID,
    required this.timeScheduleID,
    required this.staffID,
    required this.tripType,
    required this.id,
  });

  factory staffTrip.fromJson(Map<String, dynamic> json) {
    return staffTrip(
      id: json['id'],
      tripCollect: json['tripCollect'],
      buildingID: json['buildingID'],
      timeScheduleID: json['timeScheduleID'],
      staffID: json['staffID'],
      tripType: json['tripType'],
    );
  }
}
