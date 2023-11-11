import 'dart:developer';
import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:laundry_middle_transportation/model/building_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaundryStoreApi {
  final Dio _dio = Dio();

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  Future<void> getLaundryStore() async {
    final userId = await getUserId();
    if (userId == null) {
      // Handle the case where user_id is not available
      return;
    }
  }

  // Future<void> getLaundryStoreId() async {

  //   final userId = await getUserId();
  //   if (userId == null) {
  //     // Handle the case where user_id is not available
  //     return;
  //   }
  //   final response = await _dio
  //       .get('https://13.212.24.193/api/v1/laundry-stores?user-id=$userId');
  //   log(response['data']['items'][0]);
  //   log(response.toString());
  //   log(response.)
  //   return;
  // }

  Future<void> saveLaundryStoreId(String laundryStoreId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('laundry_store_id', laundryStoreId);
  }

  Future<void> getLaundryStoreId() async {
    final userId = await getUserId();
    if (userId == null) {
      // Handle the case where user_id is not available
      return;
    }

    try {
      final response = await _dio
          .get('https://13.212.24.193/api/v1/laundry-stores?user-id=$userId');

      if (response.statusCode == 200) {
        final responseData = response.data;
        final items = responseData['data']['items'];

        if (items.isNotEmpty) {
          final firstItem = items[0];
          final id = firstItem['id'];
          await saveLaundryStoreId(id);
          log('LaundryStore Id: $id');
        }
      } else {
        log('Error: ${response.statusCode} - ${response.statusMessage}');
      }
    } catch (error) {
      log('Error: $error');
    }
  }
}
