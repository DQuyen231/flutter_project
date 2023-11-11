class OrderHistory {
  final String orderID;
  final int laundryStatus;
  final int deliveryStatus;

  OrderHistory({
    required this.orderID,
    required this.laundryStatus,
    required this.deliveryStatus,
  });

  factory OrderHistory.fromJson(Map<String, dynamic> json) {
    return OrderHistory(
      orderID: json['orderID'],
      laundryStatus: json['laundryStatus'],
      deliveryStatus: json['deliveryStatus'],
    );
  }
}
