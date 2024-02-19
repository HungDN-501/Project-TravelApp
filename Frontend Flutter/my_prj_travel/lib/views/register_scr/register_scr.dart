import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prj_travel/bloc/bloc_account/account_bloc.dart';
import 'package:my_prj_travel/theme/app_color.dart';
import 'package:my_prj_travel/views/login_scr/login_screen.dart';
import 'package:my_prj_travel/widgets/app_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

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
          builder: (BuildContext context, AccountState state) {
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
                        height: 150,
                        fit: BoxFit.cover,
                        image:
                            const AssetImage("assets/images/img_register.png"),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Register",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppTextField(
                            prefix: const Icon(Icons.person_outline),
                            hint: "Username",
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            controller: userNameController,
                          ),
                          const SizedBox(height: 24),
                          AppTextField(
                            prefix: const Icon(Icons.alternate_email_rounded),
                            hint: "Email Address",
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            controller: emailController,
                          ),
                          const SizedBox(height: 24),
                          AppTextField(
                            prefix: const Icon(Icons.phone_outlined),
                            keyboardType: TextInputType.number,
                            hint: "Phone Number",
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            controller: phoneController,
                          ),
                          const SizedBox(height: 24),
                          AppTextField(
                            obscureText: true,
                            prefix: const Icon(Icons.lock_outline_rounded),
                            suffix: const Icon(Icons.remove_red_eye_outlined),
                            hint: "Password",
                            textInputAction: TextInputAction.done,
                            controller: passController,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.titleMedium,
                              children: [
                                const TextSpan(
                                  text: "By signing up, you're agree to our ",
                                ),
                                TextSpan(
                                  text: "Term & Condition",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: AppColor.blue_2,
                                      ),
                                ),
                                const TextSpan(
                                  text: " and ",
                                ),
                                TextSpan(
                                  text: "privacy Policy",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: AppColor.blue_2,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 64,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle Register
                                if (emailController.text.trim().isEmpty ||
                                    passController.text.trim().isEmpty ||
                                    userNameController.text.trim().isEmpty ||
                                    phoneController.text.trim().isEmpty) {
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
                                  context.read<AccountBloc>().add(
                                        RegisterFetched(
                                          email: emailController.text.trim(),
                                          password: passController.text.trim(),
                                          username:
                                              userNameController.text.trim(),
                                          phone: int.parse(
                                            phoneController.text.trim(),
                                          ),
                                        ),
                                      );
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        AppColor.blue_2),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Register",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: AppColor.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                );
              },
            );
          },
          listener: (BuildContext context, AccountState state) async {
            if (state is RegisterSuccess) {
              if (state.resultModel.Status == 1) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Create account success'),
                    content: const Text(
                        'Congratulations, you have successfully created an account'),
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
