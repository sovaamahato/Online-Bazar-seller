import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/views/widgets/appbar_widget.dart';

import '../widgets/text_style.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
      appBar: appBarWidget("Products"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: List.generate(
            20,
            (index) => ListTile(
              onTap: () {},
              title: boldtext(text: "Product title", color: fontGrey),
              subtitle: normalText(text: 'Rs.30000', color: darkGrey),
              leading: Image.asset(
                imgProduct,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          )),
        ),
      ),
    );
  }
}
