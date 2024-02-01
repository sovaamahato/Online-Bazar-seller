import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/widgets/dashboard_button.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Center(
              child: normalText(
                  text: intl.DateFormat('EEE, MMM d, ' 'yy')
                      .format(DateTime.now()),
                  color: purpleColor),
            ),
            10.widthBox,
          ],
          title: boldtext(text: "Dashboard", color: darkGrey, size: 16.0)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              dashBoradButton(context,
                  title: "products", count: 16.0, icon: icProducts),
              dashBoradButton(context,
                  title: "Orders", count: 15.0, icon: icOrders),
            ],
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              dashBoradButton(context,
                  title: "Ratings", count: 16.0, icon: icStar),
              dashBoradButton(context,
                  title: "Total Sales", count: 15.0, icon: icOrders),
            ],
          ),
          10.heightBox,
          const Divider(),
          10.heightBox,
          boldtext(text: 'popular products', color: fontGrey, size: 16.0),
          20.heightBox,
          ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(
              3,
              (index) => ListTile(
                onTap: () {},
                title: boldtext(text: "Product title", color: fontGrey),
                subtitle: normalText(text: 'Rs.30000', color: darkGrey),
                leading: Image.asset(
                  imgProduct,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
