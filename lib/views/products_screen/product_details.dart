import 'package:flutter/material.dart';
import 'package:online_bazar_seller/const/colors.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

import '../../const/const.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldtext(text: 'Product title', color: fontGrey, size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
                autoPlay: true,
                height: 290,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Image.asset(
                    imgProduct,
                    //data['p_imgs'][index],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldtext(text: "Product title", color: fontGrey, size: 16.0)
                  // title!.text
                  //     .color(darkFontGrey)
                  //     .size(16)
                  //     .fontFamily(semibold)
                  //.make(),
                  ,
                  10.heightBox,
                  Row(
                    children: [
                      boldtext(
                        text: "category",
                        color: fontGrey,
                        size: 16.0,
                      ),
                      10.widthBox,
                      normalText(
                        text: "Subcategory",
                        color: fontGrey,
                        size: 16.0,
                      ),
                    ],
                  ),
                  10.heightBox,
                  //ratings
                  VxRating(
                    isSelectable: false,
                    value: 3.0,
                    //   value: double.parse(data['p_ratings']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    maxRating: 5,
                  ),
                  10.heightBox,
                  //price
                  boldtext(text: "3000", color: red, size: 18.0)
                  // "${data['p_price']}"
                  //     .numCurrency
                  //     .text
                  //     .fontFamily(bold)
                  //     .color(redColor)
                  //     .size(18)
                  //     .make(),
                  ,
                  20.heightBox,

                  //color choosing section
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: normalText(text: "Color", color: darkGrey),
                          ),
                          Row(
                              children: List.generate(
                            3,
                            (index) => VxBox()
                                .size(30, 30)
                                .roundedFull
                                .color(Vx.randomPrimaryColor)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 5))
                                .make()
                                .onTap(() {
                              //controller.changeColorIndex(index);
                            }),
                          ))
                        ],
                      ),
                      10.heightBox,
                      //quantity row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: normalText(
                              text: "Quantity",
                              color: darkGrey,
                            ),
                          ),
                          normalText(text: "20 items", color: fontGrey)
                        ],
                      )
                    ],
                  ).box.white.padding(const EdgeInsets.all(8)).make(),
                  const Divider(),
                  10.heightBox,
                  boldtext(text: "Description", color: fontGrey, size: 14.0),

                  normalText(
                    text: "This is a dummy item and dummy description .",
                    color: fontGrey,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
