class Order {
  final String id;
  final String orderDate;
  final String expectedFinishDate;
  final int amount;
  final double totalPrice;
  final String address;
  final int paymentType;
  final String laundryStoreID;
  final String? staffID;

  Order({
    required this.id,
    required this.orderDate,
    required this.expectedFinishDate,
    required this.amount,
    required this.totalPrice,
    required this.address,
    required this.paymentType,
    required this.laundryStoreID,
    required this.staffID,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      orderDate: json['orderDate'],
      expectedFinishDate: json['expectedFinishDate'],
      amount: json['amount'],
      totalPrice: json['totalPrice'],
      address: json['address'],
      paymentType: json['paymentType'],
      laundryStoreID: json['laundryStoreID'],
      staffID: json['staffID'],
    );
  }
}
