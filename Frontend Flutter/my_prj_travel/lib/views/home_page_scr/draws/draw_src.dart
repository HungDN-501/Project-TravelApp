import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_prj_travel/routes/app_route_name.dart';
import 'package:my_prj_travel/theme/app_color.dart';
import 'package:my_prj_travel/views/login_scr/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawScreen extends StatelessWidget {
  final String avatar;
  final String userName;
  final String email;
  const DrawScreen(
      {super.key,
      required this.avatar,
      required this.userName,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.blue_4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              userName,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            ),
            accountEmail: Text(
              email,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.green,
              backgroundImage: NetworkImage(avatar),
            ),
            currentAccountPictureSize: const Size.square(80),
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              image: DecorationImage(
                image: AssetImage('assets/images/bgr_avatar.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              size: 30,
            ),
            title: const Text("Account"),
            onTap: () {},
          ),
          const Divider(
            height: 3,
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications,
              size: 30,
            ),
            title: const Text("Notifications"),
            onTap: () {},
          ),
          const Divider(
            height: 3,
            color: Colors.grey,
          ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.settings,
          //     size: 30,
          //   ),
          //   title: const Text("Settings"),
          //   onTap: () {},
          // ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              size: 30,
            ),
            title: const Text("Logout"),
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('LOGOUT'),
                  content: const Text("Do you want to log out ?"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        final SharedPreferences prefsStatus =
                            await SharedPreferences.getInstance();
                        await prefsStatus.remove('status');

                        final SharedPreferences prefsUserName =
                            await SharedPreferences.getInstance();
                        await prefsUserName.remove('userName');

                        final SharedPreferences prefsAccountID =
                            await SharedPreferences.getInstance();
                        await prefsAccountID.remove('accountID');

                        final SharedPreferences prefsAvatar =
                            await SharedPreferences.getInstance();
                        await prefsAvatar.remove('avatar');

                        final SharedPreferences prefsEmail =
                            await SharedPreferences.getInstance();
                        await prefsEmail.remove('email');

                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
          const Divider(
            height: 3,
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.bookmark_fill,
              size: 30,
            ),
            title: const Text("Save locations"),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRouteName.saveLocation,
              );
            },
          ),
          const Divider(
            height: 3,
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(
              Icons.history,
              size: 30,
            ),
            title: const Text("History"),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRouteName.history,
              );
            },
          ),
        ],
      ),
    );
  }
}
