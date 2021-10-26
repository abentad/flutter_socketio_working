import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  Future<void> createBasicNotificaton({required String title, required String body}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel',
      title: title,
      body: body,
      notificationLayout: NotificationLayout.Default,
    ));
  }

  int createUniqueId() {
    return DateTime.now().millisecond;
  }
}
