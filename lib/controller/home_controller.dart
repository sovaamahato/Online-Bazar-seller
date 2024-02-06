import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUsername();
  }

  var navIndex = 0.obs;
  var username = '';
  getUsername() async {
    var n = await firestore
        .collection(vendorsCollection)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['vendor_name'];
      }
    });
    username = n;
    print("---------------------------");
    print(username);
  }
}
