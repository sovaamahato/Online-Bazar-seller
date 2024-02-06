import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/services/store_services.dart';
import 'package:online_bazar_seller/views/products_screen/add_product.dart';
import 'package:online_bazar_seller/views/products_screen/product_details.dart';
import 'package:online_bazar_seller/views/widgets/appbar_widget.dart';
import 'package:online_bazar_seller/views/widgets/loading_indicator.dart';

import '../../controller/products_controller.dart';
import '../widgets/text_style.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductsController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        //----ad product button----------------------------------
        onPressed: () async {
          controller.getCategories();
          controller.populateCategoryList();
          Get.to(() => AddProduct());
        },
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
      appBar: appBarWidget("Products"),
      body: StreamBuilder(
        stream: StoreServices.getProducts(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    children: List.generate(
                  data.length,
                  (index) => Card(
                    child: ListTile(
                      onTap: () {
                        Get.to(() => ProductDetails(
                              data: data[index],
                            ));
                      },
                      title: boldtext(
                          text: "${data[index]['p_name']}", color: fontGrey),
                      subtitle: Row(children: [
                        normalText(
                            text: "Rs. ${data[index]['p_price']}",
                            color: darkGrey),
                        10.widthBox,
                        boldtext(
                            text: data[index]['is_featured'] == true
                                ? "Featured"
                                : "",
                            color: green)
                      ]),
                      leading: Image.network(
                        data[index]['p_imgs'][0],
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      //--------------------popup menu------------------------------------
                      trailing: VxPopupMenu(
                        child: Icon(Icons.more_vert_rounded),
                        clickType: VxClickType.singleClick,
                        menuBuilder: () => Column(
                          children: List.generate(
                            popupMenuIcons.length,
                            (i) => Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  //ICONS
                                  Icon(
                                    popupMenuIcons[i],
                                    color: data[index]['featured_id'] ==
                                                currentUser!.uid &&
                                            i == 0
                                        ? green
                                        : darkGrey,
                                  ),

                                  5.widthBox,
                                  normalText(
                                      text: data[index]['featured_id'] ==
                                                  currentUser!.uid &&
                                              i == 0
                                          ? "Remove Featured"
                                          : PopupMenuTitles[i],
                                      color: darkGrey)
                                  //
                                ],
                              ).onTap(() {
                                switch (i) {
                                  case 0:
                                    if (data[index]['is_featured'] == true) {
                                      controller.removeFeatured(data[index].id);
                                      VxToast.show(context, msg: "Removed");
                                    } else {
                                      controller.addFeatured(data[index].id);
                                      VxToast.show(context, msg: "Added");
                                    }
                                    break;
                                  case 1:
                                    break;
                                  case 2:
                                    controller.removeProduct(data[index].id);
                                    VxToast.show(context,
                                        msg: "product removed");
                                    break;
                                }
                              }),
                            ),
                          ),
                        ).box.roundedSM.white.width(200).make(),
                      ),
                    ),
                  ),
                )),
              ),
            );
          }
        },
      ),
    );
  }
}
