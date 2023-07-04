import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static const route = "/notification-screen";

  @override
  Widget build(BuildContext context) {
    final message = Get.arguments["message"];

    return Scaffold(
  body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(message.notification?.title??""),
      Text(message.notification?.body??""),
    ],
  ),
    );
  }
}
