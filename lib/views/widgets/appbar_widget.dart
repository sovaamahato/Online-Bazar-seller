import 'package:online_bazar_seller/const/const.dart';

import 'text_style.dart';
import 'package:intl/intl.dart' as intl;

AppBar appBarWidget(title) {
  return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        Center(
          child: normalText(
              text: intl.DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now()),
              color: purpleColor),
        ),
        10.widthBox,
      ],
      title: boldtext(text: title, color: darkGrey, size: 16.0));
}
