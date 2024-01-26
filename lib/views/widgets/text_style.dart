import 'package:online_bazar_seller/const/const.dart';

Widget normalText({text, color = Colors.white, size = 14.0}) {
  return "$text".text.color(color).size(size).make();
}

Widget boldtext({text, color = Colors.white, size = 14.0}) {
  return "$text".text.semiBold.color(color).size(size).make();
}
