import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/controller/products_controller.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

Widget productDropdown(
    hint, List<String> list, dropvalue, ProductsController controller) {
  return Obx(
    () => DropdownButtonHideUnderline(
      child: DropdownButton(
        value: dropvalue.value == '' ? null : dropvalue.value,
        hint: normalText(text: '$hint', color: fontGrey),
        isExpanded: true,
        items: list.map((e) {
          return DropdownMenuItem(
            value: e,
            child: e.toString().text.make(),
          );
        }).toList(),
        onChanged: (newValue) {
          if (hint == "category") {
            controller.subcategoryvalue.value = '';
            controller.populateSubcategory(newValue.toString());
          }
          dropvalue.value = newValue.toString();
        },
      ),
    )
        .box
        .padding(const EdgeInsets.symmetric(horizontal: 4))
        .white
        .roundedSM
        .make(),
  );
}
