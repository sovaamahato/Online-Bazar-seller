import 'package:online_bazar_seller/const/const.dart';

class StoreServices {
  static getProfiles(uid) {
    return firestore
        .collection(vendorsCollection)
        .where('id', isEqualTo: uid)
        .get();
  }
}
