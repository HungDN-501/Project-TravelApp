import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prj_travel/bloc/bloc_account/account_bloc.dart';
import 'package:my_prj_travel/theme/app_color.dart';
import 'package:my_prj_travel/views/login_scr/login_screen.dart';
import 'package:my_prj_travel/widgets/app_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();

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
            onPressed: () {
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
        body: BlocConsumer<AccountBloc, AccountState>(
          builder: (context, state) {
            return ListView.builder(
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
                        height: 300,
                        fit: BoxFit.contain,
                        image: const AssetImage(
                            "assets/images/img_reset_password.png"),
                      ),
                      Text(
                        "Reset\nPassword",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppTextField(
                            obscureText: true,
                            prefix: const Icon(Icons.lock_outline_rounded),
                            hint: "New Password",
                            suffix: const Icon(Icons.remove_red_eye_outlined),
                            textInputAction: TextInputAction.done,
                            controller: passController,
                          ),
                          const SizedBox(height: 24),
                          AppTextField(
                            obscureText: true,
                            prefix: const Icon(Icons.lock_outline_rounded),
                            hint: "Confirm new Password",
                            suffix: const Icon(Icons.remove_red_eye_outlined),
                            textInputAction: TextInputAction.done,
                            controller: passConfirmController,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 64,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (passController.text.trim().isEmpty ||
                                passConfirmController.text.trim().isEmpty) {
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
                              if (passController.text.trim() !=
                                  passConfirmController.text.trim()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: AppColor.caramel_4,
                                    content: const Text(
                                      "Confirm new Password not true",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                              } else {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();

                                // ignore: use_build_context_synchronously
                                context.read<AccountBloc>().add(
                                      ResetPassFetched(
                                        email: prefs
                                            .getString('emailResetPass')!
                                            .trim(),
                                        newPass: passController.text.trim(),
                                      ),
                                    );
                              }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                AppColor.blue_2),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                                .copyWith(color: AppColor.white),
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
            );
          },
          listener: (BuildContext context, AccountState state) {
            if (state is ResetPassSuccess) {
              if (state.resultModel.Status == 1) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Reset password success'),
                    content: const Text(
                        'Congratulations, you have successfully reset password'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (Route<dynamic> route) => false,
                        ),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              } else if (state.resultModel.Status == -1) {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColor.caramel_4,
                    content: Text(
                      state.resultModel.Message,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              } else {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Error not undefined",
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
