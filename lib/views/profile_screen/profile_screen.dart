import 'package:online_bazar_seller/const/const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "Hello".text.color(purpleColor).make()),
      body: Container(color: Vx.randomColor),
    );
  }
}
