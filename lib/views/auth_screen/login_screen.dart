import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            20.heightBox,
            Column(
              children: [TextFormField()],
            ).box.white.outerShadowMd.padding(const EdgeInsets.all(8)).make()
          ]),
        ),
      ),
    );
  }
}
