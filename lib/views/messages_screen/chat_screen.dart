import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar_seller/const/colors.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/controller/chart_controller.dart';
import 'package:online_bazar_seller/views/messages_screen/components/chat_bubble.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

import '../../services/store_services.dart';
import '../widgets/loading_indicator.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatsController());
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.arrow_back, color: darkGrey,),
        title: boldtext(
            text: "${controller.friendName}", size: 16.0, color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          //all the chats messages -------------------------
          Obx(
            () => controller.isLoading.value
                ? loadingIndicator()
                : Expanded(
                    child: StreamBuilder(
                    stream: StoreServices.getChatmessages(
                        controller.chatDocId.toString()),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: loadingIndicator());
                      } else if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: "Send a message".text.make(),
                        );
                      } else {
                        return ListView(
                          children:
                              //chat bubble----------------------
                              snapshot.data!.docs
                                  .mapIndexed((currentValue, index) {
                            var data = snapshot.data!.docs[index];
                            return Align(
                                alignment: data['uid'] == currentUser!.uid
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: chatBubble(data));
                          }).toList(),
                        );
                      }
                    },
                  )
                    // child: ListView.builder(
                    //   itemCount: 20,
                    //   itemBuilder: (context, index) {
                    //     return chatBubble();
                    //   },
                    // ),
                    ),
          ),
          10.heightBox,
          //muni ko text field-------------
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.msgController,
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: "Enter message",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: purpleColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: purpleColor),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      controller.sendMsg(controller.msgController.text);
                      controller.msgController.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: purpleColor,
                    ))
              ],
            ).box.make(),
          )
        ]),
      ),
    );
  }
}
