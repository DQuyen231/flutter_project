import 'package:flutter/material.dart';
import 'package:laundry_middle_transportation/model/building_model.dart';
import 'package:laundry_middle_transportation/repository/building_api.dart';
import 'package:laundry_middle_transportation/repository/staff_trip_api.dart';

class buildingWidget extends StatefulWidget {
  @override
  State<buildingWidget> createState() => _buildingState();
}

class _buildingState extends State<buildingWidget> {
  late buildingApi bApi = new buildingApi();
  late Future<List<Building>> futureBuilding;

  @override
  void initState() {
    super.initState();
    futureBuilding = fetchOrderData();
  }

  Future<List<Building>> fetchOrderData() async {
    return bApi.fetchBuilding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Building'),
      ),
      body: FutureBuilder<List<Building>>(
        future: futureBuilding,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final Building = snapshot.data![index];
                return ListTile(
                  title: Text('Trip collect: ${Building.id}'),
                  subtitle: Text('Address: \$${Building.address}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
