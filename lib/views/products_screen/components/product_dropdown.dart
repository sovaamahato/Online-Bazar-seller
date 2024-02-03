import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

Widget productDropdown() {
  return DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      value: null,
      hint: normalText(text: 'Choose category', color: fontGrey),
      isExpanded: true,
      items: [],
      onChanged: (value) {},
    ),
  )
      .box
      .padding(const EdgeInsets.symmetric(horizontal: 4))
      .white
      .roundedSM
      .make();
}
