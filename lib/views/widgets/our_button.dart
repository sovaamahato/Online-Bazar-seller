import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

Widget ourButton({title, Color = purpleColor, onPress}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color,
      ),
      onPressed: onPress,
      child: boldtext(text: title, size: 16.0));
}
