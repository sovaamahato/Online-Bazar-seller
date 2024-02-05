import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar_seller/const/colors.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/controller/profile_controller.dart';
import 'package:online_bazar_seller/views/widgets/custom_textfield.dart';
import 'package:online_bazar_seller/views/widgets/loading_indicator.dart';

import '../widgets/text_style.dart';

class ShopSettings extends StatelessWidget {
  const ShopSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: boldtext(text: "Shop Settings", color: white, size: 16.0),
          actions: [
            controller.isloading.value
                ? loadingIndicator(circleColor: white)
                : TextButton(
                    onPressed: () async {
                      controller.isloading(true);
                      await controller.updateShop(
                        shopaddress: controller.shopAddressController.text,
                        shopname: controller.shopNameController.text,
                        shopmobile: controller.shopMobileController.text,
                        shopwebsite: controller.shopWebsiteController.text,
                        shopdesc: controller.shopDescController.text,
                      );
                      print(controller.shopAddressController.text);
                      VxToast.show(context, msg: "Shop Updated");
                    },
                    child: normalText(text: "Save", color: white)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            customTextField(
                label: "Shop Name ",
                controller: controller.shopNameController,
                hint: "eg. vendor name"),
            customTextField(
                label: "Shop Address ",
                hint: "eg. ",
                controller: controller.shopAddressController),
            customTextField(
                label: "Mobile ",
                hint: "89",
                controller: controller.shopMobileController),
            customTextField(
                label: "Shop website ",
                hint: "www.shop.com",
                controller: controller.shopWebsiteController),
            customTextField(
                label: "Description",
                hint: "Shop details",
                isDesc: true,
                controller: controller.shopDescController)
          ]),
        ),
      ),
    );
  }
}
