import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:laundry_middle_transportation/model/order_model.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store'),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Name: ' + dataList[index].name),
            subtitle: Text('Age: ' + dataList[index].age),
          );
        },
      ),
    );
  }
}

class UserModel {
  final String name;
  final String age;

  UserModel(this.name, this.age);
}

List<UserModel> dataList = [
  UserModel('Kyle Tin', '23'),
  UserModel('Thoris Micheal', '30'),
  UserModel('Tom Hank', '42'),
  UserModel('Tin Mimber', '22'),
  UserModel('Donke Jackson', '62'),
  UserModel('Justin Timberlake', '36'),
  // Add more objects as needed
];
