import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/widgets/our_button.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;
import 'components/order_placed_details.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldtext(text: 'Order Details', color: darkGrey),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: ourButton(onPress: () {}, title: "confirm order", Color: green),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(children: [
              //order delivery sections---------------------------
              Visibility(
                visible: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldtext(
                      text: "Order status",
                      size: 16.0,
                      color: fontGrey,
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: boldtext(text: "Placed", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: boldtext(text: "Confirmed", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldtext(text: "On delivery", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldtext(text: "Delivered", color: fontGrey),
                    ),
                  ],
                )
                    .box
                    .outerShadowMd
                    .padding(EdgeInsets.all(8))
                    .border(color: lightGrey)
                    .roundedSM
                    .white
                    .make(),
              ),
              //order details sections
              Column(
                children: [
                  orderPlacedDetails(
                      d2: "data['shipping_method']",
                      d1: "data['order_code']",
                      title1: "Order code",
                      title2: "Shipping method"),
                  orderPlacedDetails(
                      d1: DateTime.now(),
                      // d1: intl.DateFormat()
                      //     .add_yMd()
                      //     .format(data['order_date'].toDate()),
                      d2: "data['payment_method']",
                      title1: "Order Date",
                      title2: "Payment method"),
                  orderPlacedDetails(
                      d1: "unpaid",
                      d2: "Order Placed",
                      title1: "Payment status",
                      title2: "Delivery status"),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldtext(
                                  text: "Shipping Address", color: purpleColor),

                              // "Shipping Address"
                              //     .text
                              //     // .fontFamily(semibold)
                              //     .size(17)
                              //     .make(),
                              "{data['order_by_name']}".text.make(),
                              "{data['order_by_email']}".text.make(),
                              "{data['order_by_address']}".text.make(),
                              "{data['order_by_city']}".text.make(),
                              "{data['order_by_state']}".text.make(),
                              "{data['order_by_phone']}".text.make(),
                              //"${data['order_by_postalcode']}".text.make(),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 135,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldtext(
                                  text: "Total Amount", color: purpleColor),
                              boldtext(text: "400", size: 16.0, color: red),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
                  .box
                  .outerShadowMd
                  .border(color: lightGrey)
                  .roundedSM
                  .white
                  .make(),

              //ordered product

              10.heightBox,
              boldtext(text: "Ordered Product", color: fontGrey, size: 16.0),

              10.heightBox,
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(3, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderPlacedDetails(
                          title1: "data['orders'][index]['title']",
                          title2: " data['orders'][index]['tprice']",
                          d1: "{data['orders'][index]['qty']} x",
                          d2: "Refundable"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: 25,
                          height: 20,
                          color: purpleColor,
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                }).toList(),
              )
                  .box
                  .outerShadowMd
                  .margin(const EdgeInsets.only(bottom: 4))
                  .white
                  .make(),
              20.heightBox,
            ]),
          )),
    );
  }
}
