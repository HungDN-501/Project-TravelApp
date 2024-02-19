import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:my_prj_travel/notification/notifi_controller.dart';

void main() async {
  await AwesomeNotifications().initialize(
    null,
    // Danh sách NotificationChannel
    [
      NotificationChannel(
        channelGroupKey: "basic_channel_group",
        channelKey: "basic_channel",
        channelName: "Basic Notification",
        channelDescription: "Notification change",
      ),
      NotificationChannel(
        channelGroupKey: "basic_channel_group",
        channelKey: "noti_init",
        channelName: "Notification Initial",
        channelDescription: "Notification change",
      ),
    ],
    // Danh sách nhóm NotificationChannel
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: "basic_channel_group",
        channelGroupName: "Basic Group",
      ),
    ],
  );

  // Kiểm tra xem đã được cấp quyền gửi thông báo
  bool isAllowedToSendNotificastion =
      await AwesomeNotifications().isNotificationAllowed();

  // Nếu chưa có quyền thì yêu cầu cho phép quyền
  if (!isAllowedToSendNotificastion) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // gọi phương thức setListeners thiết lập cho các sự kiện liên quan đến thông báo
    AwesomeNotifications().setListeners(
      // xử lý khi một hành động trên thông báo được nhận
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      // xử lý khi một thông báo được tạo.
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      // xử lý khi một thông báo được hiển thị.
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      // xử lý khi một hành động "bỏ qua" trên thông báo được nhận.
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: "noti_init",
        title: "Notifition Initial",
        body: "Okey my notification",
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Tạo thông báo
            AwesomeNotifications().createNotification(
              content: NotificationContent(
                id: 2,
                channelKey: "basic_channel",
                title: "Hello world!",
                body: "Okey my notification",
              ),
            );
          },
          child: const Icon(Icons.notification_add),
        ),
      ),
    );
  }
}
