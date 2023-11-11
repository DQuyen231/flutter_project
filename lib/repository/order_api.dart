import 'dart:developer';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:laundry_middle_transportation/model/order_model.dart';
import 'package:laundry_middle_transportation/model/order_history_model.dart';
import 'package:http/http.dart' as http;

class OrderApi {
  final Dio _dio = Dio();

  Future<List<Order>> fetchOrder() async {
    try {
      final response = await _dio.get('https://13.212.24.193/api/v1/orders');
      log(response.toString());

      if (response.statusCode == 200) {
        final List<dynamic> orderItems = response.data['data']['items'];

        return orderItems.map((item) => Order.fromJson(item)).toList();
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }

  Future<OrderHistory> fetchOrderHistory(String orderID) async {
    try {
      final response = await _dio
          .get('https://13.212.24.193/api/v1/orders/$orderID/order-histories');
      if (response.statusCode == 200) {
        final List<dynamic> orderHistoryItems = response.data['data']['items'];

        if (orderHistoryItems.isNotEmpty) {
          final Map<String, dynamic> orderHistoryData = orderHistoryItems[0];
          return OrderHistory.fromJson(orderHistoryData);
        } else {
          return OrderHistory(
              orderID: orderID, laundryStatus: 0, deliveryStatus: 0);
        }
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }
}
