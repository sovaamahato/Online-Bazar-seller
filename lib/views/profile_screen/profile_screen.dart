import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/controller/auth_controller.dart';
import 'package:online_bazar_seller/controller/profile_controller.dart';
import 'package:online_bazar_seller/services/store_services.dart';
import 'package:online_bazar_seller/views/auth_screen/login_screen.dart';
import 'package:online_bazar_seller/views/messages_screen/messages.dart';
import 'package:online_bazar_seller/views/profile_screen/edit_profile_screen.dart';
import 'package:online_bazar_seller/views/shop_settings/shop_settings.dart';
import 'package:online_bazar_seller/views/widgets/loading_indicator.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldtext(text: "Settings", size: 16.0),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const EditProfileScreen());
              },
              icon: const Icon(Icons.edit)),
          TextButton(
              onPressed: () async {
                await Get.find<AuthController>().signoutmethod(context);
                Get.offAll(() => const LoginScreen());
              },
              child: normalText(text: "logout")),
        ],
      ),
      body: FutureBuilder(
        future: StoreServices.getProfiles(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator(circleColor: white);
          } else {
            controller.snapshotData = snapshot.data!.docs[0];
            return Column(children: [
              //user image -------------------
              ListTile(
                leading: Image.asset(imgProduct)
                    .box
                    .roundedFull
                    .clip(Clip.antiAlias)
                    .make(),
                title:
                    boldtext(text: "${controller.snapshotData['vendor_name']}"),
                subtitle:
                    normalText(text: "${controller.snapshotData['email']}"),
              ),
              const Divider(),
              10.heightBox,

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: List.generate(
                      profileButtonIcons.length,
                      (index) => ListTile(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Get.to(() => const ShopSettings());
                                case 1:
                                  Get.to(() => const MessagesScreen());
                              }
                            },
                            leading: Icon(
                              profileButtonIcons[index],
                              color: white,
                            ),
                            title: normalText(text: profileButtonTitles[index]),
                          )),
                ),
              )
            ]);
          }
        },
      ),
    );
  }
}
