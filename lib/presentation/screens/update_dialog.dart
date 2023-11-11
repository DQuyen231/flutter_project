// // // // import 'package:flutter/material.dart';
// // // // import 'package:http/http.dart' as http;
// // // // import 'dart:convert';

// // // // class UpdateDialog extends StatefulWidget {
// // // //   final String orderId;

// // // //   UpdateDialog({required this.orderId});

// // // //   @override
// // // //   _UpdateDialogState createState() => _UpdateDialogState();
// // // // }

// // // // class _UpdateDialogState extends State<UpdateDialog> {
// // // //   String selectedStatus = 'preparing'; // Default status
// // // //   int orderStatus = -1;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();

// // // //     // Make the API call when the widget is initialized
// // // //     fetchOrderHistories(widget.orderId);
// // // //   }

// // // //   Future<void> fetchOrderHistories(String orderId) async {
// // // //     final apiUrl =
// // // //         'https://13.212.24.193/api/v1/orders/$orderId/order-histories';

// // // //     try {
// // // //       final response = await http.get(Uri.parse(apiUrl));

// // // //       if (response.statusCode == 200) {
// // // //         // API call was successful, process the response here

// // // //         final data = json.decode(response.body);
// // // //         print(data);

// // // //         orderStatus = data['data']['items'][0]['orderStatus'];
// // // //         setState(() {});
// // // //       } else {
// // // //         // API call failed
// // // //         print(
// // // //             'Failed to fetch order histories. Status code: ${response.statusCode}');
// // // //       }
// // // //     } catch (e) {
// // // //       print('Error while fetching order histories: $e');
// // // //     }
// // // //   }

// // // //   String getOrderStatusText(int status) {
// // // //     switch (status) {
// // // //       case 0:
// // // //         return 'Preparing';
// // // //       case 1:
// // // //         return 'Processing';
// // // //       case 2:
// // // //         return 'Completed';
// // // //       case 3:
// // // //         return 'Cancelled';
// // // //       default:
// // // //         return 'Unknown';
// // // //     }
// // // //   }

// // // //   Future<void> updateOrderStatus(String orderId, String status) async {
// // // //     final apiUrl = 'https://13.212.24.193/api/v1/orders/$orderId/order-history';

// // // //     try {
// // // //       final response = await http.post(
// // // //         Uri.parse(apiUrl),
// // // //         body: json.encode({'OrderStatus': status}),
// // // //         headers: {'Content-Type': 'application/json'},
// // // //       );

