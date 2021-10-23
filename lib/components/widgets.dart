import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

class ConversationWidget extends StatelessWidget {
  const ConversationWidget({
    Key? key,
    required this.size,
    required this.userName,
    required this.message,
    required this.time,
    this.newMessagesNumber = 0,
    required this.ontap,
  }) : super(key: key);

  final Size size;
  final String userName;
  final String message;
  final String time;
  final int newMessagesNumber;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02),
            Container(
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28.0,
                          backgroundColor: Colors.grey.shade200,
                          child: Text(userName[0].capitalize.toString(), style: const TextStyle(color: Colors.teal, fontSize: 26.0, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(width: size.width * 0.04),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userName.capitalize.toString(), style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
                            SizedBox(height: size.height * 0.01),
                            Text(message, style: const TextStyle(fontSize: 14.0, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(time, style: const TextStyle(fontSize: 12.0, color: Colors.grey)),
                      SizedBox(height: size.height * 0.01),
                      CircleAvatar(
                        radius: 12.0,
                        backgroundColor: newMessagesNumber == 0 ? Colors.transparent : Colors.black,
                        child: Text(newMessagesNumber.toString(), style: const TextStyle(fontSize: 14.0, color: Colors.white)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.hintText, required this.controller}) : super(key: key);

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      style: const TextStyle(fontSize: 22.0),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        filled: true,
        fillColor: const Color(0xfff2f2f2),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 16.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: const BorderSide(color: Color(0xfff2f2f2))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: const BorderSide(color: Color(0xfff2f2f2))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: const BorderSide(color: Color(0xfff2f2f2))),
      ),
    );
  }
}

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({Key? key, required this.btnLabel, required this.onPressed}) : super(key: key);

  final String btnLabel;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: onPressed,
        height: 50.0,
        minWidth: double.infinity,
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Text(btnLabel, style: const TextStyle(color: Colors.white, fontSize: 16.0)),
      ),
    );
  }
}
