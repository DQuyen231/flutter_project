import 'dart:developer';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:laundry_middle_transportation/model/building_model.dart';
import 'package:laundry_middle_transportation/model/order_model.dart';
import 'package:laundry_middle_transportation/model/staff_trip_model.dart';
import 'package:http/http.dart' as http;

class staffTripApi {
  final Dio _dio = Dio();

  Future<List<staffTrip>> fetchStaffTrip() async {
    try {
      final response =
          await _dio.get('https://13.212.24.193/api/v1/staff-trip');

      if (response.statusCode == 200) {
        final List<dynamic> staffTripItems = response.data['data']['items'];
        return staffTripItems.map((item) => staffTrip.fromJson(item)).toList();
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }

  Future<Building> fetchBuildingById(String buildingId) async {
    try {
      final response =
          await _dio.get('https://13.212.24.193/api/v1/building/$buildingId');
      if (response.statusCode == 200) {
        final Map<String, dynamic> buildingData = response.data['data'];
        return Building.fromJson(buildingData);
      } else {
        throw Exception(
            'Failed to load building data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching building data: $error');
    }
  }

  Future<Order> fetchOrder(String orderId) async {
    try {
      final response =
          await _dio.get('https://13.212.24.193/api/v1/order/$orderId');

      if (response.statusCode == 200) {
        final Map<String, dynamic> orderItems = response.data['data'];
        return Order.fromJson(orderItems);
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }
}
