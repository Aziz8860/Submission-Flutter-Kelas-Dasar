import 'package:vitamins_app/components/fav_btn.dart';
import 'package:vitamins_app/components/price.dart';
import 'package:vitamins_app/constants.dart';
import 'package:vitamins_app/models/Product.dart';
import 'package:flutter/material.dart';

import 'components/cart_counter.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {Key? key, required this.product, required this.onProductAdd})
      : super(key: key);

  final Product product;
  final VoidCallback onProductAdd;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String _cartTag = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: ElevatedButton(
              onPressed: () {
                widget.onProductAdd();
                setState(() {
                  _cartTag = '_cartTag';
                });
                Navigator.pop(context);
              },
              child: Text("Add to Cart"),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: Color(0xFFF8F8F8),
                  child: Hero(
                    tag: widget.product.title! + _cartTag,
                    child: Image.asset(widget.product.image!),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  child: CartCounter(),
                )
              ],
            ),
          ),
          SizedBox(height: defaultPadding * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.title!,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Price(amount: "10.000"),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
                "Manfaat vitamin cecara umum untuk kesehatan tubuh sangat beragam. Vitamin sendiri memiliki fungsi yang membantu mengatur metabolisme, mencegah penyakit kronis, memelihara nafsu makan, kesehatan mental dan kekebalan tubuh. ",
                style: TextStyle(
                  color: Color(0xFFBDBDBD),
                  height: 1.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: BackButton(
        color: Colors.black,
      ),
      backgroundColor: Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Suplemen",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Expanded(child: FavBtn(radius: 20)),
        SizedBox(width: defaultPadding),
      ],
    );
  }
}