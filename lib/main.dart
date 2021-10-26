import 'dart:typed_data';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:chatapp_socketio/controller/chat_controller.dart';
import 'package:chatapp_socketio/controller/notification_controller.dart';
import 'package:chatapp_socketio/controller/user_controller.dart';
import 'package:chatapp_socketio/view/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
    'resource://drawable/res_notification',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Channel',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        ledColor: Colors.purple,
        vibrationPattern: Int64List.fromList([1, 2, 3]),
      ),
    ],
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  Get.put(ChatController());
  Get.put(UserController());
  Get.put(NotificationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat app',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.teal,
      ),
      home: const AuthenticationScreen(),
    );
  }
}
