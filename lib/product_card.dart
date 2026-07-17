import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final int price;
  final String img;
  final Color bgcolor;
  const ProductCard({
    super.key,
    required this.price,
    required this.title,
    required this.img,
    required this.bgcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: bgcolor,
        //color: Color.fromRGBO(165, 234, 239, 1),
      ),
      child: Column(
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 5),
          Text(
            "Starting at \$$price",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          //SizedBox(height: 5),
          Image(image: AssetImage(img), height: 440, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
