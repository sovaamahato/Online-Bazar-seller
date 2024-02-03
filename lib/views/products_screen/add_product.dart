import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/products_screen/components/product_dropdown.dart';
import 'package:online_bazar_seller/views/products_screen/components/product_images.dart';
import 'package:online_bazar_seller/views/widgets/custom_textfield.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: boldtext(
          text: "Add product",
          color: white,
          size: 16.0,
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: boldtext(text: "Save", color: white, size: 14.0))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextField(
                hint: "eg. BMW",
                label: "Product Name",
              ),
              customTextField(
                hint: "eg. good product",
                label: "Description",
                isDesc: true,
              ),
              customTextField(
                hint: "eg. 100",
                label: "Price",
              ),
              customTextField(
                hint: "eg. 20",
                label: "Quantity",
              ),

              //dropdowns-----
              10.heightBox,
              productDropdown(),
              10.heightBox,
              productDropdown(),

              10.heightBox,
              const Divider(),
              boldtext(
                text: "Choose product images",
              ),

              //imagesss-------
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    3,
                    (index) => productImages(
                          label: "${index + 1}",
                        )),
              ),

              5.heightBox,
              normalText(
                  text: "first images will be your display iamge ",
                  color: lightGrey),
              10.heightBox,
              const Divider(),
              boldtext(
                text: "Choose product Colors",
              ),
              10.heightBox,
              Wrap(
                spacing: 7.0,
                runSpacing: 8.0,
                children: List.generate(
                    9,
                    (index) => Stack(
                          alignment: Alignment.center,
                          children: [
                            VxBox()
                                .color(Vx.randomPrimaryColor)
                                .roundedFull
                                .size(50, 50)
                                .make(),
                            const Icon(
                              Icons.done,
                              color: white,
                            )
                          ],
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
