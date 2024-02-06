import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/services/store_services.dart';
import 'package:online_bazar_seller/views/products_screen/product_details.dart';
import 'package:online_bazar_seller/views/widgets/dashboard_button.dart';
import 'package:online_bazar_seller/views/widgets/loading_indicator.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as intl;

import '../widgets/appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("dashBoard"),
      body: StreamBuilder(
        stream: StoreServices.getProducts(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs;
            data = data.sortedBy((a, b) =>
                b['p_wishlist'].length.compareTo(a['p_wishlist'].length));
            //print(n);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        dashBoradButton(context,
                            title: "products",
                            count: "${data.length}",
                            icon: icProducts),
                        dashBoradButton(context,
                            title: "Orders", count: "", icon: icOrders),
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
                    boldtext(
                        text: 'popular products', color: fontGrey, size: 16.0),
                    20.heightBox,
                    ListView(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                        data.length,
                        (index) => data[index]['p_wishlist'].length == 0
                            ? const SizedBox()
                            : ListTile(
                                onTap: () {
                                  Get.to(() => ProductDetails(
                                        data: data[index],
                                      ));
                                },
                                title: boldtext(
                                    text: "${data[index]['p_name']}",
                                    color: fontGrey),
                                subtitle: normalText(
                                    text: "Rs .${data[index]['p_price']}",
                                    color: darkGrey),
                                leading: Image.network(
                                  data[index]['p_imgs'][0],
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                  ]),
            );
          }
        },
      ),
    );
  }
}
