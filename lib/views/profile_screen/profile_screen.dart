import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/controller/auth_controller.dart';
import 'package:online_bazar_seller/views/auth_screen/login_screen.dart';
import 'package:online_bazar_seller/views/messages_screen/messages.dart';
import 'package:online_bazar_seller/views/profile_screen/edit_profile_screen.dart';
import 'package:online_bazar_seller/views/shop_settings/shop_settings.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldtext(text: "Settings", size: 16.0),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => EditProfileScreen());
              },
              icon: const Icon(Icons.edit)),
          TextButton(
              onPressed: () async {
                await Get.find<AuthController>().signoutmethod(context);
                Get.offAll(() => const LoginScreen());
                print("clickkkkkkkkkkkkkkkkkkkkkkkkked");
              },
              child: normalText(text: "logout")),
        ],
      ),
      body: Column(children: [
        //user image -------------------
        ListTile(
          leading: Image.asset(imgProduct)
              .box
              .roundedFull
              .clip(Clip.antiAlias)
              .make(),
          title: boldtext(text: "Vendor name"),
          subtitle: normalText(text: "vendor@gmail.com"),
        ),
        Divider(),
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
      ]),
    );
  }
}
