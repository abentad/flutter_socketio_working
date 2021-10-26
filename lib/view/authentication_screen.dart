import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:chatapp_socketio/components/widgets.dart';
import 'package:chatapp_socketio/controller/user_controller.dart';
import 'package:chatapp_socketio/view/conversations_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Allow Notifications"),
            content: const Text('Our app would like to send you notifications.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Don\t Allow', style: TextStyle(color: Colors.grey, fontSize: 18.0)),
              ),
              TextButton(
                onPressed: () => AwesomeNotifications().requestPermissionToSendNotifications().then((_) => Navigator.pop(context)),
                child: const Text('Allow', style: TextStyle(color: Colors.teal, fontSize: 18.0, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Text('AB chat', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600))),
            SizedBox(height: size.height * 0.1),
            CustomTextFormField(hintText: "Username", controller: _usernameController),
            SizedBox(height: size.height * 0.02),
            CustomMaterialButton(
              onPressed: () async {
                FocusScope.of(context).unfocus();
                if (_usernameController.text != "") {
                  bool _result = await Get.find<UserController>().signUp(_usernameController.text);
                  if (_result) {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => ConversatoinsScreen()));
                  }
                } else if (_usernameController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Fill username', style: TextStyle(color: Colors.black)), backgroundColor: Colors.white),
                  );
                }
              },
              btnLabel: "Sign up",
            ),
            SizedBox(height: size.height * 0.02),
            const Center(child: Text('or', style: TextStyle(fontSize: 16.0))),
            SizedBox(height: size.height * 0.02),
            CustomMaterialButton(
              onPressed: () async {
                FocusScope.of(context).unfocus();
                if (_usernameController.text != "") {
                  bool _result = await Get.find<UserController>().login(_usernameController.text);
                  if (_result) {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => ConversatoinsScreen()));
                  }
                } else if (_usernameController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Fill username', style: TextStyle(color: Colors.black)), backgroundColor: Colors.white),
                  );
                }
              },
              btnLabel: "Login",
            ),
          ],
        ),
      ),
    );
  }
}
