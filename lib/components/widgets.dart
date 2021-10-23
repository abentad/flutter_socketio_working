import 'package:flutter/material.dart';

class ConversationWidget extends StatelessWidget {
  const ConversationWidget({
    Key? key,
    required this.size,
    required this.userName,
    required this.message,
    required this.time,
    this.newMessagesNumber = 0,
  }) : super(key: key);

  final Size size;
  final String userName;
  final String message;
  final String time;
  final int newMessagesNumber;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('tapped on conversation');
      },
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
                        ),
                        SizedBox(width: size.width * 0.04),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userName, style: const TextStyle(fontSize: 18.0)),
                            SizedBox(height: size.height * 0.01),
                            Text(message, style: const TextStyle(fontSize: 16.0, color: Colors.grey)),
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
