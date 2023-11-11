// import 'package:flutter/material.dart';
// import 'package:laundry_middle_transportation/dashboard.dart';
// import 'package:laundry_middle_transportation/model/order_history_model.dart';
// import 'package:laundry_middle_transportation/model/order_model.dart';
// import 'package:laundry_middle_transportation/presentation/screens/update_laundry_status.dart';
// import 'package:laundry_middle_transportation/repository/order_api.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:laundry_middle_transportation/presentation/screens/update_dialog.dart';
// import 'package:laundry_middle_transportation/presentation/screens/laundry_dashboard.dart';

// class OrderByLaundryStore extends StatefulWidget {
//   String? laundryStoreID;

//   OrderByLaundryStore({required this.laundryStoreID});
//   @override
//   State<OrderByLaundryStore> createState() => _OrderListState();
// }

// class _OrderListState extends State<OrderByLaundryStore> {
//   Map<String, int> selectedStatusMap = {};
//   late OrderApi orderApi = OrderApi();
//   late Future<List<Order>> futureOrders;

//   @override
//   void initState() {
//     super.initState();
//     futureOrders = Future.delayed(Duration(seconds: 2), () {
//       return fetchOrderData();
//     });
//   }

//   Future<List<Order>> fetchOrderData() async {
//     final allOrders = await orderApi.fetchOrder();
//     final laundryStoreOrders = allOrders
//         .where((order) => order.laundryStoreID == widget.laundryStoreID)
//         .toList();
//     return laundryStoreOrders;
//   }

//   Future<OrderHistory> fetchOrderHistory(String orderID) async {
//     return orderApi.fetchOrderHistory(orderID);
//   }

