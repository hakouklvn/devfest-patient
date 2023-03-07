import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificatioService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  void displayNotification(String title, String body) async {
    // BigPictureStyleInformation bigPicture = const BigPictureStyleInformation(
    //   DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
    //   largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
    //   contentTitle: "Demo image notification",
    //   summaryText: "This is some text",
    //   htmlFormatTitle: true,
    //   htmlFormatContent: true,
    //   htmlFormatContentTitle: true,
    //   htmlFormatSummaryText: true,
    // );

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'guelfen.hakoudev.myhanuut.audio',
      'my_hanuut',
      channelDescription: 'my_hanuut',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
      enableLights: true,
      colorized: true,
      fullScreenIntent: true,

      // ticker: 'ticker',
      // color: Colors.blue,
      // icon: "@mipmap/ic_launcher",
      // channelShowBadge: true,
      // largeIcon: const FilePathAndroidBitmap("@mipmap/ic_launcher"),
      // styleInformation: bigPicture,
      // subText: "Playing on this phone",
      // tag: "hola",
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }
}
