import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsUtils {
  NotificationsUtils._();

  static NotificationsUtils? _instance;
  static NotificationsUtils get instance =>
      _instance ??= NotificationsUtils._();

  Future<void> checkForNewNotifications(
    Function(RemoteMessage?) onNotificationFound,
  ) async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      return onNotificationFound(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(onNotificationFound);
  }
}
