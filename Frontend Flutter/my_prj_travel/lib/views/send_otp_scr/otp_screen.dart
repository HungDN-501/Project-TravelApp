import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_prj_travel/notification/notifi_controller.dart';
import 'package:my_prj_travel/routes/app_route_name.dart';
import 'package:my_prj_travel/theme/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();
  int numberOTP = 0;

  @override
  void initState() {
    super.initState();
    numberOTP = Random().nextInt(8999) + 1000;
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
        title: "OTP from TravelGO",
        body: numberOTP.toString(),
      ),
    );
    print("OTP : $numberOTP");
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return GestureDetector(
      onTap: () {
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.blue_4,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              // Delete Email Reset
              SharedPreferences prefs = await SharedPreferences.getInstance();
              if (prefs.getString('emailResetPass') != null) {
                await prefs.remove('emailResetPass');
              }

              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                bottom: MediaQuery.of(context).padding.bottom,
                left: 24,
                right: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    fit: BoxFit.contain,
                    image: const AssetImage("assets/images/img_otp.png"),
                  ),
                  Text(
                    "Enter OTP",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "An 4 Digit code has been sent to \n +621234857",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 96,
                    child: Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 86,
                            width: 72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color:
                                  AppColor.primarySwatch[50]?.withOpacity(0.5),
                            ),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: TextFormField(
                              controller: otpController1,
                              style: Theme.of(context).textTheme.headlineMedium,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  return;
                                }
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ),
                          Container(
                            height: 86,
                            width: 72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color:
                                  AppColor.primarySwatch[50]?.withOpacity(0.5),
                            ),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: TextFormField(
                              controller: otpController2,
                              style: Theme.of(context).textTheme.headlineMedium,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                  return;
                                }
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ),
                          Container(
                            height: 86,
                            width: 72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color:
                                  AppColor.primarySwatch[50]?.withOpacity(0.5),
                            ),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: TextFormField(
                              controller: otpController3,
                              style: Theme.of(context).textTheme.headlineMedium,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                  return;
                                }
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ),
                          Container(
                            height: 86,
                            width: 72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color:
                                  AppColor.primarySwatch[50]?.withOpacity(0.5),
                            ),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: TextFormField(
                              controller: otpController4,
                              style: Theme.of(context).textTheme.headlineMedium,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                  return;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        numberOTP = Random().nextInt(8999) + 1000;
                        AwesomeNotifications().createNotification(
                          content: NotificationContent(
                            id: 1,
                            channelKey: "noti_init",
                            title: "OTP from TravelGO",
                            body: numberOTP.toString(),
                          ),
                        );
                      });
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't receive code ? ",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.grey),
                          ),
                          TextSpan(
                            text: "Send again!",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: AppColor.blue_1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () {
                        if (otpController1.text.isEmpty ||
                            otpController2.text.isEmpty ||
                            otpController3.text.isEmpty ||
                            otpController4.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColor.caramel_4,
                              content: const Text(
                                "Please enter enough information",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        } else {
                          int textOtp = int.parse(
                              "${otpController1.text}${otpController2.text}${otpController3.text}${otpController4.text}");
                          if (textOtp != numberOTP) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColor.caramel_4,
                                content: const Text(
                                  "Your code OTP not true",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          } else {
                            print("OKEY");
                            Navigator.pushNamed(
                              context,
                              AppRouteName.resetPass,
                            );
                          }
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(AppColor.blue_2),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      child: Text(
                        "Submit",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: AppColor.white,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
