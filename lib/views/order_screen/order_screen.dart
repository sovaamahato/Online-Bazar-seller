import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/widgets/appbar_widget.dart';

import '../widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Orders"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: List.generate(
            20,
            (index) => ListTile(
              onTap: () {},
              tileColor: textfieldGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: boldtext(text: "Product code 23344", color: purpleColor),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: fontGrey,
                      ),
                      10.widthBox,
                      boldtext(
                          text: intl.DateFormat()
                              .add_yMd()
                              .format(DateTime.now()),
                          color: fontGrey),
                    ],
                  ),

                  Row(
                    children: [
                      const Icon(
                        Icons.payment,
                        color: fontGrey,
                      ),
                      10.widthBox,
                      normalText(text: "Unpaid", color: red),
                    ],
                  ),
                  //normalText(text: 'Rs.30000', color: darkGrey),
                ],
              ),
              trailing:
                  boldtext(text: "rs. 3000", color: purpleColor, size: 16.0),
            ).box.margin(const EdgeInsets.only(bottom: 4)).make(),
          )),
        ),
      ),
    );
  }
}
