import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

Widget orderPlacedDetails({title1, title2, d1, d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //col 1
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldtext(text: "$title1", color: purpleColor),
            boldtext(text: "$d1", color: red),
          ],
        ),
        //col2
        SizedBox(
          width: 135,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldtext(text: "$title2", color: purpleColor),
              boldtext(text: "$d2", color: fontGrey)
            ],
          ),
        )
      ],
    ),
  );
}