// // // //       if (response.statusCode == 200) {
// // // //         print('Order status updated successfully.');
// // // //       } else {
// // // //         print(
// // // //             'Failed to update order status. Status code: ${response.statusCode}');
// // // //       }
// // // //     } catch (e) {
// // // //       print('Error while updating order status: $e');
// // // //     }
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return AlertDialog(
// // // //       title: Text("Order's status: ${getOrderStatusText(orderStatus)}"),
// // // //       content: Column(
// // // //         mainAxisSize: MainAxisSize.min,
// // // //         children: <Widget>[
// // // //           Row(
// // // //             children: [
// // // //               Padding(
// // // //                 padding: const EdgeInsets.only(right: 15.0),
// // // //                 child:
// // // //                     Text('Change status to: ', style: TextStyle(fontSize: 14)),
// // // //               ),
// // // //               DropdownButton<String>(
// // // //                 value: selectedStatus,
// // // //                 items: ['preparing', 'processing', 'completed', 'cancelled']
// // // //                     .map((String status) {
// // // //                   return DropdownMenuItem<String>(
// // // //                     value: status,
// // // //                     child: Text(status),
// // // //                   );
// // // //                 }).toList(),
// // // //                 onChanged: (String? newValue) {
// // // //                   setState(() {
// // // //                     selectedStatus = newValue ?? 'preparing';
// // // //                   });
// // // //                 },
// // // //               ),
// // // //               SizedBox(width: 8.0),
// // // //             ],
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       actions: <Widget>[
// // // //         TextButton(
// // // //           child: Text('Update'),
// // // //           onPressed: () {
// // // //             // Add your code to update the order with the selected status.
// // // //             updateOrderStatus(widget.orderId, selectedStatus);
// // // //             Navigator.of(context).pop(); // Close the dialog.
// // // //           },
// // // //         ),
// // // //         TextButton(
// // // //           child: Text('Cancel'),
// // // //           onPressed: () {
// // // //             Navigator.of(context).pop(); // Close the dialog.
// // // //           },
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'dart:convert';

// // // class UpdateDialog extends StatefulWidget {
// // //   final String orderId;

// // //   UpdateDialog({required this.orderId});

// // //   @override
// // //   _UpdateDialogState createState() => _UpdateDialogState();
// // // }

// // // class _UpdateDialogState extends State<UpdateDialog> {
// // //   String selectedStatus = '0'; // Default status as a number
// // //   int deliveryStatus = -1;

// // //   final statusMap = {
// // //     '0': 'Pending',
// // //     '1': 'Delivering Laundry',
// // //     '2': 'Reached Laundry',
// // //     '3': 'Delivering Customer',
// // //     '4': 'Reached Customer',
// // //     '5': 'Delivered',
// // //   };

// // //   @override
// // //   void initState() {
// // //     super.initState();

// // //     // Make the API call when the widget is initialized
// // //     fetchDeliveryStatus(widget.orderId);
// // //   }

// // //   Future<void> fetchDeliveryStatus(String orderId) async {
// // //     final apiUrl =
// // //         'https://13.212.24.193/api/v1/orders/$orderId/order-histories';

// // //     try {
// // //       final response = await http.get(Uri.parse(apiUrl));

// // //       if (response.statusCode == 200) {
// // //         // API call was successful, process the response here

// // //         final data = json.decode(response.body);
// // //         print(data);

// // //         deliveryStatus = data['data']['items'][0]['deliveryStatus'];
// // //         print(deliveryStatus);

// // //         setState(() {});
// // //       } else {
// // //         // API call failed
// // //         print(
// // //             'Failed to fetch delivery status. Status code: ${response.statusCode}');
// // //       }
// // //     } catch (e) {
// // //       print('Error while fetching delivery status: $e');
// // //     }
// // //   }

// // //   Future<void> updateDeliveryStatus(String orderId, String status) async {
// // //     final apiUrl =
// // //         'https://13.212.24.193/api/v1/orders/$orderId/delivery-status';

// // //     try {
// // //       final response = await http.post(
// // //         Uri.parse(apiUrl),
// // //         body: json.encode({'DeliveryStatus': status}),
// // //         headers: {'Content-Type': 'application/json'},
// // //       );

// // //       if (response.statusCode == 200) {
// // //         print('Delivery status updated successfully.');
// // //       } else {
// // //         print(
// // //             'Failed to update delivery status. Status code: ${response.statusCode}');
// // //       }
// // //     } catch (e) {
// // //       print('Error while updating delivery status: $e');
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     String statusText = statusMap[deliveryStatus.toString()] ?? 'Unknown';

// // //     return AlertDialog(
// // //       title: Text(
// // //           "Delivery Status: ${statusMap[deliveryStatus]}"), // Display the delivery status as text
// // //       content: Column(
// // //         mainAxisSize: MainAxisSize.min,
// // //         children: <Widget>[
// // //           Row(
// // //             children: [
// // //               Padding(
// // //                 padding: const EdgeInsets.only(right: 15.0),
// // //                 child:
// // //                     Text('Change status to: ', style: TextStyle(fontSize: 14)),
// // //               ),
// // //               DropdownButton<String>(
// // //                 value: selectedStatus,
// // //                 items: statusMap.keys.map((String status) {
// // //                   return DropdownMenuItem<String>(
// // //                     value: status,
// // //                     child: Text(statusMap[status] ?? 'Unknown'),
// // //                   );
// // //                 }).toList(),
// // //                 onChanged: (String? newValue) {
// // //                   setState(() {
// // //                     selectedStatus = newValue ?? '0';
// // //                   });
// // //                 },
// // //               ),
// // //               SizedBox(width: 8.0),
// // //             ],
// // //           ),
// // //         ],
// // //       ),
// // //       actions: <Widget>[
// // //         TextButton(
// // //           child: Text('Update'),
// // //           onPressed: () {
// // //             // Add your code to update the delivery status with the selected status.
// // //             updateDeliveryStatus(widget.orderId, selectedStatus);
// // //             Navigator.of(context).pop(); // Close the dialog.
// // //           },
// // //         ),
// // //         TextButton(
// // //           child: Text('Cancel'),
// // //           onPressed: () {
// // //             Navigator.of(context).pop(); // Close the dialog.
// // //           },
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // class UpdateDialog extends StatefulWidget {
// //   final String orderId;

// //   UpdateDialog({required this.orderId});

// //   @override
// //   _UpdateDialogState createState() => _UpdateDialogState();
// // }

// // class _UpdateDialogState extends State<UpdateDialog> {
// //   String selectedStatus = '0'; // Default status as a number
// //   int deliveryStatus = -1;

// //   final statusMap = {
// //     '0': 'Pending',
// //     '1': 'Delivering Laundry',
// //     '2': 'Reached Laundry',
// //     '3': 'Delivering Customer',
// //     '4': 'Reached Customer',
// //     '5': 'Delivered',
// //   };

// //   @override
// //   void initState() {
// //     super.initState();

// //     // Make the API call when the widget is initialized
// //     fetchDeliveryStatus(widget.orderId);
// //   }

// //   Future<void> fetchDeliveryStatus(String orderId) async {
// //     final apiUrl =
// //         'https://13.212.24.193/api/v1/orders/$orderId/order-histories';

// //     try {
// //       final response = await http.get(Uri.parse(apiUrl));

// //       if (response.statusCode == 200) {
// //         // API call was successful, process the response here

// //         final data = json.decode(response.body);
// //         print(data);

// //         deliveryStatus = data['data']['items'][0]['deliveryStatus'];
// //         print(deliveryStatus);

// //         setState(() {});
// //       } else {
// //         // API call failed
// //         print(
// //             'Failed to fetch delivery status. Status code: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       print('Error while fetching delivery status: $e');
// //     }
// //   }

// //   Future<void> updateDeliveryStatus(String orderId, String status) async {
// //     final apiUrl =
// //         'https://13.212.24.193/api/v1/orders/$orderId/delivery-status';

// //     try {
// //       final response = await http.post(
// //         Uri.parse(apiUrl),
// //         body:
// //             json.encode({'DeliveryStatus': status}), // Send the selected status
// //         headers: {'Content-Type': 'application/json'},
// //       );

// //       if (response.statusCode == 200) {
// //         print('Delivery status updated successfully.');
// //       } else {
// //         print(
// //             'Failed to update delivery status. Status code: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       print('Error while updating delivery status: $e');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     String statusText = statusMap[deliveryStatus.toString()] ?? 'Unknown';

// //     return AlertDialog(
// //       title: Text("Delivery Status: $statusText"),
// //       content: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: <Widget>[
// //           Row(
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.only(right: 0.0),
// //                 child:
// //                     Text('Change status to: ', style: TextStyle(fontSize: 14)),
// //               ),
// //               DropdownButton<String>(
// //                 value: selectedStatus,
// //                 items: statusMap.keys.map((String status) {
// //                   return DropdownMenuItem<String>(
// //                     value: status,
// //                     child: Text(statusMap[status] ?? 'Unknown'),
// //                   );
// //                 }).toList(),
// //                 onChanged: (String? newValue) {
// //                   setState(() {
// //                     selectedStatus = newValue ?? '0';
// //                   });
// //                 },
// //               ),
// //               SizedBox(width: 8.0),
// //             ],
// //           ),
// //         ],
// //       ),
// //       actions: <Widget>[
// //         TextButton(
// //           child: Text('Update'),
// //           onPressed: () {
// //             // Add your code to update the delivery status with the selected status.
// //             updateDeliveryStatus(widget.orderId, selectedStatus);
// //             Navigator.of(context).pop(); // Close the dialog.
// //           },
// //         ),
// //         TextButton(
// //           child: Text('Cancel'),
// //           onPressed: () {
// //             Navigator.of(context).pop(); // Close the dialog.
// //           },
// //         ),
// //       ],
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class UpdateDialog extends StatefulWidget {
//   final String orderId;

//   UpdateDialog({required this.orderId});

//   @override
//   _UpdateDialogState createState() => _UpdateDialogState();
// }

// class _UpdateDialogState extends State<UpdateDialog> {
//   int selectedStatus = 0; // Default status as a number
//   int deliveryStatus = -1;

//   final statusMap = {
//     0: 'Pending',
//     1: 'Delivering Laundry',
//     2: 'Reached Laundry',
//     3: 'Delivering Customer',
//     4: 'Reached Customer',
//     5: 'Delivered',
//   };

//   @override
//   void initState() {
//     super.initState();

//     // Make the API call when the widget is initialized
//     fetchDeliveryStatus(widget.orderId);
//   }

//   Future<void> fetchDeliveryStatus(String orderId) async {
//     final apiUrl =
//         'https://13.212.24.193/api/v1/orders/$orderId/order-histories';

//     try {
//       final response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         // API call was successful, process the response here

//         final data = json.decode(response.body);
//         print(data);

//         deliveryStatus = data['data']['items'][0]['deliveryStatus'];
//         print(deliveryStatus);

//         setState(() {});
//       } else {
//         print(
//             'Failed to fetch delivery status. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error while fetching delivery status: $e');
//     }
//   }

//   Future<void> updateDeliveryStatus(String orderId, int status) async {
//     final apiUrl =
//         'https://13.212.24.193/api/v1/orders/$orderId/order-history?DeliveryStatus=$status';

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         // body: json.encode({
//         //   'DeliveryStatus': status
//         // }), // Send the selected status as an integer
//         headers: {'Content-Type': 'application/json'},
//       );

//       if (response.statusCode == 200) {
//         print('Delivery status updated successfully.');
//       } else {
//         print(
//             'Failed to update delivery status. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error while updating delivery status: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     String statusText = statusMap[deliveryStatus] ?? 'Unknown';

//     return AlertDialog(
//       title: Text(
//           "Delivery Status: ${statusMap[deliveryStatus]}"), // Display the delivery status as text
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 0.0),
//                 child:
//                     Text('Change status to: ', style: TextStyle(fontSize: 14)),
//               ),
//               DropdownButton<int>(
//                 // Use int instead of String
//                 value: selectedStatus,
//                 items: statusMap.keys.map((int status) {
//                   // Use int for keys
//                   return DropdownMenuItem<int>(
//                     value: status,
//                     child: Text(statusMap[status] ?? 'Unknown'),
//                   );
//                 }).toList(),
//                 onChanged: (int? newValue) {
//                   // Use int
//                   setState(() {
//                     selectedStatus = newValue ?? 0;
//                   });
//                 },
//               ),
//               SizedBox(width: 8.0),
//             ],
//           ),
//         ],
//       ),
//       actions: <Widget>[
//         TextButton(
//           child: Text('Update'),
//           onPressed: () {
//             // Add your code to update the delivery status with the selected status.
//             updateDeliveryStatus(widget.orderId, selectedStatus);
//             Navigator.of(context).pop(); // Close the dialog.
//           },
//         ),
//         TextButton(
//           child: Text('Cancel'),
//           onPressed: () {
//             Navigator.of(context).pop(); // Close the dialog.
//           },
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateDialog extends StatefulWidget {
  final String orderId;
  final int currentStatus;

  UpdateDialog({required this.orderId, required this.currentStatus});

  @override
  _UpdateDialogState createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  int deliveryStatus = -1;
  final statusMap = {
    0: 'Pending',
    1: 'Delivering Laundry',
    2: 'Reached Laundry',
    3: 'Delivering Customer',
    4: 'Reached Customer',
    5: 'Delivered',
  };
  int laundryStatus = -1;
  final laundryStatusMap = {
    0: 'Pending',
    1: 'Washing',
    2: 'Finished',
  };

  @override
  void initState() {
    super.initState();

    // Make the API call when the widget is initialized
    fetchDeliveryStatus(widget.orderId);
    fetchLaundryStatus(widget.orderId);
  }

  Future<void> fetchDeliveryStatus(String orderId) async {
    final apiUrl =
        'https://13.212.24.193/api/v1/orders/$orderId/order-histories';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // API call was successful, process the response here

        final data = json.decode(response.body);
        print(data);

        deliveryStatus = data['data']['items'][0]['deliveryStatus'];
        print(deliveryStatus);

        setState(() {});
      } else {
        print(
            'Failed to fetch delivery status. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error while fetching delivery status: $e');
    }
  }

  Future<void> fetchLaundryStatus(String orderId) async {
    final apiUrl =
        'https://13.212.24.193/api/v1/orders/$orderId/order-histories';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // API call was successful, process the response here

        final data = json.decode(response.body);
        print(data);

        laundryStatus = data['data']['items'][0]['laundryStatus'];
        print(laundryStatus);

        setState(() {});
      } else {
        print(
            'Failed to fetch laundry status. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error while fetching delivery status: $e');
    }
  }

  Future<void> updateDeliveryStatus(String orderId, int status) async {
    if (laundryStatus == 1) {
      print('Failed to update');
    } else {
      final apiUrl =
          'https://13.212.24.193/api/v1/orders/$orderId/order-history?DeliveryStatus=$status';

      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          // body: json.encode({
          //   'DeliveryStatus': status
          // }), // Send the selected status as an integer
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          print('Delivery status updated successfully.');
        } else {
          print(
              'Failed to update delivery status. Status code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error while updating delivery status: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String statusText = statusMap[deliveryStatus] ?? 'Unknown';
    if (laundryStatus == 0) {}

    return AlertDialog(
      title: Text("Delivery Status: ${statusMap[deliveryStatus]}"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Text(
                    'Change status to: ${statusMap[deliveryStatus + 1]}',
                    style: TextStyle(fontSize: 14)),
              ),
              // DropdownButton<int>(
              //   // Use int instead of String
              //   value: selectedStatus,
              //   items: statusMap.keys.map((int status) {
              //     // Use int for keys
              //     return DropdownMenuItem<int>(
              //       value: status,
              //       child: Text(statusMap[status] ?? 'Unknown'),
              //     );
              //   }).toList(),
              //   onChanged: (int? newValue) {
              //     // Use int
              //     setState(() {
              //       selectedStatus = newValue ?? 0;
              //     });
              //   },
              // ),
              SizedBox(width: 8.0),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Update'),
          onPressed: () {
            if (laundryStatus == 0 && deliveryStatus < 2) {
              updateDeliveryStatus(widget.orderId, deliveryStatus + 1);
              Navigator.of(context).pop();
            } else if (laundryStatus == 2 && deliveryStatus >= 2) {
              updateDeliveryStatus(widget.orderId, deliveryStatus + 1);
              Navigator.of(context).pop();
            } else if (laundryStatus == 2 && deliveryStatus == 0) {
              updateDeliveryStatus(widget.orderId, deliveryStatus + 3);
              Navigator.of(context).pop();
            }
          },
        ),
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog.
          },
        ),
      ],
    );
  }
}
