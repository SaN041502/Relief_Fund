import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AllNotification {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  // ignore: prefer_final_fields
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  //initialize
  Future<void> initNotification() async {
    if (_isInitialized) return;

    const initSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const initSettings = InitializationSettings(android: initSettingsAndroid);

    await notificationPlugin.initialize(initSettings);
  }

  //notification details
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notifications',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }

  //notification main
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationPlugin.show(id, title, body, notificationDetails());
  }
}
