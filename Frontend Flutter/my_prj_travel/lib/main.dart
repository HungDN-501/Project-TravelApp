import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prj_travel/bloc/bloc_account/account_bloc.dart';
import 'package:my_prj_travel/bloc/bloc_bill_booking/bill_booking_bloc.dart';
import 'package:my_prj_travel/bloc/bloc_detail_tour/detail_tour_bloc.dart';
import 'package:my_prj_travel/data/data_bill_booking/provider/bill_booking_provider.dart';
import 'package:my_prj_travel/data/data_bill_booking/repository/bill_booking_repository.dart';
import 'package:my_prj_travel/data/data_detail_tour/provider/detail_tour_provider.dart';
import 'package:my_prj_travel/data/data_detail_tour/repository/detail_tour_repository.dart';
import 'package:my_prj_travel/data/data_account/provider/account_provider.dart';
import 'package:my_prj_travel/data/data_account/repository/account_repository.dart';
import 'package:my_prj_travel/routes/app_route.dart';
import 'package:my_prj_travel/routes/app_route_name.dart';
import 'package:my_prj_travel/theme/app_theme.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MultiBlocProvider : cung cap cac Bloc cho toan bo app
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AccountRepository>(
          create: (context) => AccountRepository(
            AccountDataProvider(),
          ),
        ),
        RepositoryProvider<DetailTourRepository>(
          create: (context) => DetailTourRepository(
            DetailTourDataProvider(),
          ),
        ),
        RepositoryProvider<BillBookingRepository>(
          create: (context) => BillBookingRepository(
            BillBokingProvider(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AccountBloc>(
            create: (context) => AccountBloc(context.read<AccountRepository>()),
          ),
          BlocProvider<DetailTourBloc>(
            create: (context) =>
                DetailTourBloc(context.read<DetailTourRepository>()),
          ),
          BlocProvider<BillBookingBloc>(
            create: (context) =>
                BillBookingBloc(context.read<BillBookingRepository>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Travel UI",
          theme: AppTheme.light, // chế độ sáng
          // themeMode: ThemeMode.dark, // chế độ sáng
          // route start screen of app
          initialRoute: AppRouteName.getStarted,
          // when navigator it will check router want to go and execute
          onGenerateRoute: AppRoute.generate,
        ),
      ),
    );
  }
}
