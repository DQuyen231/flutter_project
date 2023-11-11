import 'package:flutter/material.dart';
import 'package:laundry_middle_transportation/model/building_model.dart';
import 'package:laundry_middle_transportation/model/staff_trip_model.dart';
import 'package:laundry_middle_transportation/repository/staff_trip_api.dart';

class staffTripWidget extends StatefulWidget {
  @override
  State<staffTripWidget> createState() => _staffTripState();
}

class _staffTripState extends State<staffTripWidget> {
  late staffTripApi sTripAPI = staffTripApi();
  late Future<List<staffTrip>> futureStaffTrip;

  @override
  void initState() {
    super.initState();
    futureStaffTrip = fetchStaffTripData();
  }

  Future<List<staffTrip>> fetchStaffTripData() async {
    return sTripAPI.fetchStaffTrip();
  }

  Future<Building> fetchBuildingData(String buildingID) async {
    return sTripAPI.fetchBuildingById(buildingID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff Trip'),
      ),
      body: FutureBuilder<List<staffTrip>>(
        future: futureStaffTrip,
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
                final staffTrip = snapshot.data![index];
                return FutureBuilder<Building>(
                  future: fetchBuildingData(staffTrip.buildingID),
                  builder: (context, buildingSnapshot) {
                    if (buildingSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return ListTile(
                        title: Text('Trip collect: ${staffTrip.tripCollect}'),
                        subtitle: Text('Fetching building data...'),
                      );
                    } else if (buildingSnapshot.hasError) {
                      return ListTile(
                        title: Text('Trip collect: ${staffTrip.tripCollect}'),
                        subtitle: Text(
                            'Error fetching building data: ${buildingSnapshot.error}'),
                      );
                    } else if (buildingSnapshot.hasData) {
                      final Building building = buildingSnapshot.data!;
                      return ListTile(
                        title: Text('Trip ID: ${staffTrip.id}'),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Fee:  ${staffTrip.tripCollect}'),
                              Text('Building Name: ${building.name}'),
                              Text('Address: ${building.address}'),
                              Text(
                                  'Type: ${staffTrip.tripType == 0 ? 'Nhận order từ khách hàng' : staffTrip.tripType == 1 ? 'Giao sản phẩm cho khách hàng' : 'Unknown'}'),
                            ]),
                      );
                    }
                    return Container(); // Handle other cases as needed
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
