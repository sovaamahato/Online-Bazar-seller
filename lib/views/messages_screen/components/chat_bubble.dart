import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

Widget chatBubble() {
  return Directionality(
    textDirection: TextDirection.rtl,
    //textDirection:data['uid'] == currentUser!.uid ? TextDirection.rtl : TextDirection.ltr,
    child: Container(
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.only(bottom: 9),
      decoration: const BoxDecoration(
          color: red,
          //color: data['uid'] == currentUser!.uid ? redColor : darkFontGrey,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomRight:
                  //data['uid'] == currentUser!.uid
                  //     ?
                  const Radius.circular(0),
              //     : const Radius.circular(20),
              bottomLeft:
                  // data['uid'] == currentUser!.uid
                  //     ?
                  const Radius.circular(20)
              // :const Radius.circular(0),
              )),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //"${data['msg']}".text.size(16).white.make(),
        normalText(text: "Your message"),
        10.heightBox,
        normalText(text: "10:45"),
        //time.text.color(whiteColor.withOpacity(0.5)).make(),
      ]),
    ),
  );
}
