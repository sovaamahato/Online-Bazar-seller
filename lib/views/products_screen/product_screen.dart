import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/products_screen/add_product.dart';
import 'package:online_bazar_seller/views/products_screen/product_details.dart';
import 'package:online_bazar_seller/views/widgets/appbar_widget.dart';

import '../widgets/text_style.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {
          Get.to(() => const AddProduct());
        },
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
      appBar: appBarWidget("Products"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: List.generate(
            20,
            (index) => Card(
              child: ListTile(
                onTap: () {
                  Get.to(() => const ProductDetails());
                },
                title: boldtext(text: "Product title", color: fontGrey),
                subtitle: Row(children: [
                  normalText(text: 'Rs.30000', color: darkGrey),
                  10.widthBox,
                  boldtext(text: "Featured", color: green)
                ]),
                leading: Image.asset(
                  imgProduct,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                trailing: VxPopupMenu(
                  child: Icon(Icons.more_vert_rounded),
                  clickType: VxClickType.singleClick,
                  menuBuilder: () => Column(
                    children: List.generate(
                      popupMenuIcons.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            //ICONS
                            Icon(popupMenuIcons[index]),
                            5.widthBox,
                            normalText(
                                text: PopupMenuTitles[index], color: darkGrey)
                            //
                          ],
                        ).onTap(() {}),
                      ),
                    ),
                  ).box.roundedSM.white.width(200).make(),
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
