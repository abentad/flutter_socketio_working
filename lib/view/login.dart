import 'package:chatapp_socketio/components/widgets.dart';
import 'package:chatapp_socketio/controller/user_controller.dart';
import 'package:chatapp_socketio/view/conversations_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController _usernameController = TextEditingController();

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
                if (_usernameController.text != "") {
                  bool _result = await Get.find<UserController>().login(_usernameController.text);
                  if (_result) {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => const ConversatoinsScreen()));
                  }
                } else if (_usernameController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Fill username', style: TextStyle(color: Colors.black)), backgroundColor: Colors.white),
                  );
                }
              },
              btnLabel: "Login",
            ),
            SizedBox(height: size.height * 0.02),
            const Center(child: Text('or', style: TextStyle(fontSize: 16.0))),
            SizedBox(height: size.height * 0.02),
            CustomMaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              btnLabel: "Sign up",
            ),
          ],
        ),
      ),
    );
  }
}
