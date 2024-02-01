import 'package:flutter/material.dart';
import 'package:online_bazar_seller/const/colors.dart';
import 'package:online_bazar_seller/views/widgets/custom_textfield.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldtext(
          text: "Add product",
          color: darkGrey,
          size: 16.0,
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: boldtext(text: "Save", color: white, size: 14.0))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [customTextField(hint: "eg. BMW", label: "Product Name")],
        ),
      ),
    );
  }
}
