import 'dart:developer';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:laundry_middle_transportation/model/building_model.dart';
import 'package:http/http.dart' as http;

class buildingApi {
  final Dio _dio = Dio();

  Future<List<Building>> fetchBuilding() async {
    try {
      final response = await _dio.get('https://13.212.24.193/api/v1/building');

      if (response.statusCode == 200) {
        final List<dynamic> buildingItems = response.data['data']['items'];
        return buildingItems.map((item) => Building.fromJson(item)).toList();
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }

  // Future<Building> fetchBuildingById(String buildingId) async {
  //   try {
  //     final response = await _dio.get(
  //         'https://13.212.24.193/api/v1/building/$buildingId'); // Include the buildingId in the URL

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> buildingData = response
  //           .data['data']; // Assuming the building data is directly in 'data'
  //       return Building.fromJson(buildingData);
  //     } else {
  //       throw Exception(
  //           'Failed to load building data. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     throw Exception('Error fetching building data: $error');
  //   }
  // }
}
