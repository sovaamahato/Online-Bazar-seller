import 'package:flutter/material.dart';
import 'package:online_bazar_seller/const/colors.dart';
import 'package:online_bazar_seller/views/widgets/custom_textfield.dart';

import '../widgets/text_style.dart';

class ShopSettings extends StatelessWidget {
  const ShopSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldtext(text: "Shop Settings", color: white, size: 16.0),
        actions: [
          TextButton(
              onPressed: () {}, child: normalText(text: "Save", color: white)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          customTextField(label: "Shop Name ", hint: "eg. vendor name"),
          customTextField(label: "Shop Address ", hint: "eg. "),
          customTextField(label: "Mobile ", hint: "89"),
          customTextField(label: "Shop website ", hint: "www.shop.com"),
          customTextField(
              label: "Description", hint: "Shop details", isDesc: true)
        ]),
      ),
    );
  }
}