//   String laundry(int value) {
//     switch (value) {
//       case 0:
//         return 'Pending';
//       case 1:
//         return 'Washing';
//       default:
//         return 'Finished';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => Home()),
//             );
//           },
//         ),
//         title: Text('OrderList'),
//       ),
//       body: FutureBuilder<List<Order>>(
//         // Wrap the FutureBuilder in a Shimmer effect
//         future: futureOrders,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Shimmer.fromColors(
//               baseColor: Colors.grey[300]!, // Color when shimmering
//               highlightColor:
//                   Colors.grey[100]!, // Highlight color when shimmering
//               child: ListView.builder(
//                 itemCount: 5, // Number of shimmering items
//                 itemBuilder: (context, index) {
//                   return ShimmerLoadingItem(); // A custom loading item
//                 },
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No orders available.'));
//           } else {
//             return ListView.separated(
//               padding: EdgeInsets.all(16.0),
//               separatorBuilder: (context, index) => SizedBox(height: 16.0),
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final order = snapshot.data![index];
//                 final formattedOrderDate = DateFormat('MMM d, yyyy HH:mm')
//                     .format(DateTime.parse(order.orderDate));
//                 return FutureBuilder<OrderHistory>(
//                   future: fetchOrderHistory(order.id),
//                   builder: (context, historySnapshot) {
//                     if (historySnapshot.connectionState ==
//                         ConnectionState.waiting) {
//                       return CircularProgressIndicator();
//                     } else if (historySnapshot.hasError) {
//                       return Text(
//                           'Error fetching OrderHistory: ${historySnapshot.error}');
//                     } else if (historySnapshot.hasData) {
//                       final OrderHistory orderHistory = historySnapshot.data!;
//                       return Container(
//                         margin: EdgeInsets.symmetric(vertical: 8.0),
//                         child: Card(
//                           elevation: 3,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(FontAwesome.calendar),
//                                     SizedBox(width: 8.0),
//                                     Text(
//                                       'Order Date: $formattedOrderDate',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 18.0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 8.0),
//                                 // Row(
//                                 //   children: [
//                                 //     Icon(FontAwesome.credit_card),
//                                 //     SizedBox(width: 8.0),
//                                 //     Text(
//                                 //       'Status: ${laundryStatus(order)}',
//                                 //     ),
//                                 //   ],
//                                 // ),
//                                 Row(
//                                   children: [
//                                     Icon(FontAwesome.map_marker),
//                                     SizedBox(width: 8.0),
//                                     Text('Address: ${order.address}'),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(FontAwesome.money),
//                                     SizedBox(width: 8.0),
//                                     Text('Amount: ${order.amount}'),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(FontAwesome.money),
//                                     SizedBox(width: 8.0),
//                                     Text(
//                                         'Status: ${laundry(orderHistory.laundryStatus)}'),
//                                   ],
//                                 ),
//                                 SizedBox(height: 16.0),
//                                 Center(
//                                   child: ElevatedButton(
//                                     onPressed: () {
//                                       showDialog(
//                                         context: context,
//                                         builder: (BuildContext context) {
//                                           return UpdateLaundryStatus(
//                                             orderId: order.id,
//                                           ); // Use the UpdateDialog widget as the content of the dialog.
//                                         },
//                                       );
//                                     },
//                                     child: Text('View status'),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     } else {
//                       return SizedBox();
//                     }
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class ShimmerLoadingItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       child: Card(
//         elevation: 3,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Shimmer.fromColors(
//             baseColor: Colors.grey[300]!, // Color when shimmering
//             highlightColor:
//                 Colors.grey[100]!, // Highlight color when shimmering
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ShimmerLoadingRow(),
//                 SizedBox(height: 8.0),
//                 ShimmerLoadingRow(),
//                 ShimmerLoadingRow(),
//                 ShimmerLoadingRow(),
//                 ShimmerLoadingRow(),
//                 SizedBox(height: 16.0),
//                 Center(
//                   child: Shimmer.fromColors(
//                     baseColor: Colors.blue, // Color when shimmering
//                     highlightColor:
//                         Colors.lightBlue, // Highlight color when shimmering
//                     child: Container(
//                       width: 100,
//                       height: 40,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Create a custom loading row widget
// class ShimmerLoadingRow extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Shimmer.fromColors(
//           baseColor: Colors.grey[300]!, // Color when shimmering
//           highlightColor: Colors.grey[100]!, // Highlight color when shimmering
//           child: Icon(FontAwesome.calendar),
//         ),
//         SizedBox(width: 8.0),
//         Shimmer.fromColors(
//           baseColor: Colors.grey[300]!, // Color when shimmering
//           highlightColor: Colors.grey[100]!, // Highlight color when shimmering
//           child: Container(
//             width: 100,
//             height: 20,
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:laundry_middle_transportation/dashboard.dart';
import 'package:laundry_middle_transportation/model/order_history_model.dart';
import 'package:laundry_middle_transportation/model/order_model.dart';
import 'package:laundry_middle_transportation/presentation/screens/laundry_dashboard.dart';
import 'package:laundry_middle_transportation/presentation/screens/update_laundry_status.dart';
import 'package:laundry_middle_transportation/repository/order_api.dart';
import 'package:intl/intl.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:laundry_middle_transportation/presentation/screens/update_dialog.dart';

class OrderByLaundryStore extends StatefulWidget {
  String? laundryStoreID;

  OrderByLaundryStore({required this.laundryStoreID});
  @override
  State<OrderByLaundryStore> createState() => _OrderListState();
}

class _OrderListState extends State<OrderByLaundryStore> {
  Map<String, int> selectedStatusMap = {};
  late OrderApi orderApi = OrderApi();
  late Future<List<Order>> futureOrders;

  @override
  void initState() {
    super.initState();
    futureOrders = Future.delayed(Duration(seconds: 2), () {
      return fetchOrderData();
    });
  }

  Future<List<Order>> fetchOrderData() async {
    final allOrders = await orderApi.fetchOrder();
    // final laundryStoreOrders = allOrders
    //     .where((order) => order.laundryStoreID == widget.laundryStoreID)
    //     .toList();
    // return laundryStoreOrders;
    List<Order> laundryStoreOrders = [];
    await Future.forEach(allOrders, (Order order) async {
      OrderHistory orderHistory = await orderApi.fetchOrderHistory(order.id);
      if (orderHistory.deliveryStatus == 2) {
        if (order.laundryStoreID == widget.laundryStoreID) {
          laundryStoreOrders.add(order);
        }
      }
    });

    return laundryStoreOrders;
  }

  Future<OrderHistory> fetchOrderHistory(String orderID) async {
    return orderApi.fetchOrderHistory(orderID);
  }

  String laundry(int value) {
    switch (value) {
      case 0:
        return 'Pending';
      case 1:
        return 'Washing';
      default:
        return 'Finished';
    }
  }

  String delivery(int value) {
    switch (value) {
      case 0:
        return 'Pending';
      case 1:
        return 'DeliveringLaundry';
      case 2:
        return 'ReachedLaundry';
      case 3:
        return 'DeliveringCustomer';
      case 4:
        return 'ReachedCustomer';
      default:
        return 'Delivered';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Text('OrderList'),
      ),
      body: FutureBuilder<List<Order>>(
        // Wrap the FutureBuilder in a Shimmer effect
        future: futureOrders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!, // Color when shimmering
              highlightColor:
                  Colors.grey[100]!, // Highlight color when shimmering
              child: ListView.builder(
                itemCount: 5, // Number of shimmering items
                itemBuilder: (context, index) {
                  return ShimmerLoadingItem(); // A custom loading item
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders available.'));
          } else {
            return ListView.separated(
              padding: EdgeInsets.all(16.0),
              separatorBuilder: (context, index) => SizedBox(height: 16.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final order = snapshot.data![index];
                final formattedOrderDate = DateFormat('MMM d, yyyy HH:mm')
                    .format(DateTime.parse(order.orderDate));
                return FutureBuilder<OrderHistory>(
                  future: fetchOrderHistory(order.id),
                  builder: (context, historySnapshot) {
                    if (historySnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (historySnapshot.hasError) {
                      return Text(
                          'Error fetching OrderHistory: ${historySnapshot.error}');
                    } else if (historySnapshot.hasData) {
                      final OrderHistory orderHistory = historySnapshot.data!;
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(FontAwesome.calendar),
                                    SizedBox(width: 8.0),
                                    Text(
                                      'Order Date: $formattedOrderDate',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                // Row(
                                //   children: [
                                //     Icon(FontAwesome.credit_card),
                                //     SizedBox(width: 8.0),
                                //     Text(
                                //       'Status: ${laundryStatus(order)}',
                                //     ),
                                //   ],
                                // ),
                                Row(
                                  children: [
                                    Icon(FontAwesome.map_marker),
                                    SizedBox(width: 8.0),
                                    Text('Address: ${order.address}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(FontAwesome.money),
                                    SizedBox(width: 8.0),
                                    Text('Amount: ${order.amount}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(FontAwesome.money),
                                    SizedBox(width: 8.0),
                                    Text(
                                        'Laundry Status: ${laundry(orderHistory.laundryStatus)}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(FontAwesome.money),
                                    SizedBox(width: 8.0),
                                    Text(
                                        'Delivery Status: ${delivery(orderHistory.deliveryStatus)}'),
                                  ],
                                ),
                                SizedBox(height: 16.0),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return UpdateLaundryStatus(
                                            orderId: order.id,
                                            currentStatus:
                                                orderHistory.laundryStatus,
                                            onStatusUpdated: () {
                                              // Callback to reload the card widget
                                              setState(() {});
                                            },
                                          ); // Use the UpdateDialog widget as the content of the dialog.
                                        },
                                      );
                                    },
                                    child: Text('View status'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class ShimmerLoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!, // Color when shimmering
            highlightColor:
                Colors.grey[100]!, // Highlight color when shimmering
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLoadingRow(),
                SizedBox(height: 8.0),
                ShimmerLoadingRow(),
                ShimmerLoadingRow(),
                ShimmerLoadingRow(),
                ShimmerLoadingRow(),
                SizedBox(height: 16.0),
                Center(
                  child: Shimmer.fromColors(
                    baseColor: Colors.blue, // Color when shimmering
                    highlightColor:
                        Colors.lightBlue, // Highlight color when shimmering
                    child: Container(
                      width: 100,
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Create a custom loading row widget
class ShimmerLoadingRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!, // Color when shimmering
          highlightColor: Colors.grey[100]!, // Highlight color when shimmering
          child: Icon(FontAwesome.calendar),
        ),
        SizedBox(width: 8.0),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!, // Color when shimmering
          highlightColor: Colors.grey[100]!, // Highlight color when shimmering
          child: Container(
            width: 100,
            height: 20,
          ),
        ),
      ],
    );
  }
}
