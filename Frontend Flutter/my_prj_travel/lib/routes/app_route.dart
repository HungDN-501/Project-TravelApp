import 'package:flutter/material.dart';
import 'package:my_prj_travel/routes/app_route_name.dart';
import 'package:my_prj_travel/views/bill_src/bill_src.dart';
import 'package:my_prj_travel/views/booking_src/booking_src.dart';
import 'package:my_prj_travel/views/detail_page_scr/detail_scr.dart';
import 'package:my_prj_travel/views/history_scr/history_scr.dart';
import 'package:my_prj_travel/views/home_page_scr/home_scr.dart';
import 'package:my_prj_travel/views/register_scr/register_scr.dart';
import 'package:my_prj_travel/views/intro_scr/intro_scr.dart';
import 'package:my_prj_travel/views/login_scr/login_screen.dart';
import 'package:my_prj_travel/views/reset_pass_scr/reset_pass_scr.dart';
import 'package:my_prj_travel/views/save_location_scr/save_location_scr.dart';
import 'package:my_prj_travel/views/send_otp_scr/otp_screen.dart';

class AppRoute {
  // Func quản lý route của App
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.getStarted:
        return MaterialPageRoute(
          // Màn hình trả về
          builder: (_) => const IntroScreen(),
          settings: settings,
        );

      case AppRouteName.login:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const LoginScreen(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.sendOtp:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const OTPScreen(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.register:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const RegisterScreen(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.resetPass:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const ResetPassword(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.home:
        return MaterialPageRoute(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false,
              );
            });
            return Container(); // Trả về một widget tạm thời
          },
        );

      case AppRouteName.detailBuilding:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailDestinationScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.checkBookInfo:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const BookingScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.bill:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const BillScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.saveLocation:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const SaveLocationScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.history:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const HistoryScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
    }

    return null;
  }
}
