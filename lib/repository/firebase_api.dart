import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  //create an istance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //function to initialize notifications
  Future<void> initNotificaiton() async {
    await _firebaseMessaging.requestPermission();

    final fcmToken = await _firebaseMessaging.getToken();
    print('Token:  $fcmToken');
  }
}
