import 'package:online_bazar_seller/const/colors.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

Widget dashBoradButton(context, {title, count, icon}) {
  var size = MediaQuery.of(context).size;
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            boldtext(text: title, size: 16.0),
            boldtext(text: count, size: 20.0)
          ],
        ),
      ),
      Image.asset(
        icon,
        color: white,
        width: 40,
      )
    ],
  )
      .box
      .color(purpleColor)
      .rounded
      .padding(const EdgeInsets.all(8))
      .size(
        size.width * 0.4,
        80,
      )
      .make();
}
