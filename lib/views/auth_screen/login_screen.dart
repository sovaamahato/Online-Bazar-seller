import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/controller/auth_controller.dart';
import 'package:online_bazar_seller/views/home_screen/home.dart';
import 'package:online_bazar_seller/views/widgets/our_button.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

import '../widgets/loading_indicator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
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
            Obx(
              () => Column(
                children: [
                  TextFormField(
                    controller: controller.emailController,
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
                    obscureText: true,
                    controller: controller.passwordController,
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
                    child: controller.isLoading.value
                        ? Center(child: loadingIndicator())
                        : ourButton(
                            title: "Login",
                            onPress: () async {
                              // Get.to(() => const Home());

                              controller.isLoading(true);
                              await controller
                                  .loginMethod(context)
                                  .then((value) {
                                if (value != null) {
                                  VxToast.show(context,
                                      msg: "Logged in successfully");
                                  controller.emailController.clear();
                                  controller.passwordController.clear();
                                  controller.isLoading(false);
                                  Get.offAll(() => const Home());
                                } else {
                                  controller.isLoading(false);
                                }
                              });
                            },
                          ),
                  ),
                  10.heightBox,
                ],
              )
                  .box
                  .white
                  .roundedSM
                  .outerShadowMd
                  .padding(const EdgeInsets.all(8))
                  .make(),
            ),
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
