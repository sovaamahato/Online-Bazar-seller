import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/home_screen/home.dart';
import 'package:online_bazar_seller/views/widgets/our_button.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            30.heightBox,
            normalText(
              text: welcome,
              size: 18.0,
            ),
            Row(
              children: [
                Image.asset(
                  icLogo,
                  width: 80,
                  height: 70,
                )
                    .box
                    .border(color: white)
                    .rounded
                    .padding(const EdgeInsets.all(8))
                    .make(),
                10.widthBox,
                boldtext(text: appname, size: 20.0)
              ],
            ),
            60.heightBox,
            Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: purpleColor,
                      ),
                      border: InputBorder.none,
                      hintText: "Enter Email"),
                ),
                10.heightBox,
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: purpleColor,
                      ),
                      border: InputBorder.none,
                      hintText: "*********"),
                ),
                10.heightBox,
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () {},
                      child: normalText(
                          text: "Forgot Password?", color: purpleColor)),
                ),
                5.heightBox,
                SizedBox(
                    width: context.screenWidth - 100,
                    child: ourButton(
                        title: "Login",
                        onPress: () {
                          Get.to(() => const Home());
                        })),
                10.heightBox,
              ],
            )
                .box
                .white
                .roundedSM
                .outerShadowMd
                .padding(const EdgeInsets.all(8))
                .make(),
            10.heightBox,
            Center(
              child: normalText(
                  color: lightGrey,
                  text: "In case of any difficulty, contact administrator"),
            ),
            const Spacer(),
            Center(child: boldtext(text: credit)),
            10.heightBox
          ]),
        ),
      ),
    );
  }
}
