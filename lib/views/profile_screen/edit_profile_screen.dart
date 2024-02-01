import 'package:flutter/material.dart';
import 'package:online_bazar_seller/const/colors.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/widgets/custom_textfield.dart';

import '../widgets/text_style.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldtext(text: "Edit Profile", color: white, size: 16.0),
        actions: [
          TextButton(
              onPressed: () {}, child: normalText(text: "Save", color: white)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Image.asset(
            imgProduct,
            width: 150,
          ).box.roundedFull.clip(Clip.antiAlias).make(),
          15.heightBox,
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: white),
              onPressed: () {},
              child: normalText(text: "Change Image", color: fontGrey)),
          10.heightBox,
          const Divider(),
          10.heightBox,
          customTextField(label: "User Name", hint: "eg. sova "),
          customTextField(label: " Password", hint: "**********"),
          customTextField(label: "Confirm Password", hint: "**********"),
        ]),
      ),
    );
  }
}
