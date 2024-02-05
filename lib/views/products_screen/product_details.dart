import 'package:flutter/material.dart';
import 'package:online_bazar_seller/const/colors.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

import '../../const/const.dart';

class ProductDetails extends StatelessWidget {
  final dynamic data;
  const ProductDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldtext(text: "${data['p_name']}", color: fontGrey, size: 16.0),
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
                itemCount: data['p_imgs'].length,
                itemBuilder: (context, index) {
                  return Image.network(
                    data['p_imgs'][index],
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
                  boldtext(
                      text: "${data['p_name']}", color: fontGrey, size: 16.0)
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
                        text: "${data['p_category']}",
                        color: fontGrey,
                        size: 16.0,
                      ),
                      10.widthBox,
                      normalText(
                        text: "${data['p_subcategory']}",
                        color: fontGrey,
                        size: 16.0,
                      ),
                    ],
                  ),
                  10.heightBox,
                  //ratings
                  VxRating(
                    isSelectable: false,
                    value: double.parse(data['p_ratings']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    maxRating: 5,
                  ),
                  10.heightBox,
                  //price
                  boldtext(
                      text: "Rs. ${data['p_price']}", color: red, size: 18.0),
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
                                .color(Color(data['p_colors'][index]))
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
                          normalText(
                              text: "${data['p_quantity']}", color: fontGrey)
                        ],
                      )
                    ],
                  ).box.white.padding(const EdgeInsets.all(8)).make(),
                  const Divider(),
                  10.heightBox,
                  boldtext(text: "Description", color: fontGrey, size: 14.0),

                  normalText(
                    text: "${data['p_desc']}",
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
