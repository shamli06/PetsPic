import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:petspic/main.dart';
import 'package:get/get.dart';
import 'package:petspic/repository/push_notification_screen.dart';

import '../routes/routes.dart';

class FirebasePushNotification{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> handleBackgroundMessage(RemoteMessage message)async{
    print("Title : ${message.notification!.title}");
    print("Body : ${message.notification!.body}");
    print("Payload : ${message.data}");
  }

  handleMessage(RemoteMessage? message){
    if(message == null) return;

    navigatorKey.currentState?.pushNamed(NotificationScreen.route,
    arguments: message);
    Get.offNamed(Routes.pushNotification,arguments: {"message":message});

  }

  Future initPushNotifications()async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,badge: true,sound: true
    );

    FirebaseMessaging.instance.getInitialMessage().then((handleMessage));
    FirebaseMessaging.onMessageOpenedApp.listen((handleMessage));
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  initNotification()async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("Token $fCMToken");
   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
   initPushNotifications();
  }
}