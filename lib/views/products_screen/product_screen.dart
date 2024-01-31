import 'package:online_bazar_seller/const/const.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: "Product".text.color(purpleColor).make()),
      body: Container(color: purpleColor),
    );
  }
}
