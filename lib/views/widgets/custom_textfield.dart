import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

Widget customTextField({label, controller, hint, isDesc = false}) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: TextFormField(
      maxLines: isDesc ? 4 : 1,
      decoration: InputDecoration(
        isDense: true,
        label: normalText(
          text: label,
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: fontGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: white,
          ),
        ),
      ),
    ),
  );
}
