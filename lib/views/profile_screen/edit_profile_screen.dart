import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar_seller/const/colors.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/controller/profile_controller.dart';
import 'package:online_bazar_seller/views/widgets/custom_textfield.dart';
import 'package:online_bazar_seller/views/widgets/loading_indicator.dart';

import '../widgets/text_style.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;
  const EditProfileScreen({this.username});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<ProfileController>();

  @override
  void initState() {
    controller.nameController.text = widget.username!;
    super.initState();
  }
  // @override
  // void initState() {
  //   controller.nameController.text = widget.username;
  //   // print("----------------------");
  //   // print(widget.username!);
  //   // print(controller.nameController.text);
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: boldtext(text: "Edit Profile", color: white, size: 16.0),
          actions: [
            controller.isloading.value
                ? loadingIndicator(circleColor: white)
                : TextButton(
                    onPressed: () async {
                      controller.isloading(true);

                      //if new image is not selected for changing
                      //-----this image uploading part not working so comented------
                      // if (controller.profileImgPath.value.isNotEmpty) {
                      //   await controller.uploadProfileImage();
                      // } else {
                      controller.profileimageLink =
                          controller.snapshotData['imageUrl'];
                      // }

                      //if old password matches database
                      if (controller.snapshotData['password'] ==
                          controller.oldpassController.text) {
                        await controller.changeAuthPassword(
                            email: controller.snapshotData['email'],
                            password: controller.oldpassController.text,
                            newPassword: controller.newpassController.text);

                        await controller.updateProfile(
                            name: controller.nameController.text,
                            password: controller.newpassController.text,
                            imageUrl: controller.profileimageLink);
                        VxToast.show(context, msg: "Updated successfully");
                      } else if (controller
                              .oldpassController.text.isEmptyOrNull &&
                          controller.newpassController.text.isEmptyOrNull) {
                        await controller.updateProfile(
                            name: controller.nameController.text,
                            password: controller.snapshotData['password'],
                            imageUrl: controller.profileimageLink);
                        print("================================");
                        print(controller.nameController.text);

                        VxToast.show(context, msg: "Updated successfully");
                      } else {
                        VxToast.show(context, msg: "error occured");
                        controller.isloading(false);
                      }
                    },
                    child: normalText(text: "Save", color: white)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            controller.snapshotData['imageUrl'] == '' &&
                    controller.profileImgPath.isEmpty
                ? Image.asset(
                    imgProduct,
                    width: 70,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                : controller.snapshotData['imageUrl'] != '' &&
                        controller.profileImgPath.isEmpty
                    ? Image.network(
                        controller.snapshotData['imageUrl'],
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.file(
                        File(controller.profileImgPath.value),
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
            15.heightBox,
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: white),
                onPressed: () {
                  controller.changeImage(context);
                },
                child: normalText(text: "Change Image", color: fontGrey)),
            10.heightBox,
            const Divider(),
            10.heightBox,
            customTextField(
                label: "User Name",
                hint: "..",
                controller: controller.nameController),
            5.heightBox,
            Align(
                alignment: Alignment.centerLeft,
                child: boldtext(
                  text: "  Change Your Password",
                )),
            customTextField(
                label: "old Password",
                hint: "**********",
                controller: controller.oldpassController),
            customTextField(
                label: "new Password",
                hint: "**********",
                controller: controller.newpassController),
          ]),
        ),
      ),
    );
  }
}
