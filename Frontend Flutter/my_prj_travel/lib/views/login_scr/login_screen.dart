import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prj_travel/bloc/bloc_account/account_bloc.dart';
import 'package:my_prj_travel/routes/app_route_name.dart';
import 'package:my_prj_travel/theme/app_color.dart';
import 'package:my_prj_travel/widgets/app_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
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
        extendBodyBehindAppBar: true,
        // BlocConsumer : lắng nghe và cập nhật giao diện người dùng dựa trên trạng thái của Bloc
        body: BlocConsumer<AccountBloc, AccountState>(
          listener: (BuildContext context, AccountState state) async {
            if (state is LoginSuccess) {
              if (state.loginModel.Status == 1) {
                // Save in SharedPreferences
                final SharedPreferences prefsStatus =
                    await SharedPreferences.getInstance();
                prefsStatus.setInt('status', state.loginModel.Status);

                final SharedPreferences prefsUserName =
                    await SharedPreferences.getInstance();
                prefsUserName.setString('userName', state.loginModel.UserName!);

                final SharedPreferences prefsAccountID =
                    await SharedPreferences.getInstance();
                prefsAccountID.setInt('accountID', state.loginModel.AccountID!);

                final SharedPreferences prefsAvatar =
                    await SharedPreferences.getInstance();
                prefsAvatar.setString('avatar', state.loginModel.Avatar!);

                final SharedPreferences prefsEmail =
                    await SharedPreferences.getInstance();
                prefsEmail.setString('email', state.loginModel.Email!);

                // ignore: use_build_context_synchronously
                Navigator.pushNamed(
                  context,
                  AppRouteName.home,
                );
              } else if (state.loginModel.Status == -1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColor.caramel_4,
                    content: Text(
                      state.loginModel.Error!,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Error not undefined",
                    ),
                  ),
                );
              }
            }

            if (state is CheckEmailSuccess) {
              if (state.resultModel.Status == 1) {
                final SharedPreferences prefsEmailResetPass =
                    await SharedPreferences.getInstance();
                prefsEmailResetPass.setString(
                  'emailResetPass',
                  textEditingControllerEmail.text.trim(),
                );

                // ignore: use_build_context_synchronously
                Navigator.pushNamed(
                  context,
                  AppRouteName.sendOtp,
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
          builder: (context, state) {
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    bottom: 15,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        fit: BoxFit.contain,
                        image: const AssetImage("assets/images/img_login.png"),
                      ),
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppTextField(
                            controller: textEditingControllerEmail,
                            prefix: const Icon(Icons.alternate_email_rounded),
                            hint: "Email Address",
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                          ),
                          const SizedBox(height: 24),
                          AppTextField(
                            controller: textEditingControllerPassword,
                            obscureText: true,
                            prefix: const Icon(Icons.lock_outline_rounded),
                            suffix: const Icon(Icons.remove_red_eye_outlined),
                            hint: "Password",
                            textInputAction: TextInputAction.done,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Handle Forgot Pass
                            if (textEditingControllerEmail.text
                                .trim()
                                .isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColor.caramel_4,
                                  content: const Text(
                                    "Please enter your email before",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            } else {
                              context.read<AccountBloc>().add(
                                    CheckEmailFetched(
                                      email: textEditingControllerEmail.text
                                          .trim(),
                                    ),
                                  );
                            }
                          },
                          child: Text(
                            "Forgot Password ?",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 64,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle Login
                            context.read<AccountBloc>().add(
                                  LoginFetched(
                                    email:
                                        textEditingControllerEmail.text.trim(),
                                    password: textEditingControllerPassword.text
                                        .trim(),
                                  ),
                                );
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
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: AppColor.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              "OR",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 64,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                AppColor.blue_3),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          icon: const Image(
                            image: AssetImage("assets/images/ic_google.png"),
                            width: 32,
                            height: 32,
                          ),
                          label: Text(
                            "Login with Google",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: AppColor.blue_2),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an Account? ",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              TextSpan(
                                text: "Register here!",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: AppColor.blue_2),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRouteName.register,
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
