import 'package:firebase_messaging/firebase_messaging.dart';

class FireBaseMessaging {
  Future<String> initClientFirst() async {
    print("getting cvalled");
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    final notificationSettings =
        await FirebaseMessaging.instance.requestPermission(provisional: true);
    final apnsToken = await FirebaseMessaging.instance.getAPNSToken();

    return apnsToken ?? "";
  }

  void initClient() async {
    print("done");
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
}
