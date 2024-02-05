import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/controller/orders_controller.dart';
import 'package:online_bazar_seller/views/widgets/our_button.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;
import 'components/order_placed_details.dart';

class OrderDetails extends StatefulWidget {
  final dynamic data;
  const OrderDetails({super.key, required this.data});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var controller = Get.find<OrdersController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getOrders(widget.data);
    controller.confirmed.value = widget.data['order_confirmed'];
    controller.ondelivery.value = widget.data['order_on_delivery'];
    controller.delivered.value = widget.data['order_delivered'];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: boldtext(text: 'Order Details', color: darkGrey),
        ), //-------------------------confirm button--------------

        bottomNavigationBar: Visibility(
          visible: !controller.confirmed.value,
          child: SizedBox(
            height: 60,
            width: context.screenWidth,
            child: ourButton(
                onPress: () {
                  controller.confirmed(true);
                  controller.changeStatus(
                      title: "order_confirmed",
                      status: true,
                      docID: widget.data.id);
                },
                title: "confirm order",
                Color: green),
          ),
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(children: [
                //order delivery sections---------------------------
                Visibility(
                  visible: controller.confirmed.value,
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
                        value: controller.confirmed.value,
                        onChanged: (value) {
                          controller.confirmed.value = value;
                          controller.changeStatus(
                              title: "order_confirmed",
                              status: value,
                              docID: widget.data.id);
                        },
                        title: boldtext(text: "Confirmed", color: fontGrey),
                      ),
                      SwitchListTile(
                        activeColor: green,
                        value: controller.ondelivery.value,
                        onChanged: (value) {
                          controller.ondelivery.value = value;

                          controller.changeStatus(
                              title: "order_on_delivery",
                              status: value,
                              docID: widget.data.id);
                        },
                        title: boldtext(text: "On delivery", color: fontGrey),
                      ),
                      SwitchListTile(
                        activeColor: green,
                        value: controller.delivered.value,
                        onChanged: (value) {
                          controller.delivered.value = value;
                          controller.changeStatus(
                              title: "order_delivered",
                              status: value,
                              docID: widget.data.id);
                        },
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
                        d2: "${widget.data['shipping_method']}",
                        d1: "${widget.data['order_code']}",
                        title1: "Order code",
                        title2: "Shipping method"),
                    orderPlacedDetails(
                        d1: intl.DateFormat()
                            .add_yMd()
                            .format(widget.data['order_date'].toDate()),
                        d2: "${widget.data['payment_method']}",
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
                                    text: "Shipping Address",
                                    color: purpleColor),

                                // "Shipping Address"
                                //     .text
                                //     // .fontFamily(semibold)
                                //     .size(17)
                                //     .make(),
                                "${widget.data['order_by_name']}".text.make(),
                                "${widget.data['order_by_email']}".text.make(),
                                "${widget.data['order_by_address']}"
                                    .text
                                    .make(),
                                "${widget.data['order_by_city']}".text.make(),
                                "${widget.data['order_by_state']}".text.make(),
                                "${widget.data['order_by_phone']}".text.make(),
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
                                boldtext(
                                    text: "Rs. ${widget.data['total_amount']}",
                                    size: 16.0,
                                    color: red),
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
                  children: List.generate(controller.orders.length, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlacedDetails(
                            title1: "${controller.orders[index]['title']}",
                            title2: " Rs.${controller.orders[index]['tprice']}",
                            d1: "${controller.orders[index]['qty']} x",
                            d2: "Refundable"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: 25,
                            height: 20,
                            color: Color(controller.orders[index]['color']),
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
      ),
    );
  }
}
