import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/profile_screen/edit_profile_screen.dart';
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
          TextButton(onPressed: () {}, child: normalText(text: "logout")),
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
