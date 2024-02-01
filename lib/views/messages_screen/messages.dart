import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar_seller/const/colors.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/messages_screen/chat_screen.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldtext(text: "messages", color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
              (index) => ListTile(
                onTap: () {
                  Get.to(() => ChatScreen());
                },
                leading: const CircleAvatar(
                  backgroundColor: purpleColor,
                  child: Icon(
                    Icons.person,
                    color: white,
                  ),
                ),
                title: boldtext(text: 'Username ', color: fontGrey),
                subtitle: normalText(text: "last messgage ", color: darkGrey),
                trailing: normalText(text: "10:43", color: darkGrey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
