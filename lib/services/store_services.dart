import 'package:online_bazar_seller/const/const.dart';

class StoreServices {
  static getProfiles(uid) {
    return firestore
        .collection(vendorsCollection)
        .where('id', isEqualTo: uid)
        .get();
  }

  // static getCounts() async {
  //   var res = await Future.wait([
  //     firestore
  //         .collection("cart")
  //         .where('vendor_id', isEqualTo: currentUser!.uid)
  //         .get()
  //         .then((value) {
  //       return value.docs.length;
  //     }),
  //   ]);
  // }

  static getmessages() {
    return firestore
        .collection(chatsCollection)
        .where('toId', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  static getOrders(uid) {
    return firestore
        .collection(ordersCollection)
        .where('vendors', arrayContains: uid)
        .snapshots();
  }

  static getProducts(uid) {
    return firestore
        .collection(productsCollection)
        .where('vendor_id', isEqualTo: uid)
        .snapshots();
  }

  //get all chat messages
  static getChatmessages(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }
}
