import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

Widget customTextField({label, controller, hint}) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: TextFormField(
      decoration: InputDecoration(
        isDense: true,
        label: normalText(text: label),
        hintText: hint,
        hintStyle: TextStyle(color: lightGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: white,
          ),
        ),
      ),
    ),
  );
}
