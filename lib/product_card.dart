import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final int price;
  final String img;
  const ProductCard({
    super.key,
    required this.price,
    required this.title,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(29, 219, 233, 1),
      child: Column(
        children: [
          Text(title),
          SizedBox(height: 5),
          Text("\$$price"),
          SizedBox(height: 5),
          Image(image: AssetImage(img), height: 210),
        ],
      ),
    );
  }
}
